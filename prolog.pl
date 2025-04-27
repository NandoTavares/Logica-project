
livro(fundacao,             ficcao_cientifica, asimov,   1951).
livro(duna,                 ficcao_cientifica, herbert,  1965).
livro(o_hobbit,             fantasia,          tolkien,  1937).
livro(o_senhor_dos_aneis,   fantasia,          tolkien,  1954).
livro(perdido_em_berlim,    romance,           rosa,     1997).
livro(a_caverna,            romance,           saramago, 2000).
livro(fahrenheit_451,       ficcao_cientifica, bradbury, 1953).
livro(1984,                 ficcao_cientifica, orwell,   1949).
livro(as_cronicas_de_narnia,fantasia,          lewis,    1950).
livro(um_estudo_em_escarlate,romance,          doyle,    1887).
livro(o_tempo_das_morangas, literatura_infantojuvenil, pinto,    2005).
livro(a_livraria_misteriosa,literatura_infantojuvenil, baughman, 2012).
livro(a_machina_do_tempo,   ficcao_cientifica, wells,    1895).
livro(o_experimento,        suspense,          koontz,   1998).
livro(a_onda,               ficcao_cientifica, strasser, 1981).


exibir([]) :- writeln('').

exibir([L|R]) :-
    writeln(L),
    exibir(R).


buscar_por_categoria(Categoria) :-
    findall(L, livro(L, Categoria, _, _), LS),
    exibir(LS).

buscar_por_autor(Autor) :-
    findall(L, livro(L, _, Autor, _), LS),
    exibir(LS).

buscar_por_ano(AnoMin) :-
    findall(L, (livro(L, _, _, Ano), Ano >= AnoMin), LS),
    exibir(LS).

buscar_por_categoria_e_ano(Categoria, AnoMin) :-
    findall(L, (livro(L, Categoria, _, Ano), Ano >= AnoMin), LS),
    exibir(LS).

buscar_por_autor_e_categoria(Autor, Categoria) :-
    findall(L, (livro(L, Categoria, Autor, _)), LS),
    exibir(LS).

buscar_por_autor_e_ano(Autor, AnoMin) :-
    findall(L, (livro(L, _, Autor, Ano), Ano >= AnoMin), LS),
    exibir(LS).


menu :-
    writeln('----- MENU DE BUSCA -----'),
    writeln('1. Buscar por Categoria'),
    writeln('2. Buscar por Autor'),
    writeln('3. Buscar por Ano'),
    writeln('4. Buscar por Categoria e Ano'),
    writeln('5. Buscar por Autor e Categoria'),
    writeln('6. Buscar por Autor e Ano'),
    writeln('0. Sair'),
    writeln('Escolha uma opcao: '),
    read(Opcao),
    executar_opcao(Opcao).


executar_opcao(1) :-
    writeln('Digite a categoria: '),
    read(Categoria),
    buscar_por_categoria(Categoria),
    menu.

executar_opcao(2) :-
    writeln('Digite o autor: '),
    read(Autor),
    buscar_por_autor(Autor),
    menu.

executar_opcao(3) :-
    writeln('Digite o ano minimo: '),
    read(AnoMin),
    buscar_por_ano(AnoMin),
    menu.

executar_opcao(4) :-
    writeln('Digite a categoria: '),
    read(Categoria),
    writeln('Digite o ano minimo: '),
    read(AnoMin),
    buscar_por_categoria_e_ano(Categoria, AnoMin),
    menu.

executar_opcao(5) :-
    writeln('Digite o autor: '),
    read(Autor),
    writeln('Digite a categoria: '),
    read(Categoria),
    buscar_por_autor_e_categoria(Autor, Categoria),
    menu.

executar_opcao(6) :-
    writeln('Digite o autor: '),
    read(Autor),
    writeln('Digite o ano minimo: '),
    read(AnoMin),
    buscar_por_autor_e_ano(Autor, AnoMin),
    menu.

executar_opcao(0) :-
    writeln('Saindo... Ate logo!').

executar_opcao(_) :-
    writeln('Opcao invalida. Tente novamente.'),
    menu.


:- initialization(menu).
