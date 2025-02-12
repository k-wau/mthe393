% How to Use the GUI with a Script
%================Do Not Edit===============================================
% Find handle to hidden figure
temp = get(0,'showHiddenHandles');
set(0,'showHiddenHandles','on');
hfig = gcf;
% Get the handles structure
handles = guidata(hfig);
event = struct('Source', handles, 'EventName', 'ButtonPushed' );

%================Start Editing=============================================

% This will let you pick the Field radio button
set(handles.radioField, 'Value', 1);

% You need to use a string for the equation you want
name = '10 + t^2';
% Or if you have a variable you can use sprintf which is like the
% printf function in c programming
k = 10;
name = sprintf('%d*t^2',k);
set(handles.input, 'String', name );

% This invokes the input Callback. Call this every time you change the
% contents of the field textbox to update 'inputFunc.m'
feval(get(handles.input,'Callback'),handles, event);


% % This will let you pick the File radio button
% set(handles.radioFile, 'Value', 1);
% % This changes the input file name textbox
% set(handles.inputFile, 'String', 'inputManual' );

% This changes the start time
set(handles.axisStart, 'String', '0');
% This changes the end time
set(handles.axisEnd, 'String', '10');
% This changes the step size
set(handles.stepSize, 'String', '0.01');
% This changes the refine output
set(handles.refineOutput, 'String', '1');

% Use the run button
feval(get(handles.run,'Callback'),handles, event);
% This changes the save file name
set(handles.saveFile, 'String', 'saving_file_name' );
% Use the save button
feval(get(handles.save,'Callback'),handles, event);
% Use the clear button
% feval(get(handles.clear,'Callback'),handles, event);

%=======================Do Not Edit========================================
set(0,'showHiddenHandles',temp);