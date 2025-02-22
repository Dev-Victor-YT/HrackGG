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

-- Interceptar a função "load" para capturar código descriptografado
local originalLoad = load
function load(code, ...)
    -- Salva o código que foi carregado para execução
    saveScript("\n[Código Descriptografado Capturado]:\n" .. tostring(code))
    return originalLoad(code, ...)
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

    -- Executar script normalmente
    local func, err = load(content)
    if not func then
        gg.alert("Erro ao carregar a script: " .. err)
        return
    end

    gg.toast("Executando script e capturando código descriptografado...")
    pcall(func)
end

executeScript()