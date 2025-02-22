-- Requer que o Game Guardian esteja executando
-- Script para exibir e salvar os endereços e valores no Game Guardian com opções de copiar ou salvar em um arquivo

-- Função para pesquisar todos os valores
function buscarValores()
    gg.searchNumber("0", gg.TYPE_DWORD)  -- Pesquisa por valores do tipo DWORD (pode modificar conforme necessário)
    gg.getResults(gg.getResultsCount())  -- Pega todos os resultados encontrados
end

-- Função para mostrar os endereços e valores
function mostrarValores()
    local resultados = gg.getResults(gg.getResultsCount())  -- Pega todos os resultados encontrados
    local infoEnderecos = {}  -- Tabela para armazenar os endereços e valores

    -- Para cada resultado encontrado, pega o endereço e o valor e armazena na tabela
    for i, v in ipairs(resultados) do
        table.insert(infoEnderecos, {endereco = v.address, valor = v.value})  -- Armazena o endereço e valor
    end

    -- Cria uma string para exibir os resultados (endereços e valores)
    local resultadoTexto = ""
    for i, v in ipairs(infoEnderecos) do
        resultadoTexto = resultadoTexto .. string.format("Endereço: 0x%X | Valor: %s\n", v.endereco, v.valor)
    end

    -- Exibe os resultados na tela
    gg.alert("Endereços e valores encontrados:\n" .. resultadoTexto)

    -- Opção para copiar o texto
    local copyText = iup.button{title = "Copiar Lista", action = function()
        -- Copia o texto para a área de transferência (simulando um "copiar")
        gg.copyText(resultadoTexto)
        gg.alert("Lista copiada para a área de transferência!")
    end}

    -- Opção para salvar os resultados em um arquivo
    local saveButton = iup.button{title = "Salvar em Arquivo", action = function()
        local nomeArquivo = iup.text{value = "GameGuardian_resultados.txt"}  -- Nome do arquivo com valor padrão
        local dlgInput = iup.dialog{
            iup.vbox{
                iup.label{title = "Digite o nome do arquivo:"},
                nomeArquivo,
                iup.button{title = "Salvar", action = function()
                    salvarResultados(infoEnderecos, nomeArquivo.value)  -- Chama a função de salvar
                    dlgInput:hide()  -- Fecha a caixa de entrada após salvar
                end},
                iup.button{title = "Cancelar", action = function() dlgInput:hide() end},
            },
            title = "Salvar Resultados",
        }
        dlgInput:show()  -- Exibe a caixa de entrada
    end}

    -- Exibe o botão de copiar e salvar em uma caixa de diálogo
    local dlgOpcoes = iup.dialog{
        iup.vbox{
            iup.label{title = "Escolha uma ação:"},
            copyText,
            saveButton,
        },
        title = "Opções",
        size = "200x150",
    }

    dlgOpcoes:show()  -- Exibe as opções
end

-- Função para salvar os resultados em um arquivo
function salvarResultados(infoEnderecos, nomeArquivo)
    -- Salva na pasta Downloads, no caminho padrão de armazenamento
    local caminhoArquivo = "/sdcard/Download/" .. nomeArquivo  -- Caminho para salvar na pasta Downloads
    local arquivo = io.open(caminhoArquivo, "w")  -- Abre o arquivo no caminho especificado
    if arquivo then
        for i, v in ipairs(infoEnderecos) do
            arquivo:write(string.format("Endereço: 0x%X | Valor: %s\n", v.endereco, v.valor))  -- Salva cada endereço e valor no arquivo
        end
        arquivo:close()  -- Fecha o arquivo após salvar
        gg.alert("Resultados salvos com sucesso no arquivo " .. nomeArquivo .. " na pasta Downloads!")
    else
        gg.alert("Falha ao abrir o arquivo para salvar!")
    end
end

-- Função principal que chama as funções de busca e exibição
function main()
    gg.clearResults()  -- Limpa os resultados anteriores
    gg.setVisible(false)  -- Torna o Game Guardian invisível durante a execução do script
    gg.alert("Iniciando a busca de endereços e valores!")  -- Exibe uma mensagem inicial
    buscarValores()  -- Realiza a busca de todos os valores
    mostrarValores()  -- Exibe os endereços e valores encontrados
    gg.alert("Busca concluída!")  -- Exibe uma mensagem de conclusão
end

-- Executa a função principal
main()