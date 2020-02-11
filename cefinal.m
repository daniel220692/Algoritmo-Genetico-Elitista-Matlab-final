function varargout = cefinal(varargin)
% CEFINAL MATLAB code for cefinal.fig
%      CEFINAL, by itself, creates a new CEFINAL or raises the existing
%      singleton*.
%
%      H = CEFINAL returns the handle to a new CEFINAL or the handle to
%      the existing singleton*.
%
%      CEFINAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CEFINAL.M with the given input arguments.
%
%      CEFINAL('Property','Value',...) creates a new CEFINAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before cefinal_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to cefinal_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help cefinal

% Last Modified by GUIDE v2.5 26-Nov-2014 17:19:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @cefinal_OpeningFcn, ...
                   'gui_OutputFcn',  @cefinal_OutputFcn, ...
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


% --- Executes just before cefinal is made visible.
function cefinal_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to cefinal (see VARARGIN)

% Choose default command line output for cefinal
handles.output = hObject;
limitex=12
      limitey=9
cuadv=zeros(limitex,limitey);
handles.cuadv=cuadv;

% cuad=zeros(200,200);
% cuad(:,:)=1;
cuad3d=zeros(90,120,3);
cuad3d(:,:,:)=255;
cuad3d([10 20 30 40 50 60 70 80 90 ],:,:)=0;
cuad3d(:,[10 20 30 40 50 60 70 80 90 100 110 120],:)=0;

% cuad([10 20 30 40 50 60 70 80 90 100 110 120 130 140 150 160 170 180 190 200],:)=0;
% cuad(:,[10 20 30 40 50 60 70 80 90 100 110 120 130 140 150 160 170 180 190 200])=0;



handles.datos=textread('prueba.txt');

%     handles.cuad3d(:,:,:)=255;
%     handles.cuad3d([10 20 30 40 50 60 70 80 90 100 110 120 130 140 150 160 170 180 190 200],:,:)=0;
%     handles.cuad3d(:,[10 20 30 40 50 60 70 80 90 100 110 120 130 140 150 160 170 180 190 200],:)=0;
   
for n1=1:limitey
    
    for n2=1:limitex
   
       if(handles.datos(n1,n2)==2) 
           
        lyn=(n2-1)*10+1;
        lyn1=n2*10;
        lxn=(n1-1)*10+1;
        lxn1=n1*10;
        cuad3d(lxn:lxn1,lyn:lyn1,1)=255;
        cuad3d(lxn:lxn1,lyn:lyn1,2)=0;
        cuad3d(lxn:lxn1,lyn:lyn1,3)=0;
        handles.posicioninicial(1)=n2;
        handles.posicioninicial(2)=n1;
       end
        if(handles.datos(n1,n2)==3)
           
        lyn=(n2-1)*10+1;
        lyn1=n2*10;
        lxn=(n1-1)*10+1;
        lxn1=n1*10;
%         plot((lxn+lxn1)/2,(lyn+lyn1)/2,'rs','MarkerEdgeColor','k','MarkerFaceColor','b',10);
%         hold on

        cuad3d(lxn:lxn1,lyn:lyn1,1)=0;
        cuad3d(lxn:lxn1,lyn:lyn1,2)=0;
        cuad3d(lxn:lxn1,lyn:lyn1,3)=255;
        handles.posicionfinal(1)=n2;
        handles.posicionfinal(2)=n1;
       end
        
       if(handles.datos(n1,n2)==1) 
        lyn=(n2-1)*10+1;
        lyn1=n2*10;
        lxn=(n1-1)*10+1;
        lxn1=n1*10;
        cuad3d(lxn:lxn1,lyn:lyn1,:)=0;
       end
    end
   
end
axes(handles.axesganador);
    axis([0 120 0 90]);
hold on;  grid on
imshow(cuad3d);


axes(handles.axesganador1);
    axis([0 120 0 90]);
hold on;  grid on
imshow(cuad3d);


axes(handles.axesganador2);
    axis([0 120 0 90]);
hold on;  grid on
imshow(cuad3d);


axes(handles.axesganador3);
    axis([0 120 0 90]);
