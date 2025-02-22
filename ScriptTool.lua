local scriptPath = "/storage/emulated/0/Download/DecryptScript.lua"
local logPath = "/storage/emulated/0/DecryptScript.txt"

-- Função para salvar logs
function saveScript(text)
    local file = io.open(logPath, "a")
    if not file then
        gg.alert("Erro ao salvar o log do script!")
        return
    end
    file:write(text .. "\n")
    file:close()
end

-- Função que será chamada para capturar cada linha em tempo real
function captureExecution(event, line)
    local info = debug.getinfo(2, "Sln")  -- Obtém informações da linha em execução
    if info and info.short_src and info.currentline > 0 then
        saveScript(string.format("[Executando] %s - Linha %d\n", info.short_src, info.currentline))
    end
end

-- Função para executar a script normalmente
function executeScript()
    local file = io.open(scriptPath, "r")
    if not file then
        gg.alert("Erro ao abrir o arquivo de script!")
        return
    end

    local content = file:read("*all")
    file:close()

    -- Salvar o código original
    saveScript("[Código Original]:\n" .. content)

    -- Tenta carregar a script
    local func, err = load(content)
    if not func then
        gg.alert("Erro ao carregar a script: " .. err)
        return
    end

    -- Ativa o Hook para capturar cada linha executada
    debug.sethook(captureExecution, "l")

    gg.toast("Executando script e capturando código descriptografado em tempo real...")
    
    -- Executa a script
    pcall(func)

    -- Remove o Hook após a execução
    debug.sethook(nil)
end

executeScript()