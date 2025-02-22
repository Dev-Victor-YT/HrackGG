local scriptPath = "/storage/emulated/0/Download/DecryptScript.lua"  
local logPath = "/storage/emulated/0/DecryptScript.txt"

-- Função para executar o script principal
function executeScript()
    local file = io.open(scriptPath, "r")
    if not file then
        gg.alert("Erro ao abrir o arquivo de script!")
        return
    end

    local content = file:read("*all")
    file:close()

    saveScript(content)

    -- Carrega o script com proteção de erro
    local func, err = load(content)
    if not func then
        gg.alert("Erro ao carregar o script: " .. err)
        return
    end

    -- Inicia o monitoramento em segundo plano
    gg.toast("Executando script e iniciando monitoramento...")
    gg.sleep(2000)
    gg.alert("Monitoramento ativado!")

    -- Executa o script normalmente
    pcall(func)

    -- Inicia o monitoramento dos valores
    monitorExecution()
end

-- Função para salvar o script no log
function saveScript(content)
    local file = io.open(logPath, "w")
    if not file then
        gg.alert("Erro ao salvar o log do script!")
        return
    end
    file:write("Conteúdo do script:\n" .. content .. "\n")
    file:close()
end

-- Função para monitorar em tempo real as execuções
function monitorExecution()
    local file = io.open(logPath, "a")
    if not file then
        gg.alert("Erro ao salvar o log de execução!")
        return
    end

    file:write("\n--- Início da execução ---\n")

    local monitorTime = os.time() + 120  -- Monitora por 2 minutos (ajustável)
    while os.time() < monitorTime do
        local results = gg.getResults(50)  -- Captura até 50 valores por vez
        if results and #results > 0 then
            file:write(string.format("\n--- %s ---\n", os.date("%H:%M:%S")))
            for _, v in ipairs(results) do
                file:write(string.format("Endereço: 0x%X, Tipo: %s, Valor: %s\n", v.address, v.flags, v.value))
            end
        end
        gg.sleep(500)  -- Captura a cada 0,5 segundos para melhor precisão
    end

    file:write("\n--- Fim da execução ---\n")
    file:close()
    gg.toast("Monitoramento finalizado.")
end

executeScript()