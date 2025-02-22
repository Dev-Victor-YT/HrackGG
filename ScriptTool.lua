-- Função para selecionar o pacote do aplicativo
function selectPackage()
    local package = gg.prompt({'Digite o nome do pacote do aplicativo (ex: com.exemplo.app)'}, nil, {'text'})
    if not package then
        gg.alert("Nome do pacote não fornecido.")
        return
    end
    return package[1]
end

-- Função para selecionar o valor a ser pesquisado
function selectSearchValue()
    local searchValue = gg.prompt({'Digite o valor que você quer pesquisar (ex: 1000)'}, nil, {'number'})
    if not searchValue or searchValue[1] == "" then
        gg.alert("Valor de pesquisa não fornecido.")
        return
    end
    return tonumber(searchValue[1])
end

-- Função para selecionar o novo valor a ser alterado
function selectNewValue()
    local newValue = gg.prompt({'Digite o novo valor para substituir (ex: 999999)'}, nil, {'number'})
    if not newValue or newValue[1] == "" then
        gg.alert("Novo valor não fornecido.")
        return
    end
    return tonumber(newValue[1])
end

-- Função para pesquisar e modificar o valor no aplicativo
function modifyValue(package, targetValue, newValue)
    -- Procurar pelo nome do pacote, para garantir que estamos no contexto correto
    gg.setRanges(gg.REGION_C_ALLOC)
    gg.searchNumber(targetValue, gg.TYPE_DWORD)
    
    -- Verificar se o valor foi encontrado
    local results = gg.getResults(100)
    if #results == 0 then
        gg.alert("Nenhum valor encontrado para " .. targetValue)
        return
    end
    
    -- Modificar os valores encontrados
    for _, v in ipairs(results) do
        -- Substituir o valor no endereço encontrado
        gg.editAll(newValue, gg.TYPE_DWORD)
    end
    
    gg.alert("Valores modificados com sucesso!")
end

-- Função principal
function main()
    -- Escolher o pacote do aplicativo
    local package = selectPackage()
    if not package then return end
    
    -- Selecionar o valor que será pesquisado
    local targetValue = selectSearchValue()
    if not targetValue then return end
    
    -- Selecionar o novo valor a ser alterado
    local newValue = selectNewValue()
    if not newValue then return end
    
    -- Modificar o valor no aplicativo
    modifyValue(package, targetValue, newValue)
end

-- Executar o script
main()