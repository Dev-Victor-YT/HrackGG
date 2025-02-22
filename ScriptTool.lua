-- Caminho para salvar os dados capturados
local logPath = "/storage/emulated/0/Download/values_from_script.txt"

-- Função para salvar os dados no arquivo
function saveCapturedData(data)
    local file, err = io.open(logPath, "a")
    if not file then
        print("Erro ao salvar os dados: " .. err)
        return
    end
    file:write(data .. "\n")
    file:close()
end

-- Função para capturar os valores em execução no GameGuardian
function captureScriptValues()
    -- Pegando os valores e endereços dos valores que estão sendo manipulados
    local results = gg.getResults(100)  -- Captura 100 resultados por vez
    
    if not results or #results == 0 then
        print("Nenhum valor encontrado.")
        return
    end
    
    local capturedData = {}
    
    -- Coletando os endereços e valores
    for _, v in ipairs(results) do
        local value = v.value
        local address = v.address
        local description = "Valor não descrito"
        
        -- Criar uma descrição baseada no valor (aqui você pode customizar como quiser)
        if value >= 1000000 then
            description = "Provavelmente um contador alto"
        elseif value == 1 then
            description = "Valor binário"
        elseif value == 0 then
            description = "Valor neutro"
        end
        
        -- Formatar os dados para salvar
        local data = string.format("Endereço: 0x%X, Valor: %d, Descrição: %s", address, value, description)
        table.insert(capturedData, data)
    end
    
    -- Salvando todos os dados no arquivo
    for _, data in ipairs(capturedData) do
        saveCapturedData(data)
    end
    
    -- Exibindo os dados no console
    for _, data in ipairs(capturedData) do
        print(data)
    end
end

-- Função principal para capturar os valores
function startCapture()
    print("Iniciando captura de valores da script Lua em execução.")
    
    -- Iniciar captura dos valores da script Lua
    captureScriptValues()
    
    print("Captura finalizada.")
end

-- Iniciar o processo de captura
startCapture()