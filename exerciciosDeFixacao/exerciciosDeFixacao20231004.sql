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
