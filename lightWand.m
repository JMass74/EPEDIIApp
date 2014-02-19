function varargout = lightWand(varargin)
% LIGHTWAND MATLAB code for lightWand.fig
%      LIGHTWAND, by itself, creates a new LIGHTWAND or raises the existing
%      singleton*.
%
%      H = LIGHTWAND returns the handle to a new LIGHTWAND or the handle to
%      the existing singleton*.
%
%      LIGHTWAND('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LIGHTWAND.M with the given input arguments.
%
%      LIGHTWAND('Property','Value',...) creates a new LIGHTWAND or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before lightWand_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to lightWand_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES


% EPED 067 Group 3 - Joe Massott and Abul Hasnat

%   This app will be designed to instruct on and recognize hand gestures, and upon
%   recognizing a pre-defined (or user defined) gesture, send an output signal (RF or
%   low power bluetooth) to a control unit that will interpret the signal and change
%   between an on and off position (ideally it will open or close a circuit
%   controlling lights/TV's/Garage doors... etc.). The room view frame will be used
%   to load a minimalist model of the room in which the app will be used, allowing
%   users to visualize and extend the app's functionality. The table will be used to
%   pair gestures with certain recievers.


% Edit the above text to modify the response to help lightWand

% Last Modified by GUIDE v2.5 07-Feb-2014 15:10:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lightWand_OpeningFcn, ...
                   'gui_OutputFcn',  @lightWand_OutputFcn, ...
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


% --- Executes just before lightWand is made visible.
function lightWand_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to lightWand (see VARARGIN)

% Choose default command line output for lightWand
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes lightWand wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = lightWand_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in startButton.

% -------------------       GROUP 3         -------------------%


%   This button will initiate communication, load necessary images and allow the send
%   signal button to be accessed

function startButton_Callback(hObject, eventdata, handles)
% hObject    handle to startButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in calibrateButton.

% -------------------       GROUP 3         -------------------%


%   This button will callback to the calibration script

function calibrateButton_Callback(hObject, eventdata, handles)
% hObject    handle to calibrateButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in filterMenu.

% -------------------       GROUP 3         -------------------%


%   This is where we will store our preprogramed filters

function filterMenu_Callback(hObject, eventdata, handles)
% hObject    handle to filterMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns filterMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from filterMenu


% --- Executes during object creation, after setting all properties.
function filterMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filterMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in sendSignalButton.

% -------------------       GROUP 3         -------------------%


%   This will open/close the communication with a transceiver to allow it to send a
%   RF (or low power bluetooth) signal out to a switching unit that is in control of
%   a certain circuit

function sendSignalButton_Callback(hObject, eventdata, handles)
% hObject    handle to sendSignalButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of sendSignalButton


% --- Executes on slider movement.

% -------------------       GROUP 3         -------------------%


%   Here we will allow fine tuning of the filters in all three dimensions, allowing
%   multiple users to master gestures quickly

function xFilterSlider_Callback(hObject, eventdata, handles)
% hObject    handle to xFilterSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function xFilterSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xFilterSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function yFilterSlider_Callback(hObject, eventdata, handles)
% hObject    handle to yFilterSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function yFilterSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yFilterSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function zFilterSlider_Callback(hObject, eventdata, handles)
% hObject    handle to zFilterSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function zFilterSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to zFilterSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in disconnect.
%   This will close app/serialport

function disconnect_Callback(hObject, eventdata, handles)
% hObject    handle to disconnect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function timeSlider_Callback(hObject, eventdata, handles)
% hObject    handle to timeSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.

% -------------------       GROUP 3         -------------------%

%   This will determine the time intervals on which the interpreter will expect to
%   see inflections in the gesture. Lower time settings will allow for more rapid
%   gestures and higher time settings will allow for slow execution of gestures

function timeSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timeSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
