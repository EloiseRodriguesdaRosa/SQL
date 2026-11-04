-- Exercícios: Consultas SQL

-- INTRODUÇÃO
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
WHERE age>=17 AND age<=25 
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

-- FORMATO DE RETORNO ESPECÍFICO
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

-- IN, AS, BETWEEN, LIKE
/*Tabelas e colunas disponíveis:
countries: location_x, location_y, country

Retorne todos os registros dos seguintes países:
Oman, Nicaragua, Bhutan, Senegal, Belarus*/

SELECT * FROM contries
WHERE country IN ('Oman', 'Nicaragua', 'Bhutan', 'Senegal', 'Belarus'); -- IN verifica se uma coluna corresponde a algum valor de uma lista

/*Tabelas e colunas disponíveis:
cellphones: model, price, wifi_5g

Busque todos os modelos de celulares que começam com a letra m e cuja 3ª letra é o, cuja faixa de preço esteja entre 1000 e 1500 
e que sejam compatíveis com wifi_5g.
Retorne apenas o modelo do celular e renomeie-o para id*/

SELECT model AS id -- AS nomeia a coluna como id
FROM cellphones
WHERE model LIKE 'm_o%' -- like verifica se uma string corresponde a um determinado padrão, permitindo identificar semelhanças entre textos
	AND price BETWEEN 1000 AND 1500 --  -- BETWEEN mostra um intervalo de valores, no caso, incluindo tanto o 1000 como o 1500
    AND wifi_5g IS TRUE;
    
-- OPERAÇÕES ARITMÉTICAS
/*Tabelas e colunas disponíveis:
products: id, price, quantity
Crie uma consulta que calcule o seguinte:

Uma coluna chamada total_value que multiplica o preço pela quantidade e adiciona um custo fixo de envio de 15
Uma coluna chamada discounted_value que:
Primeiro multiplica o preço pela quantidade
Em seguida aplica um desconto de 20% (multiplica por 0.8)
Por fim, adiciona um custo fixo de envio de 10
Tente usar parênteses adequadamente para garantir que os cálculos sejam realizados na ordem correta!*/

SELECT (price * quantity) + 15 AS total_value,
	   ((price * quantity) * 0.8) + 10 AS discounted_value
FROM products;

/*Crie uma consulta que:
Mostre o ID do produto
Atribua cada produto a uma de três equipes de controle de qualidade (0, 1 ou 2) com base no ID do produto usando o operador módulo; 
chame essa coluna de quality_control
Inclua apenas produtos cuja coluna quantity contenha um número ímpar (por exemplo, 1, 3, 5, 7...)*/

SELECT id, id % 3 AS quality_control
FROM products 
WHERE quantity % 2 = 1; -- % resulta no resto da divisão