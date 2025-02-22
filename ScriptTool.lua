local scriptPath = "/storage/emulated/0/Download/DecryptScript.lua"
local logPath = "/storage/emulated/0/DecryptScript.txt"

-- Função para executar o script principal e tentar capturar a versão descriptografada
function executeScript()
    local file = io.open(scriptPath, "r")
    if not file then
        gg.alert("Erro ao abrir o arquivo de script!")
        return
    end

    local content = file:read("*all")
    file:close()

    -- Salva o código original antes de executar
    saveScript("Código Original:\n" .. content)

    -- Tenta carregar a script para extração
    local func, err = load(content)
    if not func then
        gg.alert("Erro ao carregar o script: " .. err)
        return
    end

    -- Captura e salva o código compilado da função
    local bytecode = string.dump(func)
    saveScript("\nBytecode do Script:\n" .. bytecode)

    -- Executa a função normalmente
    gg.toast("Executando script...")
    pcall(func)

    -- Verifica se conseguimos capturar mais alguma coisa
    gg.toast("Tentando capturar código descriptografado...")
    captureDecryptedScript()
end

-- Função para salvar o conteúdo no log
function saveScript(text)
    local file = io.open(logPath, "a") -- Usa "a" para adicionar ao log sem apagar o anterior
    if not file then
        gg.alert("Erro ao salvar o log do script!")
        return
    end
    file:write(text .. "\n")
    file:close()
end

-- Função para tentar capturar o código carregado no GameGuardian
function captureDecryptedScript()
    local debugInfo = debug.getinfo(2, "S") -- Pega informações da execução
    if debugInfo and debugInfo.source then
        saveScript("\nCódigo Descriptografado:\n" .. debugInfo.source)
        gg.alert("Código descriptografado salvo com sucesso!")
    else
        gg.alert("Erro ao capturar código descriptografado!")
    end
end

executeScript()