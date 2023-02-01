-- 1) Verifique se as informações acima são suficientes para desenvolver a consulta
-- solicitada. As informações são consistentes? 
-- São Consistentes


-- 2) Construa uma consulta em SQL para calcular a quantidade de contratos do tipo parcelado por cliente.




USE db_dataminds;
SELECT  
	count(*) as 'Total de Contra Parcelados', 
    cnpj,
    cpf,
    modalidade 
FROM Contratos 
WHERE modalidade = 'Parcelado' 
GROUP BY cnpj, cpf, modalidade ;


--------------------- \\\\\\\\\\ -------------------
-- 3) Construa uma consulta em SQL para calcular a quantidade de contratos em atraso em
-- contratos do tipo parcelado por cliente.




use db_dataminds;
SELECT 
	count(*) as 'Total de Contratos em atraso', 
    cnpj, 
    cpf,
    DataVencimentoUltimaParcela
from Contratos 
where DataVencimentoUltimaParcela < '2022-11-27'
GROUP BY cnpj, cpf, DataVencimentoUltimaParcela;


--------------------- \\\\\\\\\\ -------------------
-- 4) Construa uma consulta em SQL para calcular o valor médio em atraso de contratos do
-- tipo parcelado por cliente.


use db_dataminds;
SELECT 
	avg(ValorContratadoFuturo) as 'Valor Medio em Atraso',
    cnpj, 
	cpf, 
	DataVencimentoUltimaParcela, 
	ValorContratadoFuturo
from Contratos
where DataVencimentoUltimaParcela < '2022-11-27' and Modalidade = 'Parcelado'
GROUP BY cnpj, cpf, DataVencimentoUltimaParcela, ValorContratadoFuturo;