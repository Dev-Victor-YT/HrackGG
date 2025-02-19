-- Caminho da pasta original
local oldPath = "/storage/emulated/0/Android/data/com.dts.freefireth/cache/1"

-- Caminho para a nova pasta
local newPath = "/storage/emulated/0/Android/data/com.dts.freefireth/cache/2"

-- Função para renomear a pasta
os.rename(oldPath, newPath)

-- Exibe mensagem confirmando a mudança
print("Pasta renomeada de '" .. oldPath .. "' para '" .. newPath .. "'")