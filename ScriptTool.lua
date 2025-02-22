-- Verifica se o dispositivo está com root
local rootCheck = io.popen("which su")
local root = rootCheck:read("*l")
rootCheck:close()

if not root then
    gg.alert("Erro: O dispositivo precisa ser rootado para executar esse script!")
    os.exit()
end

-- Define a variável do pacote que queremos modificar
local packageName = gg.prompt({"Digite o nome do pacote do jogo/aplicativo:"}, {""}, {"text"})

if not packageName or packageName[1] == "" then
    gg.alert("Erro: Nenhum nome de pacote inserido!")
    os.exit()
end

-- Usando comando root para procurar o PID do processo
local pidCommand = "ps | grep " .. packageName[1]
local pid = io.popen(pidCommand):read("*l")

if not pid then
    gg.alert("Erro: O pacote '" .. packageName[1] .. "' não está rodando!")
    os.exit()
end

-- Exibe o PID encontrado
gg.alert("Processo encontrado! PID: " .. pid)

-- Comando para localizar o valor na memória
local searchCommand = "cat /proc/" .. pid .. "/maps"
local mapsData = io.popen(searchCommand):read("*all")

-- Aqui você poderia buscar por áreas de memória específicas e valores
-- Por exemplo, modificar valores em regiões específicas da memória do processo
local modifyCommand = "echo 'NovoValor' > /proc/" .. pid .. "/mem"

-- Exemplo de como enviar um comando para modificar a memória (supondo que o valor tenha sido encontrado)
os.execute(modifyCommand)

gg.alert("Valor modificado com sucesso!")