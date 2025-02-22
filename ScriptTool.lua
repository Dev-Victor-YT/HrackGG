-- Função para modificar valores no pacote Free Fire automaticamente
function modifyValues()
    -- Definindo os valores a serem pesquisados e os novos valores
    local searchValues = {
        {search = "5.9762459e-7;1::5", replace = "5.9762459e-7;250.1"},
        {search = "7.5538861e-7;1::5", replace = "7.5538861e-7;250.1"}
    }

    -- Percorrendo a tabela de valores a serem modificados
    for _, value in ipairs(searchValues) do
        -- Definir a região de memória a ser analisada
        gg.setRanges(gg.REGION_ANONYMOUS)
        
        -- Buscar o valor na memória
        gg.searchNumber(value.search, gg.TYPE_FLOAT)
        
        -- Obter os resultados da busca
        local results = gg.getResults(1000)
        
        -- Se houver resultados, editar os valores
        if #results > 0 then
            gg.editAll(value.replace, gg.TYPE_FLOAT)
            gg.clearResults()
        else
            gg.alert("Valor " .. value.search .. " não encontrado!")
        end
    end

    -- Exibir uma mensagem de sucesso
    gg.toast('🔒ANTENA ATIVADO🔒')
end

-- Função para garantir que o pacote correto esteja selecionado
function selectPackage(packageName)
    -- Se o pacote já estiver selecionado, não faz nada
    local currentPackage = gg.getTargetPackage()

    -- Caso não esteja selecionado o pacote correto, tentamos selecioná-lo
    if currentPackage ~= packageName then
        gg.setTargetPackage(packageName)  -- Seleciona o pacote automaticamente
    end
end

-- Função principal
function main()
    -- Definindo o nome do pacote que queremos modificar
    local packageName = "com.dts.freefireth"

    -- Selecionar o pacote correto (se não estiver selecionado)
    selectPackage(packageName)
    
    -- Modificar os valores no pacote selecionado
    modifyValues()
end

-- Executar o script
main()