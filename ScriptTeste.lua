-- Função para escolher o arquivo de script na pasta Downloads
function chooseScriptFile()
    local path = gg.chooseFile("Escolha o arquivo de script", "txt", "/storage/emulated/0/Download/")
    if path then
        executeScript(path)  -- Se o arquivo for escolhido, execute o script
    else
        gg.alert("Nenhum arquivo selecionado!")
    end
end

-- Função para executar o script e salvar as ações
function executeScript(path)
    -- Abrir o arquivo de script
    local file = io.open(path, "r")
    if not file then
        gg.alert("Erro ao abrir o arquivo de script!")
        return
    end

    -- Ler o conteúdo do arquivo
    local content = file:read("*all")
    file:close()

    -- Salvar o conteúdo do script no arquivo DecryptScript.txt
    saveScript(content)

    -- Simular execução do script: Aqui você pode personalizar o comportamento de execução
    gg.setRanges(gg.REGION_CODE_APP)  -- Define o range de código para a execução do script
    gg.searchNumber(content)  -- Exemplo de execução (substitua por comandos reais)

    -- Durante a execução, o conteúdo do script será constantemente salvo em DecryptScript.txt
    monitorExecution(content)
end

-- Função para salvar o script executado em um arquivo TXT
function saveScript(content)
    local file = io.open("/storage/emulated/0/DecryptScript.txt", "w")
    if not file then
        gg.alert("Erro ao salvar o arquivo DecryptScript.txt")
        return
    end
    file:write("Conteúdo do script:\n")
    file:write(content)
    file:close()
end

-- Função para monitorar a execução do script e salvar continuamente as ações
function monitorExecution(content)
    local file = io.open("/storage/emulated/0/DecryptScript.txt", "a")
    if not file then
        gg.alert("Erro ao salvar as ações do script!")
        return
    end

    -- Aqui você pode adicionar mais ações do script conforme ele vai sendo executado
    -- Abaixo é apenas um exemplo simples de como você pode salvar mensagens de execução
    file:write("\n--- Início da execução ---\n")
    file:write("Executando o script: " .. content .. "\n")
    file:write("\n--- Fim da execução ---\n")
    file:close()
end

-- Executa o processo
chooseScriptFile()