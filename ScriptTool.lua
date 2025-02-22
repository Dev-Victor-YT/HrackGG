local scriptPath = "/storage/emulated/0/Download/DecryptScript.lua"
local logPath = "/storage/emulated/0/DecryptScript.txt"

-- Função para executar a script
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

    -- Tenta carregar a script para monitorar
    local func, err = load(content)
    if not func then
        gg.alert("Erro ao carregar o script: " .. err)
        return
    end

    -- Configura um Hook para capturar o código em tempo real
    debug.sethook(captureDecryptedScript, "l")

    -- Executa o script normalmente
    gg.toast("Executando script e capturando código descriptografado...")
    pcall(func)

    -- Remove o Hook após a execução
    debug.sethook(nil)
end

-- Função para salvar no log
function saveScript(text)
    local file = io.open(logPath, "a")
    if not file then
        gg.alert("Erro ao salvar o log do script!")
        return
    end
    file:write(text .. "\n")
    file:close()
end

-- Função para capturar código descriptografado em tempo real
function captureDecryptedScript(event)
    local info = debug.getinfo(2, "Sl")
    if info and info.source and info.currentline > 0 then
        saveScript(string.format("Código Executado [%s]: %s\n", info.short_src, info.currentline))
    end
end

executeScript()