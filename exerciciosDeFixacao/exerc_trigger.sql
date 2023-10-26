-- 1-Questão

CREATE TRIGGER msg_novo
AFTER INSERT
ON clientes 
FOR EACH ROW
INSERT INTO auditoria (mensagem, data_hora)
VALUES ('Bem-Vindo(a)', NOW());

insert into clientes (nome)
values ('Junis Cleber');

select*from auditoria;

-- 2-Questão

CREATE TRIGGER tent_delet
BEFORE DELETE
ON clientes 
FOR EACH ROW
INSERT INTO auditoria (mensagem, data_hora)
VALUES ('Você tentou deletar', NOW());

delete from clientes
where id = 1;

select*from auditor;

-- 3-Questão

CREATE TRIGGER att_mnsg
AFTER UPDATE 
ON clientes
FOR EACH ROW
INSERT INTO auditoria (mensagem, data_hora)
VALUES (concat('O nome ', old.nome, ' foi modificado para' , new.nome), now());

update clientes
set nome = "Ronaldo"
where id = 4;

select * from clientes;
select * from auditoria;

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