local scriptPath = "/storage/emulated/0/Download/DecryptScript.lua"
local logPath = "/storage/emulated/0/Download/cript_valor.txt"

-- Função para salvar os endereços e valores no arquivo
function saveCapturedData(data)
    local file, err = io.open(logPath, "a")  -- Abre o arquivo para adicionar as informações
    if not file then
        print("Erro ao salvar os dados: " .. err)  -- Exibe erro no print se falhar
        return
    end
    file:write(data .. "\n")
    file:close()
end

-- Função para executar o script e capturar os endereços e valores alterados
function executeScriptAndCapture()
    -- Carregar e executar a script
    local file = io.open(scriptPath, "r")
    if not file then
        print("Erro ao abrir o arquivo de script!")  -- Exibe erro no print se falhar
        return
    end

    local content = file:read("*all")
    file:close()

    -- Executa a script carregada no GameGuardian
    load(content)()

    -- Iniciar o monitoramento da execução da script
    monitorExecution()
end

-- Função para monitorar a execução da script e capturar os endereços e valores
function monitorExecution()
    -- Exemplo de uma captura simples a cada 1 segundo
    print("Monitorando a execução da script...")

    while true do
        -- Captura até 100 resultados da memória
        local results = gg.getResults(100)
        
        if results and #results > 0 then
            for i, v in ipairs(results) do
                -- Salva o endereço e o valor no arquivo
                local data = string.format("Endereço: 0x%X, Valor: %s", v.address, v.value)
                saveCapturedData(data)
                print(data)  -- Exibe no console os endereços e valores capturados
            end
        end

        gg.sleep(1000)  -- Aguarda 1 segundo antes de verificar novamente
    end
end

-- Inicia o processo de execução e captura
print("Iniciando a execução do script e monitoramento...")
executeScriptAndCapture()