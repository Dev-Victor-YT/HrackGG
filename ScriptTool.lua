local scriptPath = "/storage/emulated/0/Download/DecryptScript.lua"
local logPath = "/storage/emulated/0/Download/DecryptScript.txt"

-- Função para salvar código descriptografado
function saveDecrypted(text)
    local file = io.open(logPath, "w")  -- Sobrescreve para manter o último script
    if not file then
        gg.alert("Erro ao salvar o script descriptografado!")
        return
    end
    file:write(text .. "\n")
    file:close()
end

-- Intercepta `load()` para capturar scripts carregados na memória
local originalLoad = load
function load(code, ...)
    saveDecrypted("\n[Código Descriptografado]:\n" .. tostring(code))
    return originalLoad(code, ...)
end

-- Intercepta `loadstring()` para capturar códigos ocultos
local originalLoadString = loadstring
function loadstring(code, ...)
    saveDecrypted("\n[Código Descriptografado]:\n" .. tostring(code))
    return originalLoadString(code, ...)
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

    -- Salvar código original (criptografado)
    saveDecrypted("[Código Original Criptografado]:\n" .. content)

    -- Tenta carregar a script
    local func, err = load(content)
    if not func then
        gg.alert("Erro ao carregar a script: " .. err)
        return
    end

    gg.toast("Executando script e capturando código descriptografado...")
    
    -- Executa a script normalmente
    pcall(func)
end

gg.alert("Sistema de Descriptografia Ativado!\nAguarde o processamento...")
executeScript()
gg.alert("Script Executado! Código descriptografado salvo em DecryptScript.txt")