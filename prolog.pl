livro(fundacao,            ficcao_cientifica, asimov,  1951).
livro(duna,                ficcao_cientifica, herbert, 1965).
livro(o_hobbit,            fantasia,          tolkien, 1937).
livro(o_senhor_dos_aneis,  fantasia,          tolkien, 1954).
livro(perdido_em_berlim,   romance,           rosa,    1997).
livro(a_caverna,           romance,           saramago,2000).
livro(fahrenheit_451,      ficcao_cientifica, bradbury,1953).
livro(1984,                ficcao_cientifica, orwell,  1949).
livro(as_cronicas_de_narnia,fantasia,         lewis,   1950).
livro(um_estudo_em_escarlate,romance,         doyle,   1887).
livro(o_tempo_das_morangas,literatura_infantojuvenil, pinto, 2005).
livro(a_livraria_misteriosa,literatura_infantojuvenil,baughman,2012).
livro(a_machina_do_tempo,  ficcao_cientifica, wells,   1895).
livro(o_experimento,       suspense,          koontz,  1998).
livro(a_onda,              ficcao_cientifica, strasser,1981).

recomendar(Genero) :-
    findall(L, livro(L, Genero, _, _), LS),
    exibir(LS).

recomendar_autor(Autor) :-
    findall(L, livro(L, _, Autor, _), LS),
    exibir(LS).

recomendar(Genero, Autor) :-
    findall(L, livro(L, Genero, Autor, _), LS),
    exibir(LS).

recomendar(Genero, Autor, AnoMin) :-
    findall(L, (livro(L, Genero, Autor, Ano), Ano > AnoMin), LS),
    exibir(LS).

exibir([]).
exibir([L|R]) :-
    writeln(L),
    exibir(R).

repl :-
    repeat,
    prompt1('?- '),
    read_term(Quest, []),
    ( Quest == end_of_file -> writeln('Ate logo!'), !
    ; Quest == sair        -> writeln('Ate logo!'), !
    ; exec(Quest), fail).

% executa sem deixar sobrar "true." / "false."
exec(Objetivo) :-
    (   call(Objetivo)
    *-> flush_output
    ;   true ).

:- initialization(repl).
