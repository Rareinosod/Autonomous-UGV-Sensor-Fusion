#include <16F887.h>
#device ICD=TRUE
#device ADC=10
#fuses HS, NOLVP, NOWDT
#use delay(clock=20000000)
#use rs232 (stream=BT, baud=9600, xmit=PIN_A1, rcv=PIN_A3)
//#use rs232 (stream=BT, baud=38400, xmit=PIN_A1, rcv=PIN_A3)

#include <math.h>

#define AS5600_ADDRESS 0x36
#define AS5600_ANGLE   0x0E

#use i2c(Master, SDA=PIN_D1, SCL=PIN_D0, FAST=100000, STREAM=I2C_1)

#use i2c(Master, SDA=PIN_C4, SCL=PIN_C3, FAST=100000, STREAM=I2C_2)

// Pin motori
#define motoresx PIN_E2 //M
#define motoredx PIN_E0 //F


int ciclo;
long lettura_bit;
int16 thsx = 1500;  
int16 thdx = 1500; 


void leggi_angolo(int8 address, int stream_id) {
   int8 msb1, lsb1, msb2, lsb2;


   if (stream_id == 1) { 
      i2c_start(I2C_1);
      i2c_write(I2C_1, address << 1 | 0);
      i2c_write(I2C_1, AS5600_ANGLE);
      i2c_start(I2C_1);
      i2c_write(I2C_1, address << 1 | 1);
      msb1 = i2c_read(I2C_1, 1); 
      lsb1 = i2c_read(I2C_1, 0); 
      i2c_stop(I2C_1);
      putc(0xAA, BT);     // Byte di start
      putc(msb1, BT);
      putc(lsb1, BT);

   }
   else { 
      i2c_start(I2C_2);
      i2c_write(I2C_2, address << 1 | 0);
      i2c_write(I2C_2, AS5600_ANGLE);
      i2c_start(I2C_2);
      i2c_write(I2C_2, address << 1 | 1);
      msb2 = i2c_read(I2C_2, 1);
      lsb2 = i2c_read(I2C_2, 0);
      i2c_stop(I2C_2);
      putc(msb2, BT);
      putc(lsb2, BT);

   }
}

#int_timer2                               
void timer2_isr() {
   if (ciclo >= 1 && ciclo <= 2) {
      output_high(motoresx);
      delay_us(thsx); 
      output_low(motoresx);
      output_high(motoredx);
      delay_us(thdx); 
      output_low(motoredx);
      
      ciclo++;
   } else {
      leggi_angolo(AS5600_ADDRESS, 1);
      leggi_angolo(AS5600_ADDRESS, 2);
      
      lettura_bit = read_adc();
      int8 msb_lidar = (lettura_bit >> 8) & 0xFF;
      int8 lsb_lidar = lettura_bit & 0xFF;
      //putc(0xAB, BT);  // Start byte per LiDAR (ADC)
      putc(msb_lidar, BT);
      putc(lsb_lidar, BT);
      //putc(make8(lettura_bit, 1), BT); // MSB
      //putc(make8(lettura_bit, 0), BT); // LSB
      ciclo = 1;
   }
}


void main() {
   setup_timer_2(T2_DIV_BY_16, 196, 16);  
   enable_interrupts(int_timer2);        
   enable_interrupts(global);
   setup_adc_ports(sAN2);                 
   setup_adc(ADC_CLOCK_INTERNAL);         
   set_adc_channel(2);
   
   ciclo = 1;
   thsx = 1500;
   thdx = 1500;

#define PACKET_SIZE 5
int8 buffer[PACKET_SIZE];
int8 index = 0;
int1 sync = 0;

int8 ack = 0;
int16 th_r_lsb, th_r_msb, th_l_lsb, th_l_msb, th_vel, th_vel_msb, th_vel_lsb;


   while (TRUE) {
      if (kbhit(BT)) {
         ack = getc(BT);
         if (ack == 1) {
            disable_interrupts(int_timer2);
            th_r_lsb = getc(BT);
            th_r_msb = getc(BT) << 8;
            th_l_lsb = getc(BT);
            th_l_msb = getc(BT) << 8;
            thdx = th_r_msb | th_r_lsb;
            thsx = th_l_msb | th_l_lsb;
            enable_interrupts(int_timer2);
            ack = 0;
         }
         else if (ack == 170) {
            th_vel_lsb = getc(BT);
            th_vel_msb = getc(BT);

            th_vel = (int16)((th_vel_msb << 8) | th_vel_lsb);

         
            int16 new_thdx = thdx - th_vel; // Nota: -th_vel perché motore dx usa verso opposto
            int16 new_thsx = thsx + th_vel;
         
            // Verifica se entrambi i motori possono essere aggiornati senza cambiare verso e rimanendo nei limiti
            int1 dx_valido = ((thdx > 1500 && new_thdx > 1500) || (thdx < 1500 && new_thdx < 1500)) &&
                             (new_thdx >= 1300 && new_thdx <= 1700);
         
            int1 sx_valido = ((thsx > 1500 && new_thsx > 1500) || (thsx < 1500 && new_thsx < 1500)) &&
                             (new_thsx >= 1300 && new_thsx <= 1700);
         
            // Applica l'aggiornamento solo se entrambi i motori sono validi
            if (dx_valido && sx_valido) {
               thdx = new_thdx;
               thsx = new_thsx;
            }
            ack = 0;
         }
      }      
   }
   
}
