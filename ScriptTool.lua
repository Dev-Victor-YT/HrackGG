local scriptPath = "/storage/emulated/0/Download/DecryptScript.lua"
local logPath = "/storage/emulated/0/Download/cript_valor.txt"

-- Função para salvar os endereços e valores alterados no arquivo
function saveCapturedData(data)
    local file, err = io.open(logPath, "a")  -- Abre o arquivo para adicionar as informações
    if not file then
        print("Erro ao salvar os dados: " .. err)  -- Exibe erro no print se falhar
        return
    end
    file:write(data .. "\n")
    file:close()
end

-- Função para executar o script e monitorar alterações na memória
function executeScriptAndMonitorChanges()
    -- Carregar e executar o script
    local file = io.open(scriptPath, "r")
    if not file then
        print("Erro ao abrir o arquivo de script!")  -- Exibe erro no print se falhar
        return
    end

    local content = file:read("*all")
    file:close()

    -- Executa a script carregada no GameGuardian
    load(content)()

    -- Iniciar o monitoramento das alterações nos endereços e valores
    monitorMemoryChanges()
end

-- Função para monitorar alterações na memória enquanto a script é executada
function monitorMemoryChanges()
    -- Definindo um valor inicial para monitorar
    local previousResults = {}
    
    -- Exemplo de monitoramento contínuo das alterações
    print("Monitorando as alterações de valores e endereços na memória...")

    while true do
        -- Captura até 100 resultados da memória (endereços e valores)
        local results = gg.getResults(100)
        
        if results and #results > 0 then
            for i, v in ipairs(results) do
                -- Verifica se o endereço e valor já foram capturados antes
                local found = false
                for _, prev in ipairs(previousResults) do
                    if prev.address == v.address then
                        found = true
                        -- Se o valor foi alterado, salva a alteração
                        if prev.value ~= v.value then
                            local data = string.format("Endereço: 0x%X, Valor Alterado: %s -> %s", v.address, prev.value, v.value)
                            saveCapturedData(data)
                            print(data)  -- Exibe a alteração no console
                        end
                        break
                    end
                end

                -- Se o endereço não foi encontrado, adiciona ele ao histórico
                if not found then
                    table.insert(previousResults, {address = v.address, value = v.value})
                end
            end
        end

        gg.sleep(1000)  -- Aguarda 1 segundo antes de verificar novamente
    end
end

-- Inicia o processo de execução e monitoramento
print("Iniciando a execução do script e monitoramento de alterações...")
executeScriptAndMonitorChanges()