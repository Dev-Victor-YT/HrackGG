-- Importa classes Java necessárias
local AlertDialog = luajava.bindClass("android.app.AlertDialog")
local EditText = luajava.bindClass("android.widget.EditText")
local LinearLayout = luajava.bindClass("android.widget.LinearLayout")
local Context = luajava.bindClass("android.content.Context")
local DialogInterface = luajava.bindClass("android.content.DialogInterface")
local Toast = luajava.bindClass("android.widget.Toast")

-- Obtém o contexto do GG
local ggContext = gg.getTargetInfo().context

-- Cria um campo de entrada para o código Java
local input = luajava.new(EditText, ggContext)
input:setHint("Digite seu código Java aqui...")

-- Cria um layout para o diálogo
local layout = luajava.new(LinearLayout, ggContext)
layout:setOrientation(1)
layout:addView(input)

-- Função para executar o código Java
function executarCodigo(codigo)
    local resultado, erro = pcall(loadstring(codigo))
    if resultado then
        Toast.makeText(ggContext, "Código executado com sucesso!", Toast.LENGTH_LONG):show()
    else
        Toast.makeText(ggContext, "Erro: " .. tostring(erro), Toast.LENGTH_LONG):show()
    end
end

-- Cria o diálogo
local builder = luajava.new(AlertDialog.Builder, ggContext)
builder:setTitle("Executar Código Java")
builder:setView(layout)

-- Botão "Executar"
builder:setPositiveButton("Executar", luajava.createProxy(DialogInterface.OnClickListener, {
    onClick = function(dialog, which)
        local codigo = input:getText():toString()
        executarCodigo(codigo)
    end
}))

-- Botão "Cancelar"
builder:setNegativeButton("Cancelar", nil)

-- Exibe o diálogo
local dialog = builder:create()
dialog:show()