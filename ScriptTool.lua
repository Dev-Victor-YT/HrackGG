-- Solicita o nome do pacote ao usuário
local packageName = gg.prompt({"Digite o nome do pacote do jogo/aplicativo:"}, {""}, {"text"})

-- Se o usuário não digitou nada, aborta
if not packageName or packageName[1] == "" then
    gg.alert("Erro: Nenhum nome de pacote inserido!")
    os.exit()
end

local packageNameInput = packageName[1]

-- Obtém a lista de processos ativos
local processes = gg.getTargets()
local processFound = false

for _, process in ipairs(processes) do
    if process.pkgName == packageNameInput then
        processFound = true
        gg.setTargetPackage(packageNameInput) -- Define o alvo para esse pacote
        break
    end
end

-- Se o pacote não foi encontrado, exibe erro e sai
if not processFound then
    gg.alert("Erro: O pacote '" .. packageNameInput .. "' não está sendo executado!\nAbra o app/jogo primeiro e tente novamente.")
    os.exit()
end

gg.alert("Pacote '" .. packageNameInput .. "' encontrado e selecionado com sucesso!")

-- Solicita o valor a ser pesquisado
local searchValue = gg.prompt({"Digite o valor a ser pesquisado:"}, {""}, {"number"})

if not searchValue or searchValue[1] == "" then
    gg.alert("Erro: Nenhum valor inserido!")
    os.exit()
end

local searchNumber = tonumber(searchValue[1])
if not searchNumber then
    gg.alert("Erro: Valor inválido!")
    os.exit()
end

-- Pesquisa o valor na memória
gg.searchNumber(searchNumber, gg.TYPE_DWORD)

-- Verifica se encontrou resultados
local results = gg.getResults(1)

if #results == 0 then
    gg.alert("Erro: Nenhum valor encontrado!")
    os.exit()
end

-- Solicita o novo valor a ser inserido
local newValueInput = gg.prompt({"Digite o novo valor:"}, {""}, {"number"})

if not newValueInput or newValueInput[1] == "" then
    gg.alert("Erro: Nenhum novo valor inserido!")
    os.exit()
end

local newValue = tonumber(newValueInput[1])
if not newValue then
    gg.alert("Erro: Novo valor inválido!")
    os.exit()
end

-- Modifica o valor na memória
results[1].value = newValue
gg.setValues(results)

gg.alert("Valor modificado com sucesso!\nDe: " .. searchNumber .. "\nPara: " .. newValue)