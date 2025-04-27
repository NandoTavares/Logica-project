
% Base de Conhecimento
livro(fundacao, ficcao_cientifica, asimov, 1951, 255).
livro(duna, ficcao_cientifica, herbert, 1965, 412).
livro(o_hobbit, fantasia, tolkien, 1937, 310).
livro(o_senhor_dos_aneis, fantasia, tolkien, 1954, 1178).
livro(perdido_em_berlim, romance, rosa, 1997, 240).
livro(a_caverna, romance, saramago, 2000, 336).
livro(fahrenheit_451, ficcao_cientifica, bradbury, 1953, 158).
livro(1984, ficcao_cientifica, orwell, 1949, 328).
livro(as_cronicas_de_narnia, fantasia, lewis, 1950, 204).
livro(um_estudo_em_escarlate, romance, doyle, 1887, 77).
livro(o_tempo_das_morangas, literatura_infantojuvenil, pinto, 2005, 96).
livro(a_livraria_misteriosa, literatura_infantojuvenil, baughman, 2012, 128).
livro(a_machina_do_tempo, ficcao_cientifica, wells, 1895, 84).
livro(o_experimento, suspense, koontz, 1998, 302).
livro(a_onda, ficcao_cientifica, strasser, 1981, 184).
livro(autobiografia_de_malcolm_x, biografia, alexander, 1965, 466).
livro(guerra_e_paz, ficcao_historica, tolstoy, 1869, 1225).
livro(os_sonetos_de_shakespeare, poesia, shakespeare, 1609, 154).
livro(morte_em_veneza, drama, mann, 1912, 256).
livro(o_codigo_da_vinci, misterio, brown, 2003, 454).
livro(como_fazer_amigos_e_influenciar_pessoas, auto_ajuda, carnegie, 1936, 291).
livro(maus, graphic_novel, spiegelman, 1991, 296).
livro(on_the_road, viagem, kerouac, 1957, 307).
livro(alem_do_bem_e_do_mal, filosofia, nietzsche, 1886, 240).


% Predicado para exibir lista de resultados
exibir([]) :- writeln('').
exibir([L|R]) :-
    writeln(L),
    exibir(R).

% Buscas existentes 
buscar_por_categoria(Cat) :-
    findall(Titulo, livro(Titulo, Cat, _, _, _), LS),
    exibir(LS).

buscar_por_autor(Autor) :-
    findall(Titulo, livro(Titulo, _, Autor, _, _), LS),
    exibir(LS).

buscar_por_ano(AnoMin) :-
    findall(Titulo, (livro(Titulo, _, _, Ano, _), Ano >= AnoMin), LS),
    exibir(LS).

buscar_por_categoria_e_ano(Cat, AnoMin) :-
    findall(Titulo, (livro(Titulo, Cat, _, Ano, _), Ano >= AnoMin), LS),
    exibir(LS).

buscar_por_autor_e_categoria(Autor, Cat) :-
    findall(Titulo, livro(Titulo, Cat, Autor, _, _), LS),
    exibir(LS).

buscar_por_autor_e_ano(Autor, AnoMin) :-
    findall(Titulo, (livro(Titulo, _, Autor, Ano, _), Ano >= AnoMin), LS),
    exibir(LS).

% Nova busca: por número de páginas no intervalo [Min, Max]
buscar_por_paginas(PagMin, PagMax) :-
    findall(Titulo, (livro(Titulo, _, _, _, P), P >= PagMin, P =< PagMax), LS),
    exibir(LS).

% Menu de opções 
menu :-
    writeln('----- MENU DE BUSCA -----'),
    writeln('1. Buscar por Categoria'),
    writeln('2. Buscar por Autor'),
    writeln('3. Buscar por Ano'),
    writeln('4. Buscar por Categoria e Ano'),
    writeln('5. Buscar por Autor e Categoria'),
    writeln('6. Buscar por Autor e Ano'),
    writeln('7. Buscar por Paginas'),
    writeln('0. Sair'),
    writeln('Escolha uma opcao: '),
    read(Opcao),
    executar_opcao(Opcao).

executar_opcao(1) :-
    writeln('Digite a categoria: '),
    read(Cat),
    buscar_por_categoria(Cat), menu.

executar_opcao(2) :-
    writeln('Digite o autor: '),
    read(Autor),
    buscar_por_autor(Autor), menu.

executar_opcao(3) :-
    writeln('Digite o ano minimo: '),
    read(AnoMin),
    buscar_por_ano(AnoMin), menu.

executar_opcao(4) :-
    writeln('Digite a categoria: '),
    read(Cat),
    writeln('Digite o ano minimo: '),
    read(AnoMin),
    buscar_por_categoria_e_ano(Cat, AnoMin), menu.

executar_opcao(5) :-
    writeln('Digite o autor: '),
    read(Autor),
    writeln('Digite a categoria: '),
    read(Cat),
    buscar_por_autor_e_categoria(Autor, Cat), menu.

executar_opcao(6) :-
    writeln('Digite o autor: '),
    read(Autor),
    writeln('Digite o ano minimo: '),
    read(AnoMin),
    buscar_por_autor_e_ano(Autor, AnoMin), menu.

executar_opcao(7) :-
    writeln('Digite o numero minimo de paginas: '),
    read(PagMin),
    writeln('Digite o numero maximo de paginas: '),
    read(PagMax),
    buscar_por_paginas(PagMin, PagMax), menu.

executar_opcao(0) :-
    writeln('Saindo... Até logo!').

executar_opcao(_) :-
    writeln('Opção inválida. Tente novamente.'), menu.

:- initialization(menu).
