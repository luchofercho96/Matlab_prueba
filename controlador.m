clc;
clear all;
%creamos u obtenemos los datos que queremos enviar hacia le memoria
%compartida
vector = [2,2,5,8,4,2];

%importar la dll de la memoria
loadlibrary('smClient64.dll','./smClient.h');

%abrimos las memorias compartidas de tipo flotantes
calllib('smClient64','openMemory','sp',1)
%editando nueva memoria
calllib('smClient64','openMemory','nueva',1)

at=0.1;
%iniciamos un ciclo infinito
while true
    %enviamos del 1 al 10 infinitamente
    for x = 1:10
        
       calllib('smClient64','setFloat','controladr',1,x   	   
    end
end

%iniciamos un ciclo infinito
% while true
%     %leemos el dato del SetPoint desde unity
%     sp = calllib('smClient64','getFloat','sp',0);
%     
%     [valor_control] = CONTROLADOR_PID(sp);
%     calllib('smClient64','setFloat','controlador',0,valor_control)
%     
%     %escribimos el datos de control hacia unity
% end

%liberar memoria compartida
calllib('smClient64','freeViews')
unloadlibrary smClient64

%funcion que implementa el algoritmo de control
function [valor_control] = CONTROLADOR_PID(sp)
    valor_control = (sp+1)*5;
end
