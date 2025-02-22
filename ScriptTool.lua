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

-- Função de descriptografia simples (exemplo de XOR)
function decryptXOR(encryptedText, key)
    local decrypted = {}
    for i = 1, #encryptedText do
        decrypted[i] = string.char(bit.bxor(string.byte(encryptedText, i), key))
    end
    return table.concat(decrypted)
end

-- Função de monitoramento de erros e falhas
function monitorExecution(func)
    local success, err = pcall(func)
    if not success then
        gg.alert("Erro durante a execução do script: " .. err)
        -- Tenta corrigir ou interromper a execução
        print("Corrigindo erro...")
        return false
    end
    return true
end

-- Função para processar e executar o script
function executeScript()
    local file = io.open(scriptPath, "r")
    if not file then
        gg.alert("Erro ao abrir o arquivo de script!")
        return
    end

    local content = file:read("*all")
    file:close()

    -- Verifica se o script está criptografado (exemplo simples de XOR)
    local key = 123  -- A chave de criptografia
    local decryptedContent = decryptXOR(content, key)

    -- Salva o conteúdo descriptografado
    saveDecrypted("[Código Descriptografado]:\n" .. decryptedContent)

    -- Tenta carregar o script descriptografado
    local func, err = load(decryptedContent)
    if not func then
        gg.alert("Erro ao carregar a script: " .. err)
        return
    end

    -- Monitoramento da execução para evitar falhas
    local success = monitorExecution(func)
    if success then
        gg.toast("Script Executado com Sucesso!")
    else
        gg.alert("Falha ao executar o script!")
    end
end

-- Inicia a execução do sistema de descriptografia
gg.alert("Sistema de Descriptografação Ativado!\nAguarde o processamento...")
executeScript()