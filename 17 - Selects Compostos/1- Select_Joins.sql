Use Projeto
go
USE Locadora_DVD

SELECT * FROM Users
SELECT * FROM Users_has_Projects

-- EXERCICIO 1 -----------------------------------------------------------------------------------------

--FAZER
-- a) Adicionar User
INSERT INTO Users(Name, Username, Email) VALUES ('Joao', 'Ti_joao', 'joao@empresa.com')

-- b) Adicionar Project
INSERT INTO Projects(Name, Description, Date) VALUES('Atualização de Sistemas', 'Modificação de Sistemas Operacionais nos PC´s', '12/09/2014')

--CONSULTAR
-- 1) Id, Name e Email de Users, Id, Name, Description e Data de Projects, dos usuários que
-- participaram do projeto Name Re-folha
SELECT Users.ID, Users.Name, Users.Email, Projects.ID, Projects.Description, Projects.Date
FROM Users_has_Projects AS upro INNER JOIN Users
ON Users.ID = upro.users_id
INNER JOIN Projects
ON Projects.ID = upro.projects_id
WHERE Projects.Name = 'Re-folha'

-- 2) Name dos Projects que não tem Users
SELECT Projects.ID, Projects.Name FROM Projects LEFT OUTER JOIN Users_has_Projects AS upro
ON Projects.ID = upro.projects_id
WHERE upro.projects_id IS NULL

-- 3) Name dos Users que não tem Projects
SELECT Users.Name FROM Users LEFT OUTER JOIN Users_has_Projects AS upro 
ON Users.ID = upro.users_id
WHERE upro.users_id IS NULL


