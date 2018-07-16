# language: pt

Funcionalidade: Obter Contato

    @obter_todos_contatos
    Cenário: Obter todos os contatos
        Quando obter todos os contatos
        Então mensagem "Contatos obtidos", status "SUCESSO" e código 200 é obtido
        E os contatos são obtidos com sucesso

    @obter_contato
    Cenário: Obter contato por indice
        Dado obter todos os contatos
        Quando obter o contato pelo indice aleatorio
        Então mensagem "Contato obtido", status "SUCESSO" e código 200 é obtido
        E contato é obtido com sucesso