hold on;  grid on
imshow(cuad3d);


axes(handles.axesganador4);
    axis([0 120 0 90]);
hold on;  grid on
imshow(cuad3d);
   



handles.cuad3d=cuad3d;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes cefinal wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = cefinal_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in inicia.
function inicia_Callback(hObject, eventdata, handles)
% hObject    handle to inicia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cuad3d=handles.cuad3d;
axes(handles.axesganador);
       axis([0 120 0 90]);
        hold on;  grid on
        imshow(cuad3d);
        VELOCIDAD=str2num(get(handles.editVELOCIDAD,'String'));
pasosmaximos=str2num(get(handles.editnpasos,'String'));
indmaximos=str2num(get(handles.editnindividuos,'String'));
conservar=str2num(get(handles.editconservar,'String'))*indmaximos/100;
mezclar=str2num(get(handles.editmezclar,'String'));
mutaciones=str2num(get(handles.editmutar,'String'));
posicioninicial(1)=handles.posicioninicial(1);
      posicioninicial(2)=  handles.posicioninicial(2);
      mapa=textread('prueba.txt');
      origenx=posicioninicial(1);
      origeny=posicioninicial(2);
      pasos=zeros(indmaximos,1);
      ganador=zeros(indmaximos,1);
      ganadores=zeros(indmaximos,1);
      comparar = 100;
      limitex=12
      limitey=9
      posicionfinal(1)=handles.posicionfinal(1);
      posicionfinal(2)=  handles.posicionfinal(2);
      movimiento=zeros(indmaximos,pasosmaximos);
      
       for j=1:indmaximos*20/100
            
             for i=1:pasosmaximos
                 movimiento(j,i)=randi([0 4],1);
                 
             end  
         end
      termino=0;
     x=0 
      while termino==0 
          
         x=x+1 ;
         
         for j=1:indmaximos
             posicioninicial(1)=origenx;
             posicioninicial(2)=origeny;
             for i=1:pasosmaximos
                 if movimiento(j,i)==0
                     movimientox=0;movimientoy=0;
                 end
                 if movimiento(j,i)==1
                     movimientox=0;movimientoy=-1;
                 end
                 if movimiento(j,i)==2
                     movimientox=1;movimientoy=0;
                 end
                 if movimiento(j,i)==3
                     movimientox=0;movimientoy=1;
                 end
                 if movimiento(j,i)==4
                     movimientox=-1;movimientoy=0;
                 end
                 
                 if ((posicioninicial(1)==limitex) && (movimientox==1))
                     movimientox=0;
                 end
                  if ((posicioninicial(1)==1) && (movimientox==-1))
                     movimientox=0;
                  end
                 
                 if ((posicioninicial(2)==limitey) && (movimientoy==1))
                     movimientoy=0;
                 end
                  if ((posicioninicial(2)==1) && (movimientoy==-1))
                     movimientoy=0;
                  end
                  
                  posicioninicial(1)=posicioninicial(1)+ movimientox;
                  posicioninicial(2)=posicioninicial(2)+ movimientoy;
                   if (mapa(posicioninicial(2), posicioninicial(1)) == 1)
                        
                            posicioninicial(1) = posicioninicial(1) - movimientox;
                            posicioninicial(2)= posicioninicial(2) - movimientoy;
                            movimientox = 0;
                            movimientoy = 0;
                   end
                   
                   movimientosx(j, i) = posicioninicial(1);
                        movimientosy(j, i) = posicioninicial(2);
                   
                   
                   if (movimientox ~= 0 || movimientoy ~= 0)
                         pasos(j)=pasos(j)+1; 
                         
                   end
                   if i==pasosmaximos
                  posicionfinalx(j)=posicioninicial(1);
                  posicionfinaly(j)=posicioninicial(2);
                   end
                  
                  
                  
                 
                 
                 
             end    
             
             
         end
         
          for i = 1: indmaximos
               
                    ganadores(i) = sqrt(((posicionfinalx(i) - posicionfinal(1)) * (posicionfinalx(i) - posicionfinal(1))) + ((posicionfinaly(i) - posicionfinal(2)) * (posicionfinaly(i) - posicionfinal(2))));
                   
          end
         
          for j=1:indmaximos
              for i=1:indmaximos
                  
                          if (j > 1)
                        ganadores(ganador(j - 1)) = 1000; 
                          end
                        if (comparar > ganadores(i))
                        
                            comparar = ganadores(i);
                            ganador(j) = i;
                            
                        end

                        
              
              end
              comparar = 100;
          end 
          
          
          for j=1:indmaximos
             
             for i=1:pasosmaximos
                 movimientosganadoresx(j, i) = movimientosx(ganador(j), i);
                 movimientosganadoresy(j, i) = movimientosy(ganador(j), i);
                 
                 
                 
             end
          end
          
          p=mod(x,VELOCIDAD);
          if p==0
              set(handles.editANOS,'String',x);
              VELOCIDAD=str2num(get(handles.editVELOCIDAD,'String'));
          cuad3d1=cuad3d;
          cuad3d2=cuad3d;
          cuad3d3=cuad3d;
          cuad3d4=cuad3d;
          for i=1:pasosmaximos
              n2=movimientosganadoresx(1, i);
               n1=movimientosganadoresy(1, i);
               lyn=(n2-1)*10+1;
        lyn1=n2*10;
        lxn=(n1-1)*10+1;
        lxn1=n1*10;
        cuad3d1(lxn:lxn1,lyn:lyn1,1)=0;
        cuad3d1(lxn:lxn1,lyn:lyn1,2)=255;
        cuad3d1(lxn:lxn1,lyn:lyn1,3)=0;
        
        
        
          n2=movimientosganadoresx(2, i);
               n1=movimientosganadoresy(2, i);
               lyn=(n2-1)*10+1;
        lyn1=n2*10;
        lxn=(n1-1)*10+1;
        lxn1=n1*10;
        cuad3d2(lxn:lxn1,lyn:lyn1,1)=128;
        cuad3d2(lxn:lxn1,lyn:lyn1,2)=0;
        cuad3d2(lxn:lxn1,lyn:lyn1,3)=255;
        
         n2=movimientosganadoresx(4, i);
               n1=movimientosganadoresy(4, i);
               lyn=(n2-1)*10+1;
        lyn1=n2*10;
        lxn=(n1-1)*10+1;
        lxn1=n1*10;
        cuad3d3(lxn:lxn1,lyn:lyn1,1)=255;
        cuad3d3(lxn:lxn1,lyn:lyn1,2)=128;
        cuad3d3(lxn:lxn1,lyn:lyn1,3)=0;
        
         n2=movimientosganadoresx(7, i);
               n1=movimientosganadoresy(7, i);
               lyn=(n2-1)*10+1;
        lyn1=n2*10;
        lxn=(n1-1)*10+1;
        lxn1=n1*10;
        cuad3d4(lxn:lxn1,lyn:lyn1,1)=255;
        cuad3d4(lxn:lxn1,lyn:lyn1,2)=0;
        cuad3d4(lxn:lxn1,lyn:lyn1,3)=0;
        
        
              
              
              
          end
          
      
          
          
