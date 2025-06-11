@echo off
@echo Alexandre Ernesto
@echo GIT:https://github.com/ernestosoftbr/PNETLab-com-MOBAXTerm/blob/main/pnetlab_ethx_mobaxterm.bat

SET input=%1

REM Verifique se um argumento está correto
IF "%input%"=="" (
    echo Error: Um endereço não foi fornecido no formato telnet:host:port
    exit /b 1
)

REM Extraia corretamente o host e a porta
FOR /F "tokens=2 delims=:" %%a IN ("%input%") DO SET host=%%a
FOR /F "tokens=3 delims=:" %%a IN ("%input%") DO SET port=%%a

REM Remova as barras "//" se houver alguma
SET host=%host://=%
SET port=%port:/=%

REM Elimine espaços no host e na porta
SET host=%host: =%
SET port=%port: =%

REM Validar se ambos os valores existem
IF "%host%"=="" (
    echo Error: Host não identificado
    exit /b 1
)

IF "%port%"=="" (
    echo Error: Porta não identificada
    exit /b 1
)

echo Host: %host%
echo Port: %port%

REM Vá para a pasta de MobaXterm
cd /d "C:\Program Files (x86)\Mobatek\MobaXterm" || (
    echo Error: Pasta MobaXterm não encontrada
    exit /b 1
)

REM Execute o Telnet no MobaXterm com o formato correto
MobaXterm.exe -newtab "cmd /c telnet %host% %port%"
