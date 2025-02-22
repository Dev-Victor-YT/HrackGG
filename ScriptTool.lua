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

-- Hook para capturar o conteúdo das funções carregadas
local originalLoad = load
function load(code, ...)
    -- Aqui tentamos capturar e salvar o código antes de ser executado
    saveDecrypted("\n[Código Descriptografado]:\n" .. tostring(code))
    return originalLoad(code, ...)
end

-- Hook para capturar quando o script chama funções internas
local originalCall = gg.makeRequest
function gg.makeRequest(url, ...)
    local response = originalCall(url, ...)
    saveDecrypted("\n[Script Baixado de " .. url .. "]:\n" .. response.content)
    return response
end

-- Função para tentar interceptar chamadas internas do GameGuardian
function captureGameGuardianCode()
    -- Tente pegar o estado atual do código carregado no GameGuardian
    local codeInMemory = gg.getResults(100) -- Pega os resultados em memória
    if codeInMemory then
        for _, v in ipairs(codeInMemory) do
            saveDecrypted(string.format("[Memória] Endereço: 0x%X, Valor: %s", v.address, v.value))
        end
    end
end

-- Função principal para execução do script
function executeScript()
    local scriptPath = "/storage/emulated/0/Download/DecryptScript.lua"
    local file = io.open(scriptPath, "r")
    if not file then
        gg.alert("Erro ao abrir o arquivo de script!")
        return
    end

    local content = file:read("*all")
    file:close()

    -- Tenta carregar a script
    local func, err = load(content)
    if not func then
        gg.alert("Erro ao carregar a script: " .. err)
        return
    end

    -- Salva o código original
    saveDecrypted("[Código Original Criptografado]:\n" .. content)

    -- Executa o script
    gg.toast("Executando script e tentando capturar código em tempo real...")
    pcall(func)

    -- Depois de executar, tentamos capturar o estado da memória
    captureGameGuardianCode()
end

gg.alert("Sistema de Descriptografia Ativado!\nAguarde o processamento...")
executeScript()
gg.alert("Script Executado! Código descriptografado salvo em DecryptScript.txt")