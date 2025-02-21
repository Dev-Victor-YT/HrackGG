

gg.toast("■□□□□□□10%  ")
gg.sleep(300)
gg.toast("■■□□□□□20%  ")
gg.sleep(300)
gg.toast("■■■□□□□40%  ")
gg.sleep(300)
gg.toast("■■■■□□□60%  ")
gg.sleep(300)
gg.toast("■■■■■□□80%  ")
gg.sleep(300)
gg.toast("■■■■■■□90%  ")
gg.sleep(300)
gg.toast("■■■■■■■100%")




-- código do menu principal
function HrackGG_OFICIAL()
-- gg.multiChoice
HrackGG = gg["choice"]({
WALLHRACK1 .." ⛰️ WALLHRACK VIP⛰️",
ANT_REPORT1 .."🔒ANT REPORT VIP🔒",
BYPASS_ANTIBAN1 .." ⏳BYPASS ANTIBAN VIP⏳",
TIRA_TRAVAMENTO1 .."📱TIRA TRAVAMENTO 100% VIP📱",
APAGAR_CACHER1 .." 🗑️APAGAR CACHER VIP🗑️",
APAGAR_CONTA1 .." 🗑️APAGAR COTNA VIP🗑️",
" ❌SAIR DA SCRIPT❌ "
}, nil, (os["date"]("🛡CRIADOR : HrackGG\n🛡HORAS:%H:%M:%S\n🛡SCRIPT WALL V1\n🛡FREE FIRE 1.X.X\n🛡EXPIRA INFINITO")))
if HrackGG == nil then
else
end
if HrackGG == nil then
else
end
-- if multi[1] == true then
-- C100()
-- end
if HrackGG == 1 then
WALLHRACK()
end
if HrackGG == 2 then
ANTI_REPOR()
end
if HrackGG == 3 then
BYPASS()
end
if HrackGG == 4 then
TIRA_TRAVAMENTO()
end
if HrackGG == 5 then
APAGAR_CACHER()
end
if HrackGG == 6 then
APAGAR_CONTA()
end
if HrackGG == 7 then
SAIR = gg["alert"]("╔══════  ࿇  ══════╗\n\a\aQUER SAIR DA SCRIPT?\n╚══════  ࿇  ══════╝", "[SIM]", "[NÃO]")
if SAIR == 1 then
gg.copyText("https://bit.ly/3CNjEWB")
os["exit"]()
end
if SAIR == 2 then
HrackGG_OFICIAL()
end
end
HrackGG2 = -1
end





WALLHRACK1 = "OFF❎"
function WALLHRACK(...)
if WALLHRACK1 == "OFF❎"  then
gg["toast"]('⌛ WALLHRACK ATIVANDO ⌛')

-- Caminho da pasta original
local oldPath = "/storage/emulated/0/Android/obb/com.dts.freefireth"

-- Caminho para a nova pasta
local newPath = "/storage/emulated/0/Android/obb/com.dts.freefireth2"

-- Função para renomear a pasta
os.rename(oldPath, newPath)

-- Exibe mensagem confirmando a mudança
-- print("Pasta renomeada de '" .. oldPath .. "' para '" .. newPath .. "'")

gg["sleep"](2000)

-- Caminho da pasta original
local oldPath = "/storage/emulated/0/Android/obb/com.dts.freefireth2"

-- Caminho para a nova pasta
local newPath = "/storage/emulated/0/Android/obb/com.dts.freefireth"

-- Função para renomear a pasta
os.rename(oldPath, newPath)

-- Exibe mensagem confirmando a mudança
-- print("Pasta renomeada de '" .. oldPath .. "' para '" .. newPath .. "'")

gg["toast"]('🔒WALLHRACK ATIVADO 🔒')
WALLHRACK1 = "ON☑️"
elseif WALLHRACK1 == "ON☑️"  then

gg["toast"]('🔓WALLHRACK DESATIVADO🔓')
WALLHRACK1 = "OFF❎"
end
end


 
 
 
  ANT_REPORT1 = "OFF❎"
function ANTI_REPOR(...)
if ANT_REPORT1 == "OFF❎"then 

gg["toast"]("🔒ANT REPOT ATIVADO🔒")
ANT_REPORT1 = "ON☑️"
elseif ANT_REPORT1 == "ON☑️" then 

gg["toast"]("ANT REPOT DESATIVADO")
ANT_REPORT1 = "OFF❎"
end
end





