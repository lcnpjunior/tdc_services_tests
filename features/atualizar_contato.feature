# language: pt
Funcionalidade: Atualizar Contato

    @atualizar
    Cenário: Atualizar contato
        Dado contato enviado
        Quando atualizo um contato
        Então mensagem "Contato Atualizado", status "SUCESSO" e código 200 é obtido
        E contato é atualizado com sucesso