cuad3d1([10 20 30 40 50 60 70 80 90 ],:,:)=0;
cuad3d1(:,[10 20 30 40 50 60 70 80 90 100 110 120],:)=0;
cuad3d2([10 20 30 40 50 60 70 80 90 ],:,:)=0;
cuad3d2(:,[10 20 30 40 50 60 70 80 90 100 110 120],:)=0;
cuad3d3([10 20 30 40 50 60 70 80 90 ],:,:)=0;
cuad3d3(:,[10 20 30 40 50 60 70 80 90 100 110 120],:)=0;
cuad3d4([10 20 30 40 50 60 70 80 90 ],:,:)=0;
cuad3d4(:,[10 20 30 40 50 60 70 80 90 100 110 120],:)=0;



          axes(handles.axesganador1);
       axis([0 120 0 90]);
        hold on;  grid on
        imshow(cuad3d1);
        
         axes(handles.axesganador2);
       axis([0 120 0 90]);
        hold on;  grid on
        imshow(cuad3d2);
        
          axes(handles.axesganador3);
      axis([0 120 0 90]);
        hold on;  grid on
        imshow(cuad3d3);
        
         axes(handles.axesganador4);
       axis([0 120 0 90]);
        hold on;  grid on
        imshow(cuad3d4);
          end
        for j=1:indmaximos
             pasosfinales(j) = pasos(ganador(j));
            
        end
        
        for k=1:indmaximos
            if (posicionfinalx(ganador(k)) == posicionfinal(1) && posicionfinaly(ganador(k)) == posicionfinal(2) )
                termino=1
                
                
                
                  cuad3d1=cuad3d;
          cuad3d2=cuad3d;
          cuad3d3=cuad3d;
          cuad3d4=cuad3d;
          cuad3d5=cuad3d;
          for i=1:pasosmaximos
              n2=movimientosganadoresx(k, i);
               n1=movimientosganadoresy(k, i);
               lyn=(n2-1)*10+1;
        lyn1=n2*10;
        lxn=(n1-1)*10+1;
        lxn1=n1*10;
        cuad3d5(lxn:lxn1,lyn:lyn1,1)=0;
        cuad3d5(lxn:lxn1,lyn:lyn1,2)=0;
        cuad3d5(lxn:lxn1,lyn:lyn1,3)=255;
                
          
          
              n2=movimientosganadoresx(1, i);
               n1=movimientosganadoresy(1, i);
               lyn=(n2-1)*10+1;
        lyn1=n2*10;
        lxn=(n1-1)*10+1;
        lxn1=n1*10;
        cuad3d1(lxn:lxn1,lyn:lyn1,1)=0;
        cuad3d1(lxn:lxn1,lyn:lyn1,2)=255;
        cuad3d1(lxn:lxn1,lyn:lyn1,3)=0;
        
        
        
          n2=movimientosganadoresx(2, i);
               n1=movimientosganadoresy(2, i);
               lyn=(n2-1)*10+1;
        lyn1=n2*10;
        lxn=(n1-1)*10+1;
        lxn1=n1*10;
        cuad3d2(lxn:lxn1,lyn:lyn1,1)=128;
        cuad3d2(lxn:lxn1,lyn:lyn1,2)=0;
        cuad3d2(lxn:lxn1,lyn:lyn1,3)=255;
        
         n2=movimientosganadoresx(3, i);
               n1=movimientosganadoresy(3, i);
               lyn=(n2-1)*10+1;
        lyn1=n2*10;
        lxn=(n1-1)*10+1;
        lxn1=n1*10;
        cuad3d3(lxn:lxn1,lyn:lyn1,1)=255;
        cuad3d3(lxn:lxn1,lyn:lyn1,2)=128;
        cuad3d3(lxn:lxn1,lyn:lyn1,3)=0;
        
         n2=movimientosganadoresx(4, i);
               n1=movimientosganadoresy(4, i);
               lyn=(n2-1)*10+1;
        lyn1=n2*10;
        lxn=(n1-1)*10+1;
        lxn1=n1*10;
        cuad3d4(lxn:lxn1,lyn:lyn1,1)=255;
        cuad3d4(lxn:lxn1,lyn:lyn1,2)=0;
        cuad3d4(lxn:lxn1,lyn:lyn1,3)=0;
        
        
              
              
              
          end
