

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
GHOT1 .." 👻FANTASMA VIP👻",
ZE_PEDRINHA1 .." ⛰️ ZE PEDRINHA VIP⛰️",
WALLHRACK1 .." ⛰️ WALLHRACK VIP⛰️",
ANTENA_CABECA1  .."👦ANTENA CABEÇA VIP👦",
ANT_REPORT1 .."🔒ANT REPORT VIP🔒",
BYPASS_ANTIBAN1 .." ⏳BYPASS ANTIBAN VIP⏳",
TIRA_TRAVAMENTO1 .."📱TIRA TRAVAMENTO 100% VIP📱",
APAGAR_CACHER1 .." 🗑️APAGAR CACHER VIP🗑️",
APAGAR_CONTA1 .." 🗑️APAGAR COTNA VIP🗑️",
" ❌SAIR DA SCRIPT❌ "
}, nil, (os["date"]("🛡CRIADOR : HrackGG\n🛡HORAS:%H:%M:%S\n🛡SCRIPT VIP V1\n🛡FREE FIRE 1.X.X\n🛡EXPIRA 30/02/2025")))
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
GHOST()
end
if HrackGG == 2 then
PEDRINHA()
end
if HrackGG == 3 then
WALLHRACK()
end
if HrackGG == 4 then
ANTENA1()
end
if HrackGG == 5 then
ANTI_REPOR()
end
if HrackGG == 6 then
BYPASS()
end
if HrackGG == 7 then
TIRA_TRAVAMENTO()
end
if HrackGG == 8 then
APAGAR_CACHER()
end
if HrackGG == 9 then
APAGAR_CONTA()
end
if HrackGG == 10 then
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





GHOT1 = "OFF❎"
function GHOST(...)
if GHOT1 == "OFF❎"  then
HrackGG10("0xE0A34C", "0000A0E31EFF2FE1")
gg.clearResults()
gg["toast"]('🔒GHOST ATIVADO🔒')
GHOT1 = "ON☑️"
elseif GHOT1 == "ON☑️"  then
HrackGG10("0xE0A34C", "F04F2DE91CB08DE2")
gg.clearResults()
gg["toast"]('🔓GHOST DESATIVADO🔓 ')
GHOT1 = "OFF❎"
end
end





ZE_PEDRINHA1 = "OFF❎"
function PEDRINHA(...)
if ZE_PEDRINHA1 == "OFF❎"  then
gg["clearResults"]()
io["output"](fileData):write([[
13965
Var #C5671E68|c5671e68|10|3f800000|0|0|0|0|r-xp|/data/app/com.dts.freefireth-MVBrBLlAtt2JKNz2itAl5Q==/lib/arm/libunity.so|ad7e68
]]):close()
gg["loadList"](fileData, gg.LOAD_APPEND | gg.LOAD_VALUES)
os["remove"](fileData)
gg["sleep"](50)
gg["clearList"]()
gg["clearResults"]()
gg["toast"]('🔒ZE PEDRINHA ATIVADO 🔒')
ZE_PEDRINHA1 = "ON☑️"
elseif ZE_PEDRINHA1 == "ON☑️"  then
gg["clearResults"]()
io["output"](fileData):write([[
13965
Var #C5671E68|c5671e68|10|cafffe57|0|0|0|0|r-xp|/data/app/com.dts.freefireth-MVBrBLlAtt2JKNz2itAl5Q==/lib/arm/libunity.so|ad7e68
]]):close()
gg["loadList"](fileData, gg.LOAD_APPEND | gg.LOAD_VALUES)
os["remove"](fileData)
gg["sleep"](50)
gg["clearList"]()
gg["clearResults"]()
gg["toast"]('🔓ZE PEDRINHA DESATIVADO🔓')
ZE_PEDRINHA1 = "OFF❎"
end
end




WALLHRACK1 = "OFF❎"
function WALLHRACK(...)
if WALLHRACK1 == "OFF❎"  then

-- Caminho da pasta original
local oldPath = "/storage/emulated/0/Android/obb/com.dts.freefireth"

-- Caminho para a nova pasta
local newPath = "/storage/emulated/0/Android/obb/com.dts.freefireth2"

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





ANTENA_CABECA1  = "OFF❎"
function ANTENA1(...)
if ANTENA_CABECA1  == "OFF❎"  then
gg["setRanges"](gg.REGION_ANONYMOUS)
gg["searchNumber"]("5.9762459e-7;1::5", gg.TYPE_FLOAT)
gg["getResults"](1000)
gg.editAll("5.9762459e-7;250.1", gg.TYPE_FLOAT)
gg["clearResults"]()
gg["searchNumber"]("7.5538861e-7;1::5", gg.TYPE_FLOAT)
gg["getResults"](1000)
gg.editAll("7.5538861e-7;250.1", gg.TYPE_FLOAT)
gg["clearResults"]()
gg["toast"]('🔒ANTENA ATIVADO🔒')
ANTENA_CABECA1  = "ON☑️"
elseif ANTENA_CABECA1  == "ON☑️"  then
gg["setRanges"](gg.REGION_ANONYMOUS)
gg["searchNumber"]("250.1", gg.TYPE_FLOAT)
gg["getResults"](1000)
gg.editAll("1", gg.TYPE_FLOAT)
gg["clearResults"]()
gg["toast"]('🔓ANTENA DESATIVADO🔓')
ANTENA_CABECA1  = "OFF❎"
end
end
 
 
 
 
 
  ANT_REPORT1 = "OFF❎"
function ANTI_REPOR(...)
if ANT_REPORT1 == "OFF❎"then 
gg["setRanges"](32)
gg["searchNumber"]("R_R({83,65,103,40,11,249,31,224,203,177,215,152,126,127,143,80,52,36,71,8,236,220,255,192,164,152,183,120,94,94,111,47,29,9})", 1, false, 536870912, 0, -1)
gg.refineNumber("R_R({83,65,103,40,11,249,31,224,203,177,215,152,126,127,143,79,61,37})", 1, false, 536870912, 0, -1)
gg["getResults"](10000)
gg.editAll("R_R({83,65,103,40,11,249,31,224,199,185,215,152,127,108,143})", 1)
gg["clearResults"]()
gg["toast"]("🔒ANT REPOT ATIVADO🔒")
ANT_REPORT1 = "ON☑️"
elseif ANT_REPORT1 == "ON☑️" then 
gg["setRanges"](32)
gg["searchNumber"]("R_R({83,65,103,40,11,249,31,224,203,177,215,152,126,127,143,80,52,36,71,8,236,220,255,192,164,152,183,120,94,94,111,47,29,9})", 1, false, 536870912, 0, -1)
gg.refineNumber("R_R({83,65,103,40,11,249,31,224,199,185,215,152,127,108,143})", 1, false, 536870912, 0, -1)
gg["getResults"](10000)
gg.editAll("R_R({83,65,103,40,11,249,31,224,203,177,215,152,126,127,143,79,61,37})", 1)
gg["clearResults"]()
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


