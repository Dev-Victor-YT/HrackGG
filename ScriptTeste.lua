gg.setRanges(gg.REGION_ANONYMOUS) -- Define a região da memória a ser escaneada  
local results = gg.getResults(1000) -- Obtém os primeiros 1000 valores encontrados  
local file = io.open("/storage/emulated/0/Download/memory_dump.txt", "w") -- Abre um arquivo para salvar o dump  

if file then
    for i, v in ipairs(results) do
        file:write(string.format("Endereço: %X | Valor: %s\n", v.address, v.value))
    end
    file:close()
    gg.toast("Dump de memória salvo em Download/memory_dump.txt")  
else
    gg.toast("Erro ao salvar o arquivo!")  
end