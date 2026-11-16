-- EXERCICIO 2 -----------------------------------------------------------------------------------------

Use Locadora_DVD
go

-- 1) Consultar num_cadastro do cliente, nome do cliente, data_locacao (Formato
-- dd/mm/aaaa), Qtd_dias_alugado (total de dias que o filme ficou alugado), titulo do
-- filme, ano do filme da locação do cliente cujo nome inicia com Matilde

SELECT cl.Num_cadastro, cl.Nome, CONVERT(varchar(10), loca.Data_locacao ,103) AS Data_Locacao, DATEDIFF(DAY, loca.Data_locacao, loca.Data_devolucao) AS Qtd_dias_alugado, F.Nome, F.Ano
FROM Cliente AS cl INNER JOIN Locacao AS loca 
ON cl.Num_cadastro = loca.ClienteNum_cadastro
INNER JOIN DVD
ON DVD.Num = loca.DVDNum
INNER JOIN Filme as F
ON F.ID = DVD.FilmeID
WHERE cl.Nome LIKE 'Matilde%'

-- 2) Consultar nome da estrela, nome_real da estrela, título do filme dos filmes
-- cadastrados do ano de 2015
SELECT e.Nome, e.Nome_real, f.Nome, f.Ano FROM Estrela AS e INNER JOIN Filme_Estreal as fe
ON e.ID = fe.EstrelaID
INNER JOIN Filme f
ON f.ID = fe.FilmeID
WHERE f.Ano = 2015

-- 3) Consultar título do filme, data_fabricação do dvd (formato dd/mm/aaaa), caso a
-- diferença do ano do filme com o ano atual seja maior que 6, deve aparecer a diferença
-- do ano com o ano atual concatenado com a palavra anos (Exemplo: 7 anos), caso
-- contrário só a diferença (Exemplo: 4).
SELECT f.Nome, CONVERT(VARCHAR(11), dvd.Data_fabricacao, 103) AS 'Data Fabricação', 
	CASE
		WHEN DATEDIFF(YEAR, DVD.Data_fabricacao, GETDATE()) > 6
		THEN CAST(DATEDIFF(YEAR, DVD.Data_fabricacao, GETDATE()) AS VARCHAR(10)) + ' anos'
		ELSE CAST(DATEDIFF(YEAR, DVD.Data_fabricacao, GETDATE()) AS VARCHAR(10))
	END AS Diferenca
	FROM Filme as f INNER JOIN DVD
ON f.ID = DVD.FilmeID
