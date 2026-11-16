-- EXERCICIO 2 -----------------------------------------------------------------------------------------
USE Locadora_DVD
SELECT * FROM Locacao

-- 1) Consultar, num_cadastro do cliente, nome do cliente, titulo do filme, data_fabricação
-- do dvd, valor da locação, dos dvds que tem a maior data de fabricação dentre todos os
-- cadastrados.
SELECT C.Num_cadastro, C.Nome, f.Nome, MAX(DVD.Data_fabricacao) AS 'Data Fabricacao' , loc.Valor
FROM DVD INNER JOIN Locacao AS loc
ON DVD.Num = loc.DVDNum
INNER JOIN Filme as f
ON f.ID = DVD.FilmeID
INNER JOIN Cliente as C
ON C.Num_cadastro = loc.ClienteNum_cadastro
GROUP BY f.Nome, loc.Valor, C.Num_cadastro, C.Nome, f.Nome

-- 2) Consultar Consultar, num_cadastro do cliente, nome do cliente, data de locação
-- (Formato DD/MM/AAAA) e a quantidade de DVD ́s alugados por cliente (Chamar essa
-- coluna de qtd), por data de locação
SELECT C.Num_cadastro, C.Nome, CONVERT(VARCHAR(11), loc.Data_locacao, 103) AS 'Data Locacao', COUNT(c.Num_Cadastro) AS qtd
FROM Cliente AS C LEFT OUTER JOIN Locacao AS loc
ON C.Num_cadastro = loc.ClienteNum_cadastro
INNER JOIN DVD 
ON DVD.Num = loc.DVDNum
GROUP BY C.Num_cadastro, C.Nome, loc.Data_locacao

-- 3) Consultar Consultar, num_cadastro do cliente, nome do cliente, data de locação
-- (Formato DD/MM/AAAA) e a valor total de todos os dvd ́s alugados (Chamar essa
-- coluna de valor_total), por data de locação
SELECT C.Num_cadastro, C.Nome, CONVERT(VARCHAR(11), loc.Data_locacao, 103) AS 'Data Fabricacao', SUM(loc.Valor) AS Valor_Total
FROM Cliente AS C INNER JOIN Locacao AS loc
ON C.Num_cadastro = loc.ClienteNum_cadastro
INNER JOIN DVD
ON DVD.Num = loc.DVDNum
GROUP BY C.Num_cadastro, C.Nome, loc.Data_locacao

-- 4) Consultar Consultar, num_cadastro do cliente, nome do cliente, Endereço
-- concatenado de logradouro e numero como Endereco, data de locação (Formato
-- DD/MM/AAAA) dos clientes que alugaram mais de 2 filmes simultaneamente
SELECT C.Num_cadastro, C.Nome, C.Logradouro + ' ' + CAST(C.Num AS VARCHAR(4)) AS 'Endereco', CONVERT(VARCHAR(11), loc.Data_locacao, 103) AS 'Data Locacao', COUNT(C.Nome) AS qtd
FROM Cliente AS C INNER JOIN Locacao AS loc
ON C.Num_cadastro = loc.ClienteNum_cadastro
INNER JOIN DVD
ON DVD.Num = loc.DVDNum
GROUP BY C.Num_cadastro, C.Nome, C.Logradouro, C.Num, loc.Data_locacao
HAVING COUNT(C.Num_cadastro) >= 2