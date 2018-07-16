# language: pt
Funcionalidade: Deletar Contato TDC

    @deletar
    Cenário: Deletar contato
        Dado contato enviado
        Então mensagem "Contato Salvo", status "SUCESSO" e código 200 é obtido
        Quando deleto o contato
        Então mensagem "Contato Deletado", status "SUCESSO" e código 200 é obtido
        E contato é deletado com sucesso