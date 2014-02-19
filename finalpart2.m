function varargout = finalpart2(varargin)
% FINALPART2 MATLAB code for finalpart2.fig
%      FINALPART2, by itself, creates a new FINALPART2 or raises the existing
%      singleton*.
%
%      H = FINALPART2 returns the handle to a new FINALPART2 or the handle to
%      the existing singleton*.
%
%      FINALPART2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINALPART2.M with the given input arguments.
%
%      FINALPART2('Property','Value',...) creates a new FINALPART2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before finalpart2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to finalpart2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help finalpart2

% Last Modified by GUIDE v2.5 07-Feb-2014 15:38:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @finalpart2_OpeningFcn, ...
                   'gui_OutputFcn',  @finalpart2_OutputFcn, ...
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

% EPED 067 Group 3 - Joe Massott and Abul Hasnat

% --- Executes just before finalpart2 is made visible.
function finalpart2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to finalpart2 (see VARARGIN)

% Choose default command line output for finalpart2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes finalpart2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = finalpart2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in calibrate.
function calibrate_Callback(hObject, eventdata, handles)
% hObject    handle to calibrate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Abul
% handles.comPort = '/dev/tty.usbmodem1411';
%Joe
handles.comPort = '/dev/tty.usbmodemfd121';
%connect MATLAB to the accelerometer
if (~exist('handles.serialFlag','var'))
 [handles.accelerometer.s,handles.serialFlag]...
     = setupSerial(handles.comPort);
end

%if the accelerometer is not calibrated, calibrate now
if(~exist('handles.calCo', 'var'))
    handles.calCo = calibrate(handles.accelerometer.s);
   
end 
guidata(hObject, handles);

% --- Executes on button press in plotting.
function plotting_Callback(hObject, eventdata, handles)
% hObject    handle to plotting (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Collect and display the accelerometer data

buf_len = 200;

% create variables for all the three axis and the resultant 
gxdata = zeros(buf_len,1);
gydata = zeros(buf_len,1);
gzdata = zeros(buf_len,1);
index = 1:buf_len;
time=0;
while(strcmp(get(handles.plotting,'String'),'Plot')) % to keep all insustanious data
    % Get the new values from the accelerometer
    [gx gy gz] = readAcc(handles.accelerometer,handles.calCo);
    
    gxdata = [gxdata(2:end) ; gx];
    gydata = [gydata(2:end) ; gy];
    gzdata = [gzdata(2:end) ; gz];    
    magdata = sqrt(gxdata.^2+gydata.^2+gzdata.^2); % resultant for all three vector
    
    % Magnitude values are plotted from acclerometer data
    axes(handles.axes1); % connecting GUI plot to .m file coding
    plot(index,magdata); % generating plot for magdata
    axis([1 buf_len -10 10]); % setting up the axis scale -10 to 10  
    xlabel('time'); % X axis label
    ylabel('Resultant Magnitude'); % X axis label

 maximum_magdata=max(magdata) % maximum value of resultant from accelerometer. 
set(handles.max,'String',num2str(maximum_magdata)) % vasualizing numeric value in text box 

Avg_magdata=mean(magdata) % average value of resultant from accelerometer.
set(handles.avg,'String',num2str(Avg_magdata))% vasualizing numeric value in text box

minimum_magdata=min(magdata) % minimum value of resultant from accelerometer.
set(handles.min,'String',num2str(minimum_magdata))% vasualizing numeric value in text box

end
guidata(hObject, handles);




% --- Executes on button press in disconnecting.

%generated a button to disconnect UNO.

function disconnecting_Callback(hObject, eventdata, handles)
% hObject    handle to disconnecting (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if ~isempty(instrfind)
    fclose(instrfind);
    delete(instrfind);
end
close all
clc
disp('Serial Port Closed')
% Update handles structure
guidata(hObject, handles);

% EPED 067 Group 3 - Joe Massott and Abul Hasnat
