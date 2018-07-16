# language: pt
Funcionalidade: Enviar Contato

    @enviar
    Cenário: Enviar contato
        Quando contato enviado
        Então mensagem "Contato Salvo", status "SUCESSO" e código 200 é obtido
        E contato é cadastro com sucesso
