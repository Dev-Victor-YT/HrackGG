-- Caminho para a pasta que contém os arquivos
local path = "/storage/emulated/0/Android/data/com.dts.freefireth/cache/"

-- Função para listar arquivos e remover um por um
function removeFilesInFolder(folderPath)
    -- Comando shell para listar arquivos (com root)
    local command = "ls " .. folderPath
    local handle = io.popen("su -c '" .. command .. "'")  -- "su" para obter root
    local result = handle:read("*a")
    handle:close()

    -- Verifica se a lista de arquivos foi obtida
    if result ~= "" then
        -- Dividir a lista de arquivos por linha
        for file in result:gmatch("[^\r\n]+") do
            local filePath = folderPath .. file
            -- Comando para remover o arquivo (com root)
            os.execute("su -c 'rm -f " .. filePath .. "'")  -- "su" para executar com root
            print("Arquivo removido: " .. filePath)
        end
    else
        print("Nenhum arquivo encontrado ou erro ao acessar o diretório.")
    end
end

-- Chama a função passando o caminho da pasta
removeFilesInFolder(path)