-- Solicita o nome do pacote
local packageName = "com.dts.freefireth"  -- Nome do pacote do app/jogo
local address = "0x000000"  -- Endereço de memória onde o valor será modificado
local newValue = 0  -- Novo valor a ser definido no endereço

-- Tenta identificar o pacote em execução
local targetProcess = gg.getTargetInfo()
if not targetProcess or targetProcess.packageName ~= packageName then
    gg.alert("Erro: O pacote '" .. packageName .. "' não está rodando!")
    os.exit()
end

-- Define o processo alvo para o GameGuardian
gg.setTargetPackage(packageName)

-- Acessa diretamente o endereço de memória
local results = gg.getResults(1)
if #results == 0 then
    gg.alert("Erro: Endereço de memória '" .. address .. "' não encontrado!")
    os.exit()
end

-- Modifica o valor no endereço específico
results[1].value = newValue
gg.setValues(results)

-- Mensagem de confirmação
gg.alert("Valor modificado com sucesso no endereço: " .. address)