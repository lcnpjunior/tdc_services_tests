Dado("contato enviado") do
    @response = ContatoApi.new.post_contact(Helpers.new.criar_dados_contato)
end
  
Quando("atualizo um contato") do
    @dados_anteriores = @response['data']
    @response = ContatoApi.new.update_contact(@dados_anteriores['id'], Helpers.new.criar_dados_contato)
end

Então("contato é atualizado com sucesso") do
    raise "ERRO: Nome não foi atualizado!\nAtual: #{@response['data']['nome']}\nAnterior: #{@dados_anteriores['nome']}" if @response['data']['nome'] == @dados_anteriores['nome']
    raise "ERRO: ID não deve ser atualizado!" if @response['data']['id'] != @dados_anteriores['id']

    puts "Anterior:\n#{@dados_anteriores}\n"
    puts "Atualizado:\n#{@response['data']}"

end

Quando("deleto o contato") do
    @id_deletado = @response['data']['id']
    @response = ContatoApi.new.delete_contact(@id_deletado)
end

Então("contato é deletado com sucesso") do
    @response = ContatoApi.new.get_contact(@id_deletado)
    expect(@response['status']).to eq "ERRO"
    expect(@response['message']).to eq "Erro ao obter contato! Contato não encontrado!"
end

Então("contato é cadastro com sucesso") do
    Helpers.new.validate_response_body(@response)
end

Quando("obter todos os contatos") do
    @response = ContatoApi.new.get_all_contacts
end

Então("os contatos são obtidos com sucesso") do
    expect(@response['data'].kind_of?(Array)).to eq true
    expect(@response['data'].any?).to eq true
end

Quando("obter o contato pelo indice aleatorio") do
    total_contatos = @response['data'].size
    aleatorio = rand(0..total_contatos)
    indice = @response['data'][aleatorio]['id']
    @response = ContatoApi.new.get_contact(indice)
end

Então("mensagem {string}, status {string} e código {int} é obtido") do |mensagem, status, codigo|
    expect(@response.code).to eq codigo
    expect(@response['status']).to eq status
    expect(@response['message']).to eq mensagem

    puts "STATUS: #{@response['status']}"
    puts "MENSAGEM: #{@response['message']}"
    puts "CÓDIGO DA RESPOSTA: #{@response.code}"
end

Então("contato é obtido com sucesso") do
    Helpers.new.validate_response_body(@response)
end