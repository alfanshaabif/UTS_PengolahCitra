function varargout = GUI_alfanshaabif(varargin)
% GUI_ALFANSHAABIF MATLAB code for GUI_alfanshaabif.fig
%      GUI_ALFANSHAABIF, by itself, creates a new GUI_ALFANSHAABIF or raises the existing
%      singleton*.
%
%      H = GUI_ALFANSHAABIF returns the handle to a new GUI_ALFANSHAABIF or the handle to
%      the existing singleton*.
%
%      GUI_ALFANSHAABIF('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_ALFANSHAABIF.M with the given input arguments.
%
%      GUI_ALFANSHAABIF('Property','Value',...) creates a new GUI_ALFANSHAABIF or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_alfanshaabif_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_alfanshaabif_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_alfanshaabif

% Last Modified by GUIDE v2.5 04-May-2021 02:00:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_alfanshaabif_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_alfanshaabif_OutputFcn, ...
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


% --- Executes just before GUI_alfanshaabif is made visible.
function GUI_alfanshaabif_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_alfanshaabif (see VARARGIN)

% Choose default command line output for GUI_alfanshaabif
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_alfanshaabif wait for user response (see UIRESUME)
% uiwait(handles.figure1);
buat_axes = axes('unit', 'normalized', 'position', [0 0  1 1]);
backgroundnya = imread('orange.jpg');
imagesc(backgroundnya);
set(buat_axes, 'handlevisibility', 'off', 'visible', 'off')

% --- Outputs from this function are returned to the command line.
function varargout = GUI_alfanshaabif_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
l=imdistline();
msgbox('Measured in Pixels');
dist = getDistance(l);

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
red=a;
red(:,:,2:3)=0;
setappdata(0,'filename', red);
setappdata(0,'ImRotation', red);
axes(handles.axes2);
imshow(red);

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
green=a;
green(:,:,1)=0;
green(:,:,3)=0;
setappdata(0,'filename', green);
setappdata(0,'ImRotation', green);
axes(handles.axes2);
imshow(green);

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
blue=a;
blue(:,:,1)=0;
blue(:,:,2)=0;
setappdata(0,'filename', blue);
setappdata(0,'ImRotation', blue);
axes(handles.axes2);
imshow(blue);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0, 'a');
rotate=imrotate(a,45);
axes(handles.axes2);
imshow(rotate);

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
noise=imnoise(a, 'salt & pepper');
axes(handles.axes2);
imshow(noise);

% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
noise=imnoise(a, 'gaussian');
axes(handles.axes2);
imshow(noise);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
input=a;
input=rgb2gray(input);
axes(handles.axes2);
imhist(input);

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=getappdata(0,'a');
I2=flipdim(I,2);
axes(handles.axes2);
imshow(I2);

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=getappdata(0,'a');
I3=flipdim(I,1);
axes(handles.axes2);
imshow(I3);

% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=getappdata(0,'a');
I2=flipdim(I,2);
I3=flipdim(I,1);
I4=flipdim(I3,2);
axes(handles.axes2);
imshow(I4);

% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
IM2=imcomplement(a);
axes(handles.axes2);
imshow(IM2);


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=getappdata(0,'a');
I=rgb2gray(I);
BW2=edge(I,'canny');
axes(handles.axes2);
imshow(BW2)

% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=getappdata(0,'a');
I=rgb2gray(I);
BW1=edge(I,'sobel');
axes(handles.axes2);
imshow(BW1);

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=uigetfile();
filename=a;
setappdata(0,'filename',filename);
a=imread(a);
axes(handles.axes1);
imshow(a);
setappdata(0,'a',a);
setappdata(0,'filename',a);
plot(handles.axes1,'a');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
a_gray=rgb2gray(a);
setappdata(0,'filename', a_gray);
axes(handles.axes2);
imshow(a_gray);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
a_bw=im2bw(a,.57);
axes(handles.axes2);
imshow(a_bw);
setappdata(0,'filename',a_bw);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
imshow(a);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('Thanks for using my image processing tool by alfanshaabif');
pause(1);
close();
close();
