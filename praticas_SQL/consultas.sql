-- Exercícios: Consultas SQL

/* Tabelas e colunas disponíveis:
events: event_id, people
Busque o event_id de todos os eventos em que people é menor que 14.*/
SELECT event_id 
FROM events
WHERE people < 14;
    
/*Tabelas e colunas disponíveis:
people: name, age, status
Busque todas as pessoas que tenham entre 17 e 25 anos (incluindo 17 e 25) e cujo status seja igual a employed*/
SELECT *
FROM people
WHERE age BETWEEN 17 AND 25 -- BETWEEN mostra um intervalo de valores, no caso, incluindo tanto o 17 como o 25
	AND status = 'employed';
    
/*Busque todas as pessoas que não estão employed e não têm menos de 25 anos.
Observe que NOT employed e unemployed são coisas diferentes, pois a coluna status contém mais de 2 valores distintos.*/
SELECT *
FROM people
WHERE NOT status = 'employed' -- NOT é usado para indicar uma condicão que não deve ser atendida
	AND NOT age < 25;
    
/*Tabelas e colunas disponíveis:
objects: id, colorful, in_stock, size , is_fragile
Encontre todos os objetos que atendam a PELO MENOS UMA destas condições:
colorful e não fragile
Em stock e pequeno (size <= 2)*/
SELECT * 
FROM objects 
WHERE (colorful IS TRUE AND is_fragile IS NOT TRUE) -- valores booleanos podem ser TRUE ou FALSE
    OR (in_stock IS TRUE AND size<=2);
    
/*Tabelas e colunas disponíveis:
events: id, name, size, year
Você tem uma empresa de cibersegurança que sofreu um ataque arbitrário, resultando no desligamento de todos os seus sistemas.
Para resolver esse problema, você precisa identificar todos os eventos que parecem suspeitos. 
Um evento suspeito atende a um ou mais dos seguintes critérios:

Seu tamanho é significativamente diferente do tamanho médio normal de um evento, que é de 50MB.
Para esta análise, considere suspeitos os arquivos menores que 1MB ou maiores que 100MB.
Foi criado antes do ano 2000
Está sem nome

Sua tarefa:
Identifique todos os eventos suspeitos com base nos critérios mencionados acima.
Retorne os IDs e os nomes dos eventos em ordem decrescente por ID.
Observação: Um evento pode ser suspeito por vários motivos. 
Por exemplo, um evento com tamanho de 72MB e ano 1051 seria sinalizado por causa do ano (1051 < 2000), 
não por causa do tamanho (72MB está dentro do intervalo normal).*/

SELECT id, name
FROM events
WHERE size < 1 OR size > 100
	OR year < 2000
    OR name IS NULL -- IS NULL verifica se o campo nome é nulo
ORDER BY id DESC; -- ORDER BY é utilizado para ordenar resultados, no caso, utilizando DESC, ordena em ordem decrescente

/*Tabelas e colunas disponíveis:
employees: id, salary, status

Como proprietário de uma fábrica de veículos, você concordou em conceder um aumento de salário para os quatro funcionários 
com os salários mais baixos que também são casados, pois eles estão enfrentando dificuldades para sustentar suas famílias. 
Retorne apenas os IDs dos 4 funcionários relevantes (aqueles com os salários mais baixos entre os funcionários casados). 
Ordene os resultados por salário em ordem ascendente.*/

SELECT id
FROM employees
WHERE status = 'married'
ORDER BY salary
LIMIT 4; -- LIMIT utilizado para limitar o retorno (no caso, só vai retornar os 4 primeiros registros)

