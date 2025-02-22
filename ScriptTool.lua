-- Função para criar o menu flutuante
function showFloatMenu()
    -- Definindo os itens que aparecerão no menu
    local items = {
        { text = "Opção 1", action = function() gg.toast("Você selecionou a Opção 1") end },
        { text = "Opção 2", action = function() gg.toast("Você selecionou a Opção 2") end },
        { text = "Opção 3", action = function() gg.toast("Você selecionou a Opção 3") end },
        { text = "Fechar Menu", action = function() closeFloatMenu() end }
    }

    -- Criação do menu flutuante
    local menu = gg.choice(items, nil, "Escolha uma opção:")

    -- Se o usuário selecionar alguma opção, executa a ação
    if menu then
        items[menu].action()
    end
end

-- Função para fechar o menu flutuante
function closeFloatMenu()
    gg.alert("Fechando o menu flutuante.")
    -- O menu será fechado e o script vai parar de rodar
end

-- Iniciar o menu flutuante
showFloatMenu()