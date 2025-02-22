-- Função para criptografar
function encrypt(text, shift)
    local encrypted = ""
    for i = 1, #text do
        local char = text:sub(i, i)
        local num = string.byte(char)
        local encryptedNum = num + shift  -- Desloca o valor do byte
        encrypted = encrypted .. string.char(encryptedNum)  -- Converte de volta para caractere
    end
    return encrypted
end

-- Função para descriptografar
function decrypt(encryptedText, shift)
    local decrypted = ""
    for i = 1, #encryptedText do
        local char = encryptedText:sub(i, i)
        local num = string.byte(char)
        local decryptedNum = num - shift  -- Reverte o deslocamento
        decrypted = decrypted .. string.char(decryptedNum)  -- Converte de volta para caractere
    end
    return decrypted
end

-- Função principal para selecionar o que fazer
function main()
    print("Escolha uma opção: ")
    print("1. Criptografar")
    print("2. Descriptografar")
    
    local choice = io.read()  -- Lê a escolha do usuário
    
    print("Digite o texto:")
    local inputText = io.read()  -- Lê o texto a ser processado
    
    print("Digite o valor do deslocamento (shift):")
    local shift = tonumber(io.read())  -- Lê o valor do deslocamento (convertido para número)

    if choice == "1" then
        local encryptedText = encrypt(inputText, shift)
        print("Texto criptografado: " .. encryptedText)
    elseif choice == "2" then
        local decryptedText = decrypt(inputText, shift)
        print("Texto descriptografado: " .. decryptedText)
    else
        print("Opção inválida!")
    end
end

-- Executa o programa
main()