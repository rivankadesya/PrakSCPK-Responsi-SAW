function varargout = SAW_RUMAH(varargin)
% SAW_RUMAH MATLAB code for SAW_RUMAH.fig
%      SAW_RUMAH, by itself, creates a new SAW_RUMAH or raises the existing
%      singleton*.
%
%      H = SAW_RUMAH returns the handle to a new SAW_RUMAH or the handle to
%      the existing singleton*.
%
%      SAW_RUMAH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SAW_RUMAH.M with the given input arguments.
%
%      SAW_RUMAH('Property','Value',...) creates a new SAW_RUMAH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SAW_RUMAH_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SAW_RUMAH_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SAW_RUMAH

% Last Modified by GUIDE v2.5 25-Jun-2021 15:29:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SAW_RUMAH_OpeningFcn, ...
                   'gui_OutputFcn',  @SAW_RUMAH_OutputFcn, ...
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


% --- Executes just before SAW_RUMAH is made visible.
function SAW_RUMAH_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SAW_RUMAH (see VARARGIN)

% Choose default command line output for SAW_RUMAH
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SAW_RUMAH wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SAW_RUMAH_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = xlsread('DATA RUMAH.xlsx','Sheet1','C:H'); 
k = xlsread('DATA RUMAH.xlsx','Sheet3','A:F');

[m n]=size (x); %matriks m x n dengan ukuran sebanyak variabel x (input)
R=zeros (m,n); %membuat matriks R, yang merupakan matriks kosong
Y=zeros (m,n); %membuat matriks Y, yang merupakan titik kosong
for j=1:n,
 if k(j)==1, %statement untuk kriteria dengan atribut keuntungan
  R(:,j)=x(:,j)./max(x(:,j));
 else
  R(:,j)=min(x(:,j))./x(:,j);
 end;
%  set(handles.uitable4,'Data',R);  
end;

w = xlsread('DATA RUMAH.xlsx','Sheet2','A:F');
for i=1:m,
 V(i)= sum(w.*R(i,:))
  [nilai,urutan]=max(V)
 
end

[nilai,urutan] =sort(V,'descend');
zz = reshape(urutan,m,1);
zz(21:m,:) = [] %untuk menampilkan data dari 1-20
set(handles.uitable4,'Data',zz);

function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tabel1 = xlsread('DATA RUMAH.xlsx','Sheet1','C:H');
tabel4 = xlsread('DATA RUMAH.xlsx','Sheet1','A:A'); 
tabel2 = xlsread('DATA RUMAH.xlsx','Sheet2','A:F');
tabel3 = xlsread('DATA RUMAH.xlsx','Sheet3','A:F');
tabel6 = xlsread('DATA RUMAH.xlsx','Sheet1','B:B');
tabel5 = cat(2,tabel4,tabel1); %berfungsi untuk menggabungkan tabel A dengan tabel C-H
set(handles.uitable1,'Data',tabel5);
set(handles.uitable2,'Data',tabel2);
set(handles.uitable3,'Data',tabel3);
