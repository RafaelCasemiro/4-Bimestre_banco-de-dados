Questão 1

DROP TABLE nomes;
CREATE TABLE nomes (
nome VARCHAR(100)
);

INSERT INTO nomes VALUES
('Roberta'),
('Roberto'),
('Maria Clara'),
('João');

select * from nomes;

select upper(nome) from nomes;
select length(nome) from nomes;
select concat('Sr. ', nome) from nomes where nome like '%o';
select concat('Sra. ', nome) from nomes where nome like '%a';

Questão 2

DROP TABLE produtos;
CREATE TABLE produtos (
produto VARCHAR(100),
preco FLOAT,
quantidade INT
);

INSERT INTO produtos VALUES 
('banana', 1000.900, 1000000.577),
('cartucho de carabina', 300.905, 100.6766),
('peixe', 5.6467, 50.777),
('morangos frescos', 40.643, 22.4359342875934652354);

select round(preco, 2) from produtos;

select abs(quantidade) from produtos;

select avg(preco) from produtos;

Questão 3

CREATE TABLE eventos(
id_evento INT PRIMARY KEY auto_increment,
nome_evento VARCHAR(200),
data_evento DATETIME
);

INSERT INTO eventos (nome_evento, data_evento) VALUES
('festa','2020-03-09 18:00:00'),
('festinha','2006-11-12 00:30:00'),
('evento','1998-07-29 22:45:00');

INSERT INTO eventos (nome_evento, data_evento) VALUES
('eventinho', NOW());

SELECT DATEDIFF('2020-03-09 18:00:00', '1998-07-29 22:45:00');

SELECT DAYNAME('2020-03-09 18:00:00');

Questão 4

SELECT produto, IF(quantidade > 0, 'Em estoque','Fora de estoque') as estoque from produtos;

SELECT produto, CASE WHEN preco < 300 THEN 'barato' WHEN preco >= 300 and preco <= 1000 THEN 'médio' WHEN preco > 1000 THEN 'caro' END as categoria from produtos;

Questão 5

CREATE FUNCTION TOTAL_QP(preco FLOAT, quantidade INT)
RETURNS FLOAT DETERMINISTIC
BEGIN
	RETURN preco * quantidade;
END;

SELECT produto, TOTAL_QP(preco, quantidade) as valor_total FROM produtos where produto = 'morangos frescos' UNION
SELECT produto, TOTAL_QP(preco, quantidade) as valor_total FROM produtos where produto = 'cartucho de carabina' UNION
SELECT produto, TOTAL_QP(preco, quantidade) as valor_total FROM produtos where produto = 'banana' UNION
SELECT produto, TOTAL_QP(preco, quantidade) as valor_total FROM produtos where produto = 'peixe' UNION
SELECT produto, TOTAL_QP(preco, quantidade) as valor_total FROM produtos where produto = 'pôneis';

