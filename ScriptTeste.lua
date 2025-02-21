-- Função para criar a interface flutuante
function createInterface()
    local window = gg.alert("Escolha uma opção", "Escolher Script", "Cancelar")
    if window == 1 then
        -- Seleciona o arquivo de script
        local path = gg.chooseFile("Escolha o arquivo de script", "txt", "/storage/emulated/0/")
        if path then
            -- Se o caminho foi escolhido, executa o script
            executeScript(path)
        end
    end
end

-- Função para executar o script
function executeScript(path)
    local file = io.open(path, "r")
    if not file then
        gg.alert("Erro ao abrir o arquivo")
        return
    end

    local content = file:read("*all")
    file:close()

    -- Salvando o script executado em um arquivo TXT
    saveScript(content)

    -- Executa o script aqui (implementação personalizada)
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber(content)  -- Exemplo de execução de comandos do script
end

-- Função para salvar o script executado
function saveScript(content)
    local file = io.open("/storage/emulated/0/DecryptScript.txt", "w")
    if not file then
        gg.alert("Erro ao salvar o arquivo")
        return
    end
    file:write(content)
    file:close()
end

-- Executa a interface
createInterface()