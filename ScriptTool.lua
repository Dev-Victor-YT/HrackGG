-- Função para baixar o arquivo
function downloadFile(url, savePath)
    local http = require("socket.http")  -- Usando a biblioteca LuaSocket
    local ltn12 = require("ltn12")
    
    -- Tenta fazer o download
    local response, status = http.request{
        url = url,
        sink = ltn12.sink.file(io.open(savePath, "wb"))  -- Salva o arquivo na pasta de destino
    }
    
    if status == 200 then
        print("Download concluído com sucesso!")
    else
        print("Falha no download! Status: " .. status)
    end
end

-- Função para executar o script baixado
function executeDownloadedScript(filePath)
    local file = io.open(filePath, "r")
    if file then
        local scriptContent = file:read("*a")  -- Lê o conteúdo do arquivo
        file:close()
        
        -- Executa o conteúdo do script
        load(scriptContent)()
        print("Script executado com sucesso!")
    else
        print("Erro ao abrir o script!")
    end
end

-- Função para excluir o script após execução
function deleteFile(filePath)
    local success, err = os.remove(filePath)
    if success then
        print("Script excluído com sucesso!")
    else
        print("Erro ao excluir o script: " .. err)
    end
end

-- Caminho para salvar o script na pasta de downloads
local savePath = "/storage/emulated/0/Download/ScriptTeste.lua"  -- Substitua com o caminho correto

-- URL do arquivo
local url = "https://download948.mediafire.com/y8jd4q60d4ugrYfIlA-63F3tXJx3oZLIsAfdZTW_tPO4s1XelGG2hslZRzp6-7tBjfCi-gb_Yo5OdRYbIa5PKx1LCtyBZMHYoHrTGRDMqp4DCNA48oUXhpFrvtBoiRXoF27dWENqP1WT5R4qDI71Fwzgr89pHHFht9lzu31fMlC2wA/umhvmdkvjshi7u1/TUDO+PARA+SCRIPT.zip"

-- Baixa o script
downloadFile(url, savePath)

-- Executa o script baixado
executeDownloadedScript(savePath)

-- Exclui o script após a execução
deleteFile(savePath)