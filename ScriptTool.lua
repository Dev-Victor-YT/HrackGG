-- Importa classes Java necessárias
local AlertDialog = luajava.bindClass("android.app.AlertDialog")
local EditText = luajava.bindClass("android.widget.EditText")
local LinearLayout = luajava.bindClass("android.widget.LinearLayout")
local Context = luajava.bindClass("android.content.Context")
local DialogInterface = luajava.bindClass("android.content.DialogInterface")
local Toast = luajava.bindClass("android.widget.Toast")

-- Obtém o contexto do GG
local ggContext = gg.getTargetInfo().context

-- Cria um campo de entrada para o "código Java"
local input = luajava.new(EditText, ggContext)
input:setHint("Digite um comando Java (ex: AlertDialog)")

-- Cria um layout para o diálogo
local layout = luajava.new(LinearLayout, ggContext)
layout:setOrientation(1)
layout:addView(input)

-- Função que simula a execução de código Java no GG
function executarSimulacao(codigo)
    if codigo:find("AlertDialog") then
        local builder = luajava.new(AlertDialog.Builder, ggContext)
        builder:setTitle("Simulação de Java")
        builder:setMessage("Este é um AlertDialog criado a partir do seu código.")
        builder:setPositiveButton("OK", nil)
        builder:create():show()
    elseif codigo:find("Toast") then
        Toast.makeText(ggContext, "Simulação de Toast!", Toast.LENGTH_LONG):show()
    else
        Toast.makeText(ggContext, "Código não reconhecido!", Toast.LENGTH_LONG):show()
    end
end

-- Cria o diálogo de entrada
local builder = luajava.new(AlertDialog.Builder, ggContext)
builder:setTitle("Executar Código Java")
builder:setView(layout)

-- Botão "Executar"
builder:setPositiveButton("Executar", luajava.createProxy(DialogInterface.OnClickListener, {
    onClick = function(dialog, which)
        local codigo = input:getText():toString()
        executarSimulacao(codigo)
    end
}))

-- Botão "Cancelar"
builder:setNegativeButton("Cancelar", nil)

-- Exibe o diálogo
local dialog = builder:create()
dialog:show()