cuad3d1([10 20 30 40 50 60 70 80 90 ],:,:)=0;
cuad3d1(:,[10 20 30 40 50 60 70 80 90 100 110 120],:)=0;
cuad3d2([10 20 30 40 50 60 70 80 90 ],:,:)=0;
cuad3d2(:,[10 20 30 40 50 60 70 80 90 100 110 120],:)=0;
cuad3d3([10 20 30 40 50 60 70 80 90 ],:,:)=0;
cuad3d3(:,[10 20 30 40 50 60 70 80 90 100 110 120],:)=0;
cuad3d4([10 20 30 40 50 60 70 80 90 ],:,:)=0;
cuad3d4(:,[10 20 30 40 50 60 70 80 90 100 110 120],:)=0;
cuad3d5([10 20 30 40 50 60 70 80 90 ],:,:)=0;
cuad3d5(:,[10 20 30 40 50 60 70 80 90 100 110 120],:)=0;
                  axes(handles.axesganador1);
       axis([0 120 0 90]);
        hold on;  grid on
        imshow(cuad3d1);
        
         axes(handles.axesganador2);
       axis([0 120 0 90]);
        hold on;  grid on
        imshow(cuad3d2);
        
          axes(handles.axesganador3);
      axis([0 120 0 90]);
        hold on;  grid on
        imshow(cuad3d3);
        
         axes(handles.axesganador4);
       axis([0 120 0 90]);
        hold on;  grid on
        imshow(cuad3d4);
        
       axes(handles.axesganador);
       axis([0 120 0 90]);
        hold on;  grid on
        imshow(cuad3d5);
                
                
            
            end
        end
        
         for k=1:indmaximos
             pasos(i) = 0;
         end
         
          
         for j=1:indmaximos
             
             for i=1:pasosmaximos
                 modificacion(j, i) = movimiento(ganador(j), i);
                 
             end
         end
         
         for j=1:conservar
             
             for i=1:pasosmaximos
                movimiento(j, i) = modificacion(j, i);
                 
             end
         end
         
          for j = 1:  indmaximos * mezclar / 100
                
                    aleatorio1 = randi([conservar indmaximos],1);
                    aleatorio2 =randi([1 indmaximos],1); 
                    for i = randi([1 pasosmaximos],1): pasosmaximos
                    
                        movimiento(aleatorio1, i) = modificacion(aleatorio2, i);
                     end
          end
          
            for j = 1:  indmaximos * mutaciones / 100
                
                    aleatorio1 = randi([1 indmaximos],1);
                    aleatorio2 =randi([1 pasosmaximos],1); 
                    
                    
                     movimiento(aleatorio1, aleatorio2) =randi([1 4],1); 
                    
          end
           
          
             
          
          
          
          
          
         
      end
      




