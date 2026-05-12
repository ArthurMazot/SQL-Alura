INSERT INTO TabelaVendasMensais (id_mes_vendas, Mes, Ano, Quantidade, PrecoUnitario, CustoUnitario)
VALUES
    ('M01A24', 'Janeiro', 	2024, 1700, 25.00, 15.00),
    ('M02A24', 'Fevereiro', 2024, 2000, 25.00, 15.00),
    ('M03A24', 'Março', 	2024, 1800, 25.00, 14.50),
    ('M04A24', 'Abril', 	2024, 2200, 25.00, 14.50),
    ('M05A24', 'Maio', 		2024, 2400, 27.00, 16.00),
    ('M06A24', 'Junho', 	2024, 2100, 27.00, 16.00),
    ('M07A24', 'Julho', 	2024, 2300, 27.00, 17.00),
    ('M08A24', 'Agosto', 	2024, 2500, 27.00, 17.00),
    ('M09A24', 'Setembro', 	2024, 2800, 30.00, 18.00),
    ('M10A24', 'Outubro', 	2024, 2800, 30.00, 18.50),
    ('M11A24', 'Novembro', 	2024, 3000, 30.00, 18.50),
    ('M12A24', 'Dezembro', 	2024, 3400, 30.00, 19.00);
    
INSERT INTO TabelaPedidos (id_pedido, id_cliente, CidadeCliente, Latitude, Longitude, QuantidadeVendida, PrecoUnitario, Desconto)
VALUES
    ('P001', 'C101', 'São Paulo', 		-23.550520, -46.633308,  5,	25.00, 0.00),
    ('P002', 'C102', 'Campinas', 		-22.909938, -47.062633, 10, 25.00, 0.05),
    ('P003', 'C103', 'Sorocaba', 		-23.501534, -47.452594, 15, 27.00, 0.10),
    ('P004', 'C104', 'Ribeirão Preto', 	-21.177500, -47.810280, 20, 27.00, 0.10),
    ('P005', 'C105', 'Santos', 			-23.960833, -46.333889, 25, 30.00, 0.15);

INSERT INTO TabelaEstimativaCrescimento (id_estimativa, Ano, TaxaCrescimento, VendasBase)
VALUES ('E001', 2024, 0.1, 29000);

INSERT INTO TabelaMetasVendasMensais (id_mes, Mes, Ano, VendasMensais, MediaVendas5Anos)
VALUES
    ('M01A24', 'Janeiro', 	2024, 42500.00, 40000.00),
    ('M02A24', 'Fevereiro', 2024, 50000.00, 50000.00),
    ('M03A24', 'Março', 	2024, 45000.00, 50000.00),
    ('M04A24', 'Abril', 	2024, 55000.00, 50000.00),
    ('M05A24', 'Maio', 		2024, 64800.00, 60000.00),
    ('M06A24', 'Junho', 	2024, 56700.00, 50000.00),
    ('M07A24', 'Julho', 	2024, 62100.00, 60000.00),
    ('M08A24', 'Agosto', 	2024, 67500.00, 70000.00),
    ('M09A24', 'Setembro', 	2024, 84000.00, 80000.00),
    ('M10A24', 'Outubro', 	2024, 84000.00, 80000.00),
    ('M11A24', 'Novembro', 	2024, 90000.00, 95000.00),
    ('M12A24', 'Dezembro', 	2024, 102000.00,100000.00);