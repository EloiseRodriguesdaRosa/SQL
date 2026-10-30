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