local scriptPath = "/storage/emulated/0/Download/DecryptScript.lua"  
local logPath = "/storage/emulated/0/DecryptScript.txt"

-- Função para executar o script principal e capturar o código descriptografado
function executeScript()
    local file = io.open(scriptPath, "r")
    if not file then
        gg.alert("Erro ao abrir o arquivo de script!")
        return
    end

    local content = file:read("*all")
    file:close()

    -- Salvar o código original no log
    saveScript("Código Original:\n" .. content)

    -- Executa o script e captura o código descriptografado
    local func, err = load(content)
    if not func then
        gg.alert("Erro ao carregar o script: " .. err)
        return
    end

    gg.toast("Executando script e capturando código descriptografado...")

    -- Capturar código descriptografado enquanto a script está rodando
    pcall(func)

    -- Salvar o código já carregado no GameGuardian (descriptografado)
    captureDecryptedScript()
end

-- Função para salvar um texto no log
function saveScript(text)
    local file = io.open(logPath, "w")
    if not file then
        gg.alert("Erro ao salvar o log do script!")
        return
    end
    file:write(text .. "\n")
    file:close()
end

-- Função para capturar o código descriptografado do GameGuardian
function captureDecryptedScript()
    local decryptedCode = debug.getinfo(1, "S").source  -- Captura o código já carregado no GameGuardian
    if decryptedCode then
        saveScript("\nCódigo Descriptografado:\n" .. decryptedCode)
        gg.alert("Código descriptografado salvo com sucesso!")
    else
        gg.alert("Erro ao capturar código descriptografado!")
    end
end

executeScript()