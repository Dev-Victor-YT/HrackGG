local scriptPath = "/storage/emulated/0/Download/DecryptScript.lua"
local logPath = "/storage/emulated/0/Download/DecryptScript.txt"

-- Função para salvar código descriptografado
function saveDecrypted(text)
    local file = io.open(logPath, "w")  -- Sobrescreve para manter o último script
    if not file then
        gg.toast("Erro ao salvar o script descriptografado!")  -- Usar toast para erro
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

-- Função para tentar todas as chaves de 0 a 99999999 (loop contínuo até achar a chave)
function tryAllKeys()
    local file = io.open(scriptPath, "r")
    if not file then
        gg.toast("Erro ao abrir o arquivo de script!")
        return
    end

    local content = file:read("*all")
    file:close()

    -- Inicia o diálogo informando que o processo começou (sem pausar o script)
    gg.toast("Iniciando tentativas de descriptografar, aguarde...")

    -- Total de chaves que vamos testar
    local totalKeys = 100000000  

    -- Loop contínuo até encontrar a chave correta
    local key = 0  -- Inicia com a chave 0
    while key < totalKeys do
        local decryptedContent = decryptXOR(content, key)

        -- Verifica se a descriptografia é válida
        if isValidScript(decryptedContent) then
            -- Quando a chave correta for encontrada, salva o script e exibe um aviso
            saveDecrypted("[Código Descriptografado - Chave " .. key .. "]:\n" .. decryptedContent)
            gg.toast("Chave correta encontrada: " .. key)
            gg.toast("Prosseguindo com a descriptografia no arquivo.")
            return
        end

        -- Atualiza a porcentagem de progresso a cada iteração
        local progress = (key / totalKeys) * 100
        gg.toast(string.format("Tentativa %d%% concluída", progress))
        
        -- Incrementa a chave para a próxima tentativa
        key = key + 1  -- A chave vai de 0 até 99,999,999
    end

    -- Caso não encontre nenhuma chave válida
    gg.toast("Nenhuma chave válida encontrada.")
end

-- Função para verificar se o conteúdo descriptografado é válido
-- (Aqui você pode implementar uma verificação para saber se o código descriptografado é executável)
function isValidScript(content)
    -- Aqui, você pode adicionar verificações para saber se o código está correto
    -- Exemplo: Se o código descriptografado contém alguma estrutura específica
    -- como "function" ou algum trecho que você espera no script.
    return string.match(content, "function") ~= nil
end

-- Inicia a tentativa de descriptografar com todas as chaves
gg.toast("Iniciando a tentativa de descriptografar o script... Aguarde...")
tryAllKeys()