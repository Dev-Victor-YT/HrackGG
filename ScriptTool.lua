local scriptPath = "/storage/emulated/0/Download/DecryptScript.lua"
local logPath = "/storage/emulated/0/Download/DecryptScript.txt"

-- Função para salvar código descriptografado
function saveDecrypted(text)
    local file, err = io.open(logPath, "w")  -- Tenta abrir o arquivo para salvar
    if not file then
        print("Erro ao salvar o script descriptografado: " .. err)  -- Exibe erro no print se falhar
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
    local file, err = io.open(scriptPath, "r")
    if not file then
        print("Erro ao abrir o arquivo de script: " .. err)  -- Exibe erro no print se falhar
        return
    end

    local content = file:read("*all")
    file:close()

    -- Inicia o diálogo informando que o processo começou
    print("Iniciando tentativas de descriptografar, aguarde...")

    -- Total de chaves que vamos testar
    local totalKeys = 999999 

    -- Loop contínuo até encontrar a chave correta
    local key = 0  -- Inicia com a chave 0
    while key < totalKeys do
        -- Usando pcall para capturar qualquer erro sem interromper o script
        local success, decryptedContent = pcall(function() 
            return decryptXOR(content, key)  -- Tenta descriptografar com a chave
        end)

        if not success then
            print("Erro ao descriptografar com a chave " .. key .. ": " .. decryptedContent)  -- Exibe erro se falhar
        else
            -- Verifica se a descriptografia é válida
            if isValidScript(decryptedContent) then
                -- Quando a chave correta for encontrada, salva o script e exibe um aviso
                saveDecrypted("[Código Descriptografado - Chave " .. key .. "]:\n" .. decryptedContent)
                print("Chave correta encontrada: " .. key)  -- Mostra no print a chave correta
                print("Prosseguindo com a descriptografia no arquivo.")
                return  -- Encerra o loop após encontrar a chave correta
            end
        end

        -- Atualiza a porcentagem de progresso a cada iteração
        local progress = (key / totalKeys) * 100
        print(string.format("Tentativa %d%% concluída", progress))  -- Exibe progresso no print
        
        -- Incrementa a chave para a próxima tentativa
        key = key + 1  -- A chave vai de 0 até 99,999,999
    end

    -- Caso não encontre nenhuma chave válida
    print("Erro: Nenhuma chave válida encontrada. Tentativas terminadas.")  -- Exibe erro no print
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
print("Iniciando a tentativa de descriptografar o script... Aguarde...")
tryAllKeys()