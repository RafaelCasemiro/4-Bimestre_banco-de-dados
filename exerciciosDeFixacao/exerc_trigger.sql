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

select*from auditoria;
