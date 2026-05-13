select * from clientes where nome = 'Maria Silva';
SELECT id, idcliente from Pedidos where status = 'Entregue';
SELECT * from produtos WHERE preco BETWEEN 10 and 15;
SELECT Nome, Cargo from colaboradores WHERE datacontratacao BETWEEN '2023-01-01' and '2023-12-31';
select C.nome from clientes C INNER join Pedidos P on C.id = P.idcliente order by P.datahorapedido LIMIT 1;
SELECT * from Produtos P left join ItensdePedido IP on P.id = IP.idproduto where IP.idproduto is NULL;
SELECT C.nome from clientes C inner join Pedidos P on C.id = P.idcliente where strftime('%Y', P.datahorapedido) = '2023' GROUP by C.nome;

SELECT P.nome, (SELECT COUNT(IP.idpedido)) as Quantidade from produtos P inner join ItensdePedido IP on P.id = IP.idproduto 
GROUP by P.nome HAVING (SELECT COUNT(Ip.idpedido)) < 15;

SELECT Pr.nome, C.nome from clientes C INNER join Pedidos P on C.id = P.idcliente 
INNER join ItensdePedido IP on P.id = IP.idpedido 
INNER join produtos Pr on IP.idproduto = Pr.id 
where C.nome in ('Pedro Alves', 'Ana Rodrigues');

SELECT C.nome, C.id, Sum(IP.precounitario) as ValorTotal from clientes C INNER join Pedidos P on C.id = P.idcliente 
INNER join ItensdePedido IP on P.id = IP.idpedido GROUP by C.nome ORDER by Sum(IP.precounitario) DESC LIMIT 1;