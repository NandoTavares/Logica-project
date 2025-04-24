# 📚 Sistema de Recomendação de Livros em Prolog
Este projeto implementa um sistema de recomendação de livros utilizando a linguagem lógica Prolog. O sistema permite consultar livros por gênero, autor, ano de publicação e combinações desses critérios.

# 🔧 Pré-requisitos
Antes de executar o código, é necessário instalar o SWI-Prolog em sua máquina.

Linux: Execute sudo apt install swi-prolog

macOS: Use o Homebrew: brew install swi-prolog

Windows: Baixe o instalador em swi-prolog.org​

# 🚀 Como executar
Clone este repositório:​

bash
Copiar
git clone https://github.com/seuusuario/sistema-livros-prolog.git
cd sistema-livros-prolog
Abra o terminal do SWI-Prolog:​
GitHub
+1
GitHub
+1

bash
Copiar
swipl
Carregue o arquivo Prolog:​

## prolog
Copiar
?- consult('nomedoarquivo.pl').
Execute as consultas desejadas:​

prolog
Copiar
?- recomendar(ficcao_cientifica).
?- recomendar_autor('asimov').
?- recomendar(ficcao_cientifica, 'asimov').
?- recomendar(ficcao_cientifica, 'asimov', 1951).
📄 Estrutura do código
Base de Conhecimento: Contém fatos sobre livros, incluindo título, gênero, autor e ano de publicação.

## Regras de Recomendação:

recomendar(Genero): Recomenda livros de um gênero específico.

recomendar_autor(Autor): Recomenda livros de um autor específico.

recomendar(Genero, Autor): Recomenda livros de um gênero e autor específicos.

recomendar(Genero, Autor, Ano): Recomenda livros de um gênero, autor e ano específicos.​

## 🧪 Exemplos de uso
prolog
Copiar
?- recomendar(fantasia).
?- recomendar_autor('asimov').
?- recomendar(fantasia, 'tolkien').
?- recomendar(fantasia, 'tolkien', 1937).
## 📌 Observações
As consultas retornam os livros que atendem aos critérios especificados.

O sistema utiliza o predicado write/1 para exibir os resultados no terminal.

Para evitar o retorno de true ou false após a execução das consultas, o código foi estruturado para finalizar a execução sem retornar valores adicionais.
