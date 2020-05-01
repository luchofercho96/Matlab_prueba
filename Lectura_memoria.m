%importamos memoria compartida
loadlibrary('smClient64.dll','./smClient.h')
% creamos la memoria compartida

% abrir memoria compartida
calllib('smClient64','openMemory','menEntero',1)
% escribir memoria compartida
calllib('smClient64','setInt','menEntero',0,20)
%leer memoria compartida
retInt = calllib('smClient64','getInt','Memory0',1)

% liberar memoria compartida
calllib('smClient64','freeMemories')
t=0:0.1:500;
x=0;
for k=1:length(t)
    x=x+1;
    calllib('smClient64','setInt','menEntero',0,x)
    pause(0.1);
end
calllib('smClient64','freeMemories')