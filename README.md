# Autonomous-UGV-Sensor-Fusion
Sviluppo in MATLAB di logiche per la teleoperazione via Bluetooth e la scansione ambientale per la ricostruzione offline della mappa (2D mapping). • Implementazione della navigazione autonoma tramite Filtro di Kalman per la correzione della stima dello stato e l'odometria, fondendo in tempo reale dati encoder e LiDAR.



# Visual-Tracking e State Estimation: Robotica Mobile

Questo repository contiene l'intero stack software per il controllo, l'acquisizione dati e la stima dello stato (localizzazione) di un robot mobile a trazione differenziale. Il progetto integra la programmazione a basso livello (microcontrollore PIC) con l'elaborazione ad alto livello e l'interfaccia grafica (MATLAB).

---

## Architettura dei Codici

Il progetto si compone di 4 file/script fondamentali. Di seguito la documentazione dettagliata per ciascuno.

### 1. Script di Analisi Offline ed EKF (`analisi_offline.m`)
**Cosa fa:** 
Esegue la localizzazione del robot elaborando un set di dati pre-registrato (`dati_encoder.mat`). Mette a confronto la traiettoria calcolata tramite pura odometria (dead reckoning) con la traiettoria ottimizzata da un Filtro di Kalman Esteso (EKF).

**Perché è presente:** 
Permette di effettuare il *tuning* (calibrazione) delle matrici di covarianza ($P, Q, R$) e dei parametri del LIDAR in un ambiente controllato. È fondamentale per assicurarsi che la matematica del filtro funzioni prima di testarla in tempo reale sul robot.

