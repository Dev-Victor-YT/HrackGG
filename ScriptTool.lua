-- Solicita o nome do pacote ao usuário
local packageName = gg.prompt({"Digite o nome do pacote do jogo/aplicativo:"}, {""}, {"text"})

-- Se o usuário não digitou nada, aborta
if not packageName or packageName[1] == "" then
    gg.alert("Erro: Nenhum nome de pacote inserido!")
    os.exit()
end

-- Tenta encontrar o processo do pacote
local processFound = false
local processes = gg.getTargets()

for _, process in ipairs(processes) do
    if process.pkgName == packageName[1] then
        gg.setTargetPackage(packageName[1])
        processFound = true
        break
    end
end

if not processFound then
    gg.alert("Erro: Pacote não encontrado! Abra o jogo/app primeiro.")
    os.exit()
end

-- Solicita o valor a ser pesquisado
local values = gg.prompt({"Digite o valor a ser pesquisado:"}, {""}, {"number"})

if not values or values[1] == "" then
    gg.alert("Erro: Nenhum valor inserido!")
    os.exit()
end

local searchValue = tonumber(values[1])
if not searchValue then
    gg.alert("Erro: Valor inválido!")
    os.exit()
end

-- Pesquisa o valor na memória
gg.searchNumber(searchValue, gg.TYPE_DWORD)

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

gg.alert("Valor modificado com sucesso!\nDe: " .. searchValue .. "\nPara: " .. newValue)