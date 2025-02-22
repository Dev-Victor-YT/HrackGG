-- Requer a instalação do IUP
require("iuplua")

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

-- Função para exibir os códigos numéricos
function showNumericCode(text)
    local numericCode = ""
    for i = 1, #text do
        local num = string.byte(text:sub(i, i))
        numericCode = numericCode .. num .. " "
    end
    return numericCode
end

-- Função chamada ao pressionar o botão "Criptografar"
function encryptCallback()
    local inputText = iup.GetText(textInput)  -- Obtém o texto inserido
    local shift = tonumber(iup.GetText(shiftInput))  -- Obtém o valor de deslocamento
    local encryptedText = encrypt(inputText, shift)
    local numericEncrypted = showNumericCode(encryptedText)

    -- Atualiza o campo de saída com o texto criptografado e código numérico
    iup.SetText(outputText, "Texto criptografado: " .. encryptedText .. "\nCódigo numérico: " .. numericEncrypted)
end

-- Função chamada ao pressionar o botão "Descriptografar"
function decryptCallback()
    local inputText = iup.GetText(textInput)  -- Obtém o texto inserido
    local shift = tonumber(iup.GetText(shiftInput))  -- Obtém o valor de deslocamento
    local decryptedText = decrypt(inputText, shift)
    local numericDecrypted = showNumericCode(decryptedText)

    -- Atualiza o campo de saída com o texto descriptografado e código numérico
    iup.SetText(outputText, "Texto descriptografado: " .. decryptedText .. "\nCódigo numérico: " .. numericDecrypted)
end

-- Cria a interface gráfica
textInput = iup.text{size = "200x20", value = "Digite o texto aqui"}  -- Campo para inserir texto
shiftInput = iup.text{size = "50x20", value = "3"}  -- Campo para inserir o deslocamento
outputText = iup.text{size = "400x200", multiline = "YES"}  -- Campo de saída (criptografado/descriptografado)

-- Botões
encryptButton = iup.button{title = "Criptografar", action = encryptCallback}  -- Botão de criptografar
decryptButton = iup.button{title = "Descriptografar", action = decryptCallback}  -- Botão de descriptografar

-- Organiza os elementos da interface gráfica
dlg = iup.dialog{
    iup.vbox{
        iup.label{title = "Texto original:"},
        textInput,
        iup.label{title = "Deslocamento (Shift):"},
        shiftInput,
        encryptButton,
        decryptButton,
        iup.label{title = "Resultado:"},
        outputText
    },
    title = "Criptografador e Descriptografador",
    size = "300x400"
}

-- Exibe a janela
dlg:show()

-- Loop da interface gráfica
if (iup.MainLoopLevel() == 0) then
    iup.MainLoop()
end