% Base de Conhecimento
livro(fundacao, ficcao_cientifica, asimov, 1951).
livro(duna, ficcao_cientifica, herbert, 1965).
livro(o_hobbit, fantasia, tolkien, 1937).
livro(o_senhor_dos_aneis, fantasia, tolkien, 1954).
livro(perdido_em_berlim, romance, rosa, 1997).
livro(a_caverna, romance, saramago, 2000).
livro(fahrenheit_451, ficcao_cientifica, bradbury, 1953).
livro(1984, ficcao_cientifica, orwell, 1949).
livro(as_cronicas_de_narnia, fantasia, lewis, 1950).
livro(um_estudo_em_escarlate, romance, doyle, 1887).
livro(o_tempo_das_morangas, literatura_infantojuvenil, pinto, 2005).
livro(a_livraria_misteriosa, literatura_infantojuvenil, baughman, 2012).
livro(a_machina_do_tempo, ficcao_cientifica, wells, 1895).
livro(o_experimento, suspense, koontz, 1998).
livro(a_onda, ficcao_cientifica, strasser, 1981).

% Regras de recomendação para um gênero específico
recomendar(Genero) :-
    findall(Livro, livro(Livro, Genero, _, _), Livros),
    exibir(Livros).

% Regras de recomendação para um autor específico
recomendar_autor(Autor) :-
    findall(Livro, livro(Livro, _, Autor, _), Livros),
    exibir(Livros).

% Regras de recomendação para gênero e autor
recomendar(Genero, Autor) :-
    findall(Livro, livro(Livro, Genero, Autor, _), Livros),
    exibir(Livros).

% Regras de recomendação para gênero, autor e ano
recomendar(Genero, Autor, Ano) :-
    findall(Livro, (livro(Livro, Genero, Autor, Ano), Ano > 1950), Livros),
    exibir(Livros).

% Exibe os livros encontrados
exibir([]).  
exibir([Livro|Restante]) :-
    write(Livro), nl,
    exibir(Restante).  