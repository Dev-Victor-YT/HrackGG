gg.setRanges(gg.REGION_ANONYMOUS) -- Define a região de memória a ser escaneada  
gg.searchNumber("0~999999999", gg.TYPE_DWORD) -- Pesquisa por valores inteiros (DWORD)  
local results = gg.getResults(1000) -- Obtém os primeiros 1000 resultados encontrados  

if #results == 0 then
    gg.toast("Nenhum valor encontrado!")  
else
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
end