**Come funziona nel dettaglio:**
*   **Filtraggio Dati (Cleaning):** Carica le letture raw di LIDAR ed encoder. Rimuove gli *outlier* (valori anomali) dal LIDAR scartando i dati che si discostano di oltre 3 deviazioni standard (`z_thresh = 3`) e applica una media mobile per "lisciare" il segnale.
*   **Calibrazione LIDAR:** Converte la tensione (dedotta dai bit dell'ADC) in una distanza metrica reale utilizzando un modello di regressione di potenza non lineare: $distanza = (V/a)^{1/b}$.
*   **Modello Cinematico:** Converte i tick degli encoder in radianti gestendo il *rollover* a 4096 (il giro completo dell'encoder). Calcola l'avanzamento lineare ($\Delta s$) e la rotazione ($\Delta 	heta$). Applica il metodo di **Runge-Kutta** per aggiornare accuratamente la posa odometrica.
*   **Filtro di Kalman (EKF):** Fonde la predizione odometrica con la misura del LIDAR (usato per rilevare la distanza da una parete di riferimento laterale, `Y_wall = 0`). Include una funzione `adattive_w` per ridurre il peso della correzione LIDAR se il robot legge un ostacolo imprevisto, rendendo il filtro robusto.

---

### 2. Firmware del Microcontrollore (`firmware_PIC16F887.c`)
**Cosa fa:** 
Costituisce il "cervello" a basso livello installato fisicamente sul robot. Legge continuamente i sensori e invia i dati a MATLAB, mentre contemporaneamente riceve comandi da MATLAB per pilotare i motori.

**Perché è presente:** 
Un computer standard (con MATLAB) non può generare direttamente i segnali elettrici PWM temporizzati né leggere tensioni analogiche con la precisione temporale richiesta. Il PIC funge da ponte hardware/software indispensabile.

**Come funziona nel dettaglio:**
*   **Acquisizione Sensori:** Interroga via I2C (`AS5600_ADDRESS`) due sensori magnetici per leggere l'angolo delle due ruote e interroga l'ADC integrato (canale 2) per leggere la tensione analogica restituita dal sensore LIDAR.
*   **Controllo Motori (PWM Software):** Sfruttando l'interrupt del Timer2 (`timer2_isr`), il codice genera a ciclo continuo impulsi precisi della durata di $\sim 1500 \mu s$ (valore di riposo per i servomotori a rotazione continua). Variando il tempo in alto (`thsx` e `thdx`), regola la velocità delle singole ruote.
*   **Protocollo Seriale (Bluetooth):** Implementa un protocollo di comunicazione robusto. Trasmette pacchetti seriali formattati con un byte di start (`0xAA`) seguito dai dati di encoder e LIDAR spezzati in MSB (Most Significant Byte) ed LSB (Least Significant Byte). Quando riceve istruzioni via Bluetooth (byte di riconoscimento `1` o `170`), disattiva temporaneamente gli interrupt per aggiornare in sicurezza i registri di velocità dei motori evitando corruzioni nei dati.

---

### 3. Interfaccia Grafica di Controllo (`Gui.m`)
**Cosa fa:** 
È il pannello di controllo front-end (GUI creata con GUIDE di MATLAB). Permette all'utente di connettersi al robot via Bluetooth e di guidarlo come con un joystick tramite l'uso di pulsanti direzionali.

**Perché è presente:** 
Traduce l'intenzione di movimento dell'utente (es. "Vai a destra", "Fermati") in complesse istruzioni di tensione per i motori in base alla cinematica differenziale del robot.

**Come funziona nel dettaglio:**
*   **Connessione:** Tramite il pulsante di connessione, inizializza un oggetto Bluetooth diretto al modulo `"GRUPPO8"` e lo salva nel Workspace globale per poter essere richiamato da altre funzioni.
*   **Cinematica Inversa:** Ogni funzione callback (W, A, S, D, Q, E, ecc.) definisce un set target di velocità lineare ($v$) e velocità angolare ($\omega$). Usa le formule del robot a trazione differenziale: $\omega_{sx} = rac{v}{r} + rac{\omega d}{2r}$ per scomporre questi target nella velocità di rotazione della singola ruota destra e sinistra.
*   **Trasmissione Comandi:** Mappa le velocità rotazionali necessarie nel rispettivo valore temporale PWM (partendo dalla base di ferma a 1500) e li invia al microcontrollore impacchettandoli come numeri interi a 16-bit (`uint16`).

---

### 4. Tracking, Navigazione e Mappatura (`RealTime_Tracking.m`)
**Cosa fa:** 
È il file operativo da eseguire durante l'esperimento dal vivo. Gestisce il processo di **State Estimation** istante per istante, plottando la posizione del robot su una mappa a schermo mentre si muove.

**Perché è presente:** 
Senza questo script, i dati in arrivo dai sensori verrebbero ignorati. Questo modulo chiude il loop: unisce i dati in arrivo dai sensori alla matematica validata nello script offline, elaborando tutto in *real-time*.

**Come funziona nel dettaglio:**
*   **Inizializzazione e Mappa:** Attende l'attivazione della connessione Bluetooth stabilita dall'Interfaccia. Carica il file `MappaOstacoliKalman.mat` contenente i poligoni degli ostacoli per tracciare a schermo l'ambiente circostante.
*   **Parsing Live (Demuxing):** Entra in un ciclo infinito. Legge costantemente i byte seriali, attende l'arrivo dell'header `0xAA` per confermare l'integrità del pacchetto, quindi ricostruisce le word a 16-bit unendo i byte MSB ed LSB inviati dal PIC per i due encoder e il LIDAR.
*   **Localizzazione EKF Live:** Una volta ottenuta la distanza in metri e l'avanzamento radiale, aggiorna al volo la predizione di Runge-Kutta e applica il Filtro di Kalman in diretta, misurando la distanza in riferimento alla parete (impostata a `Y_wall = 1.4`).
*   **Tracciamento Dinamico (Live Plotting):** Sfrutta la funzione `animatedline` di MATLAB per disegnare due linee: una linea rossa che rappresenta l'odometria grezza, e una linea blu che mostra il percorso corretto dall'EKF, fornendo all'utente un feedback visivo immediato sulle prestazioni dell'algoritmo di localizzazione. A fine ciclo, esporta i log nell'archivio `dati_encoder.mat`.

