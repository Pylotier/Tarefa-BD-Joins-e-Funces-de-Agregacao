USE Projeto

-- EXERCICIO 1 -----------------------------------------------------------------------------------------
-- Quantos projetos não tem usuários associados a ele. A coluna deve chamar
-- qty_projects_no_users
SELECT COUNT(p.ID) AS qty_projects_no_users FROM 
Projects as p LEFT OUTER JOIN Users_has_Projects AS upro
ON p.ID = upro.projects_id
WHERE upro.projects_id IS NULL

-- Id do projeto, nome do projeto, qty_users_project (quantidade de usuários por
-- projeto) em ordem alfabética crescente pelo nome do projeto
SELECT p.ID, p.Name, COUNT(u.Name) AS qty_users_project FROM Projects AS p LEFT OUTER JOIN Users_has_Projects AS upro
ON p.ID = upro.projects_id
LEFT JOIN Users AS u
ON u.ID = upro.users_id
GROUP BY p.ID, p.Name
ORDER BY p.Name ASC

SELECT u.ID, u.Name, COUNT(p.ID) AS QtdeUsersProject FROM Users AS u LEFT OUTER JOIN Users_has_Projects AS upro
ON u.ID = upro.users_id
LEFT OUTER JOIN Projects AS p
ON p.ID = upro.projects_id
GROUP BY u.ID, u.Name
ORDER BY u.Name ASC


