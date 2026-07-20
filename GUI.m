function varargout = Interfaccia(varargin)
% INTERFACCIA MATLAB code for Interfaccia.fig
%      INTERFACCIA, by itself, creates a new INTERFACCIA or raises the existing
%      singleton*.
%
%      H = INTERFACCIA returns the handle to a new INTERFACCIA or the handle to
%      the existing singleton*.
%
%      INTERFACCIA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFACCIA.M with the given input arguments.
%
%      INTERFACCIA('Property','Value',...) creates a new INTERFACCIA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Interfaccia_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Interfaccia_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Interfaccia

% Last Modified by GUIDE v2.5 14-May-2025 17:07:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Interfaccia_OpeningFcn, ...
                   'gui_OutputFcn',  @Interfaccia_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Interfaccia is made visible.
function Interfaccia_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Interfaccia (see VARARGIN)

% Choose default command line output for Interfaccia
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Interfaccia wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Interfaccia_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Connessione.
function Connessione_Callback(hObject, eventdata, handles)
% hObject    handle to Connessione (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global b;
    try % Try-Catch è un blocco stile if-else
  
        b=bluetooth("GRUPPO8"); %è il nostro indirizzo
        display('connected');
        assignin('base','b',b) %assegna al workspace la variabile b,evita 
        % i passaggi b = bluetooth devlist ecc...
        
        handles.b = b;  % Salva in handles
        guidata(hObject, handles);  % <<< QUESTO È FONDAMENTALE
        disp('Connessione Bluetooth stabilita.');
    catch ME
        disp("Errore nella connessione:");
        disp(ME.message);
        
    end

% --- Executes on button press in q.
function w_Callback(hObject, eventdata, handles)
% hObject    handle to q (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isfield(handles, 'b') && ~isempty(handles.b) %doppia condizione, b deve 
    %esistere come struttura handless e non deve essere vuota, se cosi è
    %allora vai in write
        
        %write(handles.b, 'w', "char");  % invia il carattere 'w'
        v_max = 0.18;
        v= 3/5 * v_max;
        %v = 0.03;
        r = 0.0345;
        w_dx = -v/r;
        w_sx = v/r;
        x_sx = w_sx*200/5.24; 
        th_sx = round(1500 + x_sx);
        
        x_dx = w_dx*200/5.24; 
        th_dx = round(1500 + x_dx);
       
        write(handles.b, 1, 'uint8');
        write(handles.b, [th_dx, th_sx], "uint16");
        %write(handles.b,  [1, msb_dx, lsb_dx, msb_sx, lsb_sx], "uint8");
        pause(0.08)
        %write(handles.b,  [msb_sx, lsb_sx], "uint8");

    else
        disp('Bluetooth non connesso.');
    end

% --- Executes on button press in STOP.
function STOP_Callback(hObject, eventdata, handles)
% hObject    handle to STOP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isfield(handles, 'b') && ~isempty(handles.b)
    w_dx = 0;
    w_sx = 0;
    x_sx = w_sx*200/5.24; 
    th_sx = round(1500 + x_sx);
   
    x_dx = w_dx*200/5.24; 
    th_dx = round(1500 + x_dx);
   
    write(handles.b, 1, 'uint8');
    write(handles.b, [th_dx, th_sx], "uint16");
    %write(handles.b,  [1, msb_dx, lsb_dx, msb_sx, lsb_sx], "uint8");
    pause(0.08)
    %write(handles.b,  [msb_sx, lsb_sx], "uint8");
    %write(handles.b, 'x', "char");  % invia il carattere 'w'
    else
        disp('Bluetooth non connesso.');
    end

% --- Executes on button press in s.
function s_Callback(hObject, eventdata, handles)
% hObject    handle to s (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isfield(handles, 'b') && ~isempty(handles.b)
        v_max = 0.18;
        %v= 4/5 * v_max;
        v = 0.130;
        r = 0.0345;
        w_dx = v/r;
        w_sx = - v/r;
        x_sx = w_sx*200/5.24; 
        th_sx = round(1500 + x_sx);
       
        x_dx = w_dx*200/5.24; 
        th_dx = round(1500 + x_dx);
        
        write(handles.b, 1, 'uint8');
        write(handles.b, [th_dx, th_sx], "uint16");
        %write(handles.b,  [1, msb_dx, lsb_dx, msb_sx, lsb_sx], "uint8");
        pause(0.08)
        %write(handles.b,  [msb_sx, lsb_sx], "uint8");
        %write(handles.b, 's', "char");  % invia il carattere 'w'
    else
        disp('Bluetooth non connesso.');
    end

% --- Executes on button press in e.
function e_Callback(hObject, eventdata, handles)
% hObject    handle to e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isfield(handles, 'b') && ~isempty(handles.b)
    v_max = 0.18;
    w_max = 5.24;
    v= 3/5 * v_max;
    d = 0.1872;
    r = 0.0345;
    w = (2*r*w_max)/d - (2/d)*v;
    w_sx = (v/r + (w*d)/(2*r));
    w_dx = -(v/r - (w*d)/(2*r));
    x_sx = w_sx*200/5.24; 
    th_sx = round(1500 + x_sx);
   
    x_dx = w_dx*200/5.24; 
    th_dx = round(1500 + x_dx);
   
    
    write(handles.b, 1, 'uint8');
    write(handles.b, [th_dx, th_sx], "uint16");
    pause(0.08)
        %write(handles.b, 'e', "char");  % invia il carattere 'w'
    else
        disp('Bluetooth non connesso.');
    end

% --- Executes on button press in d.
function d_Callback(hObject, eventdata, handles)
% hObject    handle to d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isfield(handles, 'b') && ~isempty(handles.b)
        v_max = 0.18;
        w_max = 5.24;
        v= 2/5 * v_max;
        d = 0.1872;
        r = 0.0345;
        w = 2/d *v + (2*r*w_max)/d;
        w_dx = 0;
        w_sx = w;
        x_sx = w_sx*200/5.24; 
        th_sx = round(1500 + x_sx);
        % th_sx16 = int16(th_sx);
        % msb_sx = floor(double(th_sx16)/256);
        % lsb_sx = mod(th_sx16, 256);
        x_dx = w_dx*200/5.24; 
        th_dx = round(1500 + x_dx);
        %th_dx16 = int16(th_dx);
        % msb_dx = floor(double(th_dx16)/256);
        % lsb_dx = mod(th_dx16, 256);
        write(handles.b, 1, 'uint8');
        write(handles.b, [th_dx, th_sx], "uint16");
        % write(handles.b,  [1, msb_dx, lsb_dx], "uint8");
        % write(handles.b,  [msb_sx, lsb_sx], "uint8");
        pause(0.08)
        %write(handles.b, 'd', "char");  % invia il carattere 'w'
    else
        disp('Bluetooth non connesso.');
    end

% --- Executes on button press in a.
function a_Callback(hObject, eventdata, handles)
% hObject    handle to a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isfield(handles, 'b') && ~isempty(handles.b)
        %write(handles.b, 'a', "char");  % invia il carattere 'w'
        v_max = 0.18;
        w_max = 5.24;
        v= 2/5 * v_max;
        d = 0.1872;
        r = 0.0345;
        w = -2/d *v + (2*r*w_max)/d;
        w_dx = -w;
        w_sx = 0;
        x_sx = w_sx*200/5.24; 
        th_sx = round(1500 + x_sx);
       
        x_dx = w_dx*200/5.24; 
        th_dx = round(1500 + x_dx);
       
        write(handles.b, 1, 'uint8');
        write(handles.b, [th_dx, th_sx], "uint16");
        pause(0.08)
    else
        disp('Bluetooth non connesso.');
    end

% --- Executes on button press in q.
function q_Callback(hObject, eventdata, handles)
% hObject    handle to q (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isfield(handles, 'b') && ~isempty(handles.b)
    v_max = 0.18;
    w_max = 5.24;
    v= 3/5 * v_max;
    d = 0.1872;
    r = 0.0345;
    w = -(2*r*w_max)/d + (2/d)*v;
    w_sx = (v/r + (w*d)/(2*r));
    w_dx = -(v/r - (w*d)/(2*r));
    x_sx = w_sx*200/5.24; 
    th_sx = round(1500 + x_sx);
   
    x_dx = w_dx*200/5.24; 
    th_dx = round(1500 + x_dx);
   
    
    write(handles.b, 1, 'uint8');
    write(handles.b, [th_dx, th_sx], "uint16");
    pause(0.08)
        %write(handles.b, 'e', "char");  % invia il carattere 'w'
    else
        disp('Bluetooth non connesso.');
    end

% --- Executes on button press in z.
function z_Callback(hObject, eventdata, handles)
% hObject    handle to z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isfield(handles, 'b') && ~isempty(handles.b)
    v_max = 0.18;
    w_max = 5.24;
    v= -3/5 * v_max;
    d = 0.1872;
    r = 0.0345;
    w = (2*r*w_max)/d - (2/d)*v;
    w_sx = -(v/r + (w*d)/(2*r));
    w_dx = -(v/r - (w*d)/(2*r));
    x_sx = w_sx*200/5.24; 
    th_sx = round(1500 + x_sx);
   
    x_dx = w_dx*200/5.24; 
    th_dx = round(1500 + x_dx);
   
    
    write(handles.b, 1, 'uint8');
    write(handles.b, [th_dx, th_sx], "uint16");
    pause(0.08)
        %write(handles.b, 'e', "char");  % invia il carattere 'w'
    else
        disp('Bluetooth non connesso.');
    end

% --- Executes on button press in c.
function c_Callback(hObject, eventdata, handles)
% hObject    handle to c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isfield(handles, 'b') && ~isempty(handles.b)
    v_max = 0.18;
    w_max = 5.24;
    v= -3/5 * v_max;
    d = 0.1872;
    r = 0.0345;
    w = -(2*r*w_max)/d - (2/d)*v;
    w_sx = (v/r + (w*d)/(2*r));
    w_dx = -(v/r - (w*d)/(2*r));
    x_sx = w_sx*200/5.24; 
    th_sx = round(1500 + x_sx);
   
    x_dx = w_dx*200/5.24; 
    th_dx = round(1500 + x_dx);
   
    
    write(handles.b, 1, 'uint8');
    write(handles.b, [th_dx, th_sx], "uint16");
    pause(0.08)
        %write(handles.b, 'e', "char");  % invia il carattere 'w'
    else
        disp('Bluetooth non connesso.');
    end

% --- Executes on button press in aumento.
function aumento_Callback(hObject, eventdata, handles)
% hObject    handle to aumento (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isfield(handles, 'b') && ~isempty(handles.b)
   th_aumento = 20;
   write(handles.b, 170, 'uint8');
   write(handles.b, th_aumento, 'int16');
    else
        disp('Bluetooth non connesso.');
    end


% --- Executes on button press in diminuire.
function diminuire_Callback(hObject, eventdata, handles)
% hObject    handle to diminuire (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isfield(handles, 'b') && ~isempty(handles.b)
   th_diminuire = -20;
   write(handles.b, 170, 'uint8');
   write(handles.b, th_diminuire, 'int16');
    else
        disp('Bluetooth non connesso.');
    end