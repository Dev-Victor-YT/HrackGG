-- Caminho pré-definido do arquivo de script local scriptPath = "/storage/emulated/0/Download/DecryptScript.lua"  -- Modifique para o caminho correto do seu script local logPath = "/storage/emulated/0/DecryptScript.txr"

-- Função para executar a script function executeScript() local file = io.open(scriptPath, "r") if not file then gg.alert("Erro ao abrir o arquivo de script!") return end

local content = file:read("*all")
file:close()

-- Salvar o conteúdo da script no arquivo de log
saveScript(content)

-- Executa a script carregada no GameGuardian
load(content)()

-- Inicia o monitoramento das execuções
monitorExecution()

end

-- Função para salvar o script executado em um arquivo TXT function saveScript(content) local file = io.open(logPath, "w") if not file then gg.alert("Erro ao salvar o arquivo DecryptScript.txt") return end file:write("Conteúdo do script: ") file:write(content) file:close() end

-- Função para monitorar a execução do script e salvar continuamente as ações function monitorExecution() local file = io.open(logPath, "a") if not file then gg.alert("Erro ao salvar as ações do script!") return end

file:write("\n--- Início da execução ---\n")

while true do
    local results = gg.getResults(100)
    if results and #results > 0 then
        for i, v in ipairs(results) do
            file:write(string.format("Endereço: 0x%X, Valor: %s\n", v.address, v.value))
        end
    end
    gg.sleep(1000)  -- Aguarda 1 segundo antes de verificar novamente
end

file:write("\n--- Fim da execução ---\n")
file:close()

end

-- Inicia o processo automaticamente sem interação do usuário executeScript()

