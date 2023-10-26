-- 1-Questão

CREATE TRIGGER msg_novo
AFTER INSERT
ON clientes 
FOR EACH ROW
INSERT INTO auditoria (mensagem, data_hora)
VALUES ('Bem-Vindo(a)', NOW());

INSERT INTO clientes (nome)
VALUES ('Junis Cleber');

SELECT * FROM auditoria;

-- 2-Questão

CREATE TRIGGER tent_delet
BEFORE DELETE
ON clientes 
FOR EACH ROW
INSERT INTO auditoria (mensagem, data_hora)
VALUES ('Você tentou deletar', NOW());

DELETE FROM clientes
WHERE id = 1;

SELECT * FROM auditor;

-- 3-Questão

CREATE TRIGGER att_mnsg
AFTER UPDATE 
ON clientes
FOR EACH ROW
INSERT INTO auditoria (mensagem, data_hora)
VALUES (concat('O nome ', old.nome, ' foi modificado para' , new.nome), now());

UPDATE clientes
SET nome = "Ronaldo"
WHERE id = 4;

SELECT * FROM clientes;
SELECT * FROM auditoria;

-- 4-Questão

DELIMITER//
CREATE TRIGGER att_nome_nulo
BEFORE UPDATE
ON clientes
FOR EACH ROW
BEGIN
IF new.nome IS NULL OR new.nome = '' OR new.nome = "" THEN
	INSERT INTO auditoria (mensagem, data_hora)
	VALUES ("Não é possível realizar a alteração", now());
END IF;
END;
//
UPDATE clientes
SET nome = ""
WHERE id = 3;
// 
DELIMITER;

-- 5-Questão

DELIMITER //
CREATE TRIGGER loja_estoque
AFTER INSERT
ON pedidos
FOR EACH ROW
BEGIN
DECLARE estoque_atual int;
SELECT estoque INTO estoque_atual FROM produtos wHERE id = new.produto_id;
UPDATE produtos
SET estoque = estoque - new.quantidade
WHERE id = new.produto_id;

IF estoque_atual - new.quantidade < 5 THEN 
	INSERT INTO auditoria (mensagem, data_hora)
	values (concat('O estoque está acabando'),now());
END IF;
END;
//
INSERT INTO pedidos(produto_id, quantidade)
VALUES (1, 8);
SELECT * FROM auditoria;
//
DELIMITER;
