# 📚 Sistema de Recomendação de Livros em Prolog
Este projeto implementa um sistema de recomendação de livros utilizando a linguagem lógica Prolog. O sistema permite consultar livros por gênero, autor, ano de publicação e combinações desses critérios.

# 🔧 Pré-requisitos
Antes de executar o código, é necessário instalar o SWI-Prolog em sua máquina.

Linux: Execute sudo apt install swi-prolog

macOS: Use o Homebrew: brew install swi-prolog

Windows: Baixe o instalador em swi-prolog.org​

# 🚀 Como executar
Clone este repositório:​

Abra o terminal do SWI-Prolog:​

Compile o arquivo prolog:

## Execute as consultas desejadas:​

- Rode o menu
- Escolha sua opção de busca
- Busque seu livro desejado desde que esteja no nosso banco de dados.

# 📄 Estrutura do código
Base de Conhecimento: Contém fatos sobre livros, incluindo título, gênero, autor e ano de publicação.

## Regras de Recomendação:

recomendar(Genero): Recomenda livros de um gênero específico.

recomendar_autor(Autor): Recomenda livros de um autor específico.

recomendar(Genero, Autor): Recomenda livros de um gênero e autor específicos.

recomendar(Genero, Autor, Ano): Recomenda livros de um gênero, autor e ano específicos.​

## 🧪 Exemplos de uso
1.    (% escolha da opção 1, busca por categoria)
fantasia.     (% escolha da categoria fantasia)

## 📌 Observações
As consultas retornam os livros que atendem aos critérios especificados.

O sistema utiliza o predicado write/1 para exibir os resultados no terminal.
