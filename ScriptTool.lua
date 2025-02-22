-- Importa classes Java necessárias
local AlertDialog = luajava.bindClass("android.app.AlertDialog")
local DialogInterface = luajava.bindClass("android.content.DialogInterface")
local Context = luajava.bindClass("android.content.Context")

-- Obtém o contexto da UI
local ggContext = gg.getTargetInfo().context

-- Cria o diálogo
local builder = luajava.new(AlertDialog.Builder, ggContext)
builder:setTitle("Olá")

-- Botão "OK"
builder:setPositiveButton("OK", luajava.createProxy(DialogInterface.OnClickListener, {
    onClick = function(dialog, which)
        gg.alert("Você clicou em OK!")
    end
}))

-- Botão "2"
builder:setNegativeButton("2", luajava.createProxy(DialogInterface.OnClickListener, {
    onClick = function(dialog, which)
        gg.alert("Você clicou em 2!")
    end
}))

-- Botão "4"
builder:setNeutralButton("4", luajava.createProxy(DialogInterface.OnClickListener, {
    onClick = function(dialog, which)
        gg.alert("Você clicou em 4!")
    end
}))

-- Exibe o diálogo
local dialog = builder:create()
dialog:show()