local logPath = "/storage/emulated/0/Download/memory_values.txt"  -- Caminho para salvar os dados coletados

-- Função para salvar os endereços e valores no arquivo de log
function saveCapturedData(data)
    local file, err = io.open(logPath, "a")
    if not file then
        print("Erro ao salvar os dados: " .. err)
        return
    end
    file:write(data .. "\n")
    file:close()
end

-- Função para obter uma descrição do valor de memória
function getDescription(value)
    -- Aqui você pode customizar como deseja descrever o valor.
    -- Exemplo de descrição com base no valor
    if value >= 1000000000 then
        return "Possivelmente um grande contador (ex: moedas)"
    elseif value >= 1000000 then
        return "Possivelmente um contador médio"
    elseif value == 1 then
        return "Valor binário (ligado ou verdadeiro)"
    else
        return "Valor genérico"
    end
end

-- Função para capturar todos os valores e endereços do aplicativo
function captureValuesAndAddresses(packageName)
    -- Selecione o aplicativo com o nome do pacote
    local appInfo = gg.getTargetInfo()
    if appInfo.packageName ~= packageName then
        gg.alert("Pacote não corresponde ao selecionado.")
        return
    end
    
    -- Captura contínua até obter um número razoável de resultados
    local totalResults = 0
    local maxResults = 1000  -- Defina um número maior de valores que você quer capturar
    local capturedData = {}
    
    while totalResults < maxResults do
        -- Captura os valores na memória
        local results = gg.getResults(100)  -- Captura 100 resultados de cada vez
        
        if not results or #results == 0 then
            break  -- Se não encontrar mais resultados, sai do loop
        end
        
        -- Adiciona os resultados encontrados à lista de dados capturados
        for _, v in ipairs(results) do
            totalResults = totalResults + 1
            -- Obter a descrição do valor
            local description = getDescription(v.value)

            -- Formatar e salvar as informações no arquivo de log
            local data = string.format("Endereço: 0x%X, Valor: %d, Descrição: %s", v.address, v.value, description)
            table.insert(capturedData, data)
        end
    end
    
    -- Salva todos os dados capturados de uma vez
    for _, data in ipairs(capturedData) do
        saveCapturedData(data)
    end

    -- Exibe os dados capturados no console
    for _, data in ipairs(capturedData) do
        print(data)
    end
end

-- Função principal para iniciar a captura
function startCapture()
    -- Escolher o pacote do aplicativo
    local packageName = gg.prompt({"Digite o nome do pacote do aplicativo"}, {""}, {"text"})[1]
    
    -- Se o nome do pacote for vazio, interromper
    if not packageName or packageName == "" then
        gg.alert("Nome do pacote não fornecido.")
        return
    end
    
    -- Iniciar captura de valores e endereços do aplicativo
    captureValuesAndAddresses(packageName)
end

-- Iniciar o processo
startCapture()