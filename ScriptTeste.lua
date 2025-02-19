-- Caminho para a pasta de cache do Free Fire no dispositivo rootado
local path = "/data/data/com.dts.freefireth/cache/"

-- Comando para listar arquivos de cache com permissões de root
local command = "ls " .. path

-- Executando o comando com root usando 'su'
local handle = io.popen("su -c '" .. command .. "'")
local result = handle:read("*a")
handle:close()

-- Exibindo os arquivos encontrados no diretório de cache
if result ~= "" then
    print("Arquivos na pasta de cache do Free Fire: \n" .. result)
else
    print("Erro ao acessar a pasta ou não há arquivos.")
end