-- Importa classes Java necessárias
local WindowManager = luajava.bindClass("android.view.WindowManager")
local LayoutParams = luajava.bindClass("android.view.WindowManager$LayoutParams")
local Gravity = luajava.bindClass("android.view.Gravity")
local Color = luajava.bindClass("android.graphics.Color")
local Context = luajava.bindClass("android.content.Context")
local View = luajava.bindClass("android.view.View")
local LinearLayout = luajava.bindClass("android.widget.LinearLayout")

-- Obtém o contexto da UI
local ggContext = gg.getTargetInfo().context

-- Cria um layout quadrado
local squareView = luajava.new(LinearLayout, ggContext)
squareView:setBackgroundColor(Color.RED)  -- Cor vermelha
squareView:setLayoutParams(luajava.new(LinearLayout.LayoutParams, 200, 200)) -- Tamanho 200x200

-- Obtém o gerenciador de janelas
local wm = ggContext:getSystemService(Context.WINDOW_SERVICE)

-- Define as propriedades da janela flutuante
local params = luajava.new(LayoutParams)
params.width = 200  -- Largura
params.height = 200  -- Altura
params.type = LayoutParams.TYPE_APPLICATION_OVERLAY -- Tipo de overlay (Android 8+)
params.flags = LayoutParams.FLAG_NOT_FOCUSABLE -- Não foca a tela
params.gravity = Gravity.TOP | Gravity.LEFT -- Posição inicial
params.x = 100 -- Posição X na tela
params.y = 200 -- Posição Y na tela

-- Adiciona a view ao gerenciador de janelas
wm:addView(squareView, params)

gg.alert("Janela flutuante criada!")