BYPASS_ANTIBAN1 = "OFF❎"
function BYPASS(...)
if BYPASS_ANTIBAN1 == "OFF❎"then 
gg["sleep"](50)
gg["toast"]("▓ 10%")
gg["sleep"](100)
gg["toast"]("▓▓ 20%")
gg["sleep"](150)
gg["toast"]("▓▓▓ 30%")
gg["sleep"](200)
gg["toast"]("▓▓▓▓ 40%")
gg["sleep"](250)
gg["toast"]("▓▓▓▓▓ 50%")
gg["sleep"](300)
gg["toast"]("▓▓▓▓▓▓ 60%")
gg["sleep"](350)
gg["toast"]("▓▓▓▓▓▓▓ 70%")
gg["sleep"](400)
gg["toast"]("▓▓▓▓▓▓▓▓ 80%")
gg["sleep"](450)
gg["toast"]("▓▓▓▓▓▓▓▓▓ 90%")
gg["sleep"](500)
gg["toast"]("▓▓▓▓▓▓▓▓▓▓ 100%")
gg["sleep"](500)
gg["toast"]("🔒 BYPASS ATIVADO🔒")
BYPASS_ANTIBAN1 = "ON☑️"
elseif BYPASS_ANTIBAN1 == "ON☑️" then 
gg["sleep"](50)
gg["toast"]("▓ 10%")
gg["sleep"](100)
gg["toast"]("▓▓ 20%")
gg["sleep"](150)
gg["toast"]("▓▓▓ 30%")
gg["sleep"](200)
gg["toast"]("▓▓▓▓ 40%")
gg["sleep"](250)
gg["toast"]("▓▓▓▓▓ 50%")
gg["sleep"](300)
gg["toast"]("▓▓▓▓▓▓ 60%")
gg["sleep"](350)
gg["toast"]("▓▓▓▓▓▓▓ 70%")
gg["sleep"](400)
gg["toast"]("▓▓▓▓▓▓▓▓ 80%")
gg["sleep"](450)
gg["toast"]("▓▓▓▓▓▓▓▓▓ 90%")
gg["sleep"](500)
gg["toast"]("▓▓▓▓▓▓▓▓▓▓ 100%")
gg["sleep"](500)
gg["toast"]("🔓BYPASS DESATIVADO 🔓")
BYPASS_ANTIBAN1 = "OFF❎"
end
end





TIRA_TRAVAMENTO1 = "OFF❎"
function TIRA_TRAVAMENTO(...)
if TIRA_TRAVAMENTO1 == "OFF❎"then 

-- Caminho para a pasta que contém os arquivos
local path = "/storage/emulated/0/Android/data/com.dts.freefireth/cache/UnityShaderCache/"

-- Função para listar arquivos e remover um por um
function removeFilesInFolder(folderPath)
    -- Usando o comando "ls" para listar os arquivos no diretório
    local handle = io.popen("ls " .. folderPath)
    local result = handle:read("*a")
    handle:close()

    -- Dividir a lista de arquivos por linha
    for file in result:gmatch("[^\r\n]+") do
        local filePath = folderPath .. file
        -- Remover o arquivo
        os.remove(filePath)
        print("Arquivo removido: " .. filePath)
    end
end

-- Chama a função passando o caminho da pasta
removeFilesInFolder(path)

gg["toast"]("🔒ATIVADO🔒")
TIRA_TRAVAMENTO1 = "ON☑️"
elseif TIRA_TRAVAMENTO1 == "ON☑️" then 

gg["toast"]("🔓DESATIVADO??")
TIRA_TRAVAMENTO1 = "OFF❎"
end
end





APAGAR_CACHER1 = "OFF❎"
function APAGAR_CACHER(...)
if APAGAR_CACHER1 == "OFF❎"then 

-- Caminho para a pasta que contém os arquivos
local path = "/storage/emulated/0/Android/data/com.dts.freefireth/cache/UnityShaderCache/"

-- Função para listar arquivos e remover um por um
function removeFilesInFolder(folderPath)
    -- Usando o comando "ls" para listar os arquivos no diretório
    local handle = io.popen("ls " .. folderPath)
    local result = handle:read("*a")
    handle:close()

    -- Dividir a lista de arquivos por linha
    for file in result:gmatch("[^\r\n]+") do
        local filePath = folderPath .. file
        -- Remover o arquivo
        os.remove(filePath)
        print("Arquivo removido: " .. filePath)
    end
end

-- Chama a função passando o caminho da pasta
removeFilesInFolder(path)

gg["toast"]("🔒APAGAR ATIVADO🔒")
APAGAR_CACHER1 = "ON☑️"
elseif APAGAR_CACHER1 == "ON☑️" then 

gg["toast"]("🔓APAGAR DESATIVADO🔓")
APAGAR_CACHER1 = "OFF❎"
end
end






APAGAR_CONTA1 = "OFF❎"
function APAGAR_CONTA(...)
if APAGAR_CONTA1 == "OFF❎"then 
os["remove"]("/storage/emulated/0/com.garena.msdk/guest100067.dat")
gg["toast"]("🔒SEMI ATIVADO🔒")
APAGAR_CONTA1 = "ON☑️"
elseif APAGAR_CONTA1 == "ON☑️" then 
os["remove"]("/storage/emulated/0/com.garena.msdk/guest100067.dat")
gg["toast"]("🔓SEMI DESATIVADO🔓")
APAGAR_CONTA1 = "OFF❎"
end
end



while true do
if gg["isVisible"](true) then
HrackGG2 = 1
gg["setVisible"](false)
end
if HrackGG2 == 1 then
HrackGG_OFICIAL()
end
if HrackGG5 == 2 then
HrackGG_OFICIAL()
end
HrackGG2 = -1
end