function editnpasos_Callback(hObject, eventdata, handles)
% hObject    handle to editnpasos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editnpasos as text
%        str2double(get(hObject,'String')) returns contents of editnpasos as a double


% --- Executes during object creation, after setting all properties.
function editnpasos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editnpasos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editnindividuos_Callback(hObject, eventdata, handles)
% hObject    handle to editnindividuos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editnindividuos as text
%        str2double(get(hObject,'String')) returns contents of editnindividuos as a double


% --- Executes during object creation, after setting all properties.
function editnindividuos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editnindividuos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editconservar_Callback(hObject, eventdata, handles)
% hObject    handle to editconservar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editconservar as text
%        str2double(get(hObject,'String')) returns contents of editconservar as a double


% --- Executes during object creation, after setting all properties.
function editconservar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editconservar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editmezclar_Callback(hObject, eventdata, handles)
% hObject    handle to editmezclar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editmezclar as text
%        str2double(get(hObject,'String')) returns contents of editmezclar as a double


% --- Executes during object creation, after setting all properties.
function editmezclar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editmezclar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editmutar_Callback(hObject, eventdata, handles)
% hObject    handle to editmutar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editmutar as text
%        str2double(get(hObject,'String')) returns contents of editmutar as a double


% --- Executes during object creation, after setting all properties.
function editmutar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editmutar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editVELOCIDAD_Callback(hObject, eventdata, handles)
% hObject    handle to editVELOCIDAD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editVELOCIDAD as text
%        str2double(get(hObject,'String')) returns contents of editVELOCIDAD as a double
g2=get(hObject,'String');
g3=str2double(g2);
handles.VELOCIDAD=g3;
guidata(hObject,handles);



% --- Executes during object creation, after setting all properties.
function editVELOCIDAD_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editVELOCIDAD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editANOS_Callback(hObject, eventdata, handles)
% hObject    handle to editANOS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editANOS as text
%        str2double(get(hObject,'String')) returns contents of editANOS as a double


% --- Executes during object creation, after setting all properties.
function editANOS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editANOS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
