gg.toast("Iniciando script de busca...")

-- Escolher o tipo de valor
valor_tipo = gg.choice({"FLOAT", "DWORD", "ANONYMOUS"}, nil, "Escolha o tipo de valor para busca:")
tipos = {gg.TYPE_FLOAT, gg.TYPE_DWORD, gg.REGION_ANONYMOUS}
tipo_escolhido = tipos[valor_tipo]

if not tipo_escolhido then gg.alert("Nenhum tipo de valor foi selecionado. Saindo...") os.exit() end

-- Escolher a quantidade de etapas
etapas = gg.prompt({"Quantas etapas deseja?"}, {3}, {"number"})

if not etapas or not etapas[1] then gg.alert("Nenhuma etapa definida. Saindo...") os.exit() end

total_etapas = tonumber(etapas[1])

-- Buscar um valor inicial
valor_inicial = gg.prompt({"Digite o valor inicial para buscar:"}, {0}, {"number"})
if not valor_inicial or not valor_inicial[1] then gg.alert("Nenhum valor inicial definido. Saindo...") os.exit() end

valor_inicial = tonumber(valor_inicial[1])

gg.searchNumber(valor_inicial, tipo_escolhido)
gg.toast("Busca inicial concluída!")

-- Função para salvar os resultados em um arquivo txt
function salvar_resultados()
    local arquivo = io.open("/sdcard/gg_resultados.txt", "a") -- Abrir arquivo em modo de append
    if arquivo then
        local resultados = gg.getResults(100)  -- Limitar a 100 resultados
        for i, resultado in ipairs(resultados) do
            arquivo:write("Endereço: " .. string.format("0x%X", resultado.address) .. " - Valor: " .. resultado.value .. "\n")
        end
        arquivo:close()
        gg.toast("Resultados salvos com sucesso!")
    else
        gg.alert("Erro ao salvar os resultados.")
    end
end

-- Iniciar processo de refinamento
for i = 1, total_etapas do
    escolha = gg.choice({"Inalterado", "Mudou", "Aumentou", "Diminuiu"}, nil, "Etapa " .. i .. " - Escolha a filtragem:")

    if escolha == 1 then
        gg.refineNumber(valor_inicial, tipo_escolhido)
    elseif escolha == 2 then
        novo_valor = gg.prompt({"Digite o novo valor:"}, {0}, {"number"})
        if novo_valor and novo_valor[1] then
            gg.refineNumber(novo_valor[1], tipo_escolhido)
        end
    elseif escolha == 3 then
        gg.refineNumber(">" .. valor_inicial, tipo_escolhido)
    elseif escolha == 4 then
        gg.refineNumber("<" .. valor_inicial, tipo_escolhido)
    else
        gg.alert("Nenhuma opção válida escolhida. Saindo...")
        os.exit()
    end

    gg.toast("Refinamento etapa " .. i .. " concluído!")

    -- Salvar resultados após cada etapa
    salvar_resultados()
end

gg.toast("Busca finalizada!")