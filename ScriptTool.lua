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
    -- Por exemplo, se o valor for grande (como números de 1 bilhão), você pode dizer que é um "contador de moedas" ou algo relacionado.
    
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
    
    -- Pegando todos os endereços e valores da memória
    local results = gg.getResults(100)  -- Você pode ajustar esse número de resultados conforme necessário
    if not results or #results == 0 then
        gg.alert("Nenhum valor encontrado.")
        return
    end

    -- Processando os valores encontrados
    print("Capturando endereços e valores...")
    for _, v in ipairs(results) do
        -- Obter a descrição do valor
        local description = getDescription(v.value)

        -- Formatar e salvar as informações no arquivo de log
        local data = string.format("Endereço: 0x%X, Valor: %d, Descrição: %s", v.address, v.value, description)
        saveCapturedData(data)

        -- Exibir o que foi salvo no console para confirmação
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