-- Tabela Vendas Mensais
CREATE TABLE TabelaVendasMensais (
    id_mes_vendas VARCHAR(20) NOT NULL PRIMARY KEY,
    Mes VARCHAR(50) NOT NULL,
  	Ano INTEGER NOT NULL,
  	Quantidade INTEGER NOT NULL,
  	PrecoUnitario DECIMAL NOT NULL,
  	CustoUnitario DECIMAL NOT NULL
);

-- Tabela Pedidos
CREATE TABLE TabelaPedidos (
    id_pedido VARCHAR(20) NOT NULL PRIMARY KEY,
  	id_cliente VARCHAR(20) NOT NULL,
  	CidadeCliente VARCHAR(50) NOT NULL,    
    Latitude DECIMAL NOT NULL,
    Longitude DECIMAL NOT NULL,
  	QuantidadeVendida INTEGER NOT NULL,
    PrecoUnitario DECIMAL NOT NULL,
    Desconto DECIMAL NOT NULL
);

-- Tabela Estimativa Crescimento
CREATE TABLE TabelaEstimativaCrescimento (
    id_estimativa VARCHAR(20) NOT NULL PRIMARY KEY,
    Ano INTEGER NOT NULL,
    TaxaCrescimento DECIMAL NOT NULL,
    VendasBase INTEGER NOT NULL
);

-- Tabela Metas de Vendas Mensais
CREATE TABLE TabelaMetasVendasMensais (
    id_mes VARCHAR(20) NOT NULL PRIMARY KEY,
    Mes VARCHAR(50) NOT NULL,
  	Ano INTEGER NOT NULL,
  	VendasMensais DECIMAL NOT NULL,
  	MediaVendas5Anos DECIMAL NOT NULL
);
