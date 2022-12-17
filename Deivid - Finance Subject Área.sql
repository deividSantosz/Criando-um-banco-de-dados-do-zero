Deivid Santos de Jesus – Trabalho BD I

Banco escolhido: Finance subject área.

create database Finance;
create table endereco
(
idEndereco int,
idCliente int,
CEP varchar(8),
numero int,
logradouro varchar( 100),
complemento varchar(100),
primary key (idEndereco),
foreign key (idCliente) references cliente (idCliente)
);
Alter table finance.endereco add column corDaCasa varchar(100);
insert into finance.endereco values(1,1,  '09867890', 2 , 'Rua ABC', 'Proximo a um viaduto', 'Vermelho');
insert into finance.endereco values(2,2, '12567890', 28, 'Rua Eliezer Sousa', 'Proximo a prefeitura’, ‘Amarelo');
insert into finance.endereco values(3,3, '68167890', 35, 'Rua A', 'Proximo ao parque de exposicao', 'Preto');
insert into finance.endereco values(4,4, '91267890', 21, 'Rua Paulo Souto', 'Proximo a um colegio', 'Branco');
insert into finance.endereco values(5,5, '78967890', 33, 'Rua Miguel Oliveira', 'Proximo a uma quadra', 'Cinza');
insert into finance.endereco values(6,6, '23167890', 12, 'Rua A', 'Proximo a um convento', 'Azul');
insert into finance.endereco values(7,7, '5806790', 99, 'Rua X', 'Proximo a um campo de futebol', 'Rosa');
insert into finance.endereco values(8,8, '45567654', 29, 'Rua Hilton Lopes', 'Proximo a um jardim', 'Verde');
insert into finance.endereco values(9,9, '45567320', 67, 'Rua Massaranduba', 'Proximo a um parque', 'Roxo');
insert into finance.endereco values(10,10, '67367890', 34, 'Rua Sao Jose', 'Proximo a um mercado', 'Amarelo');

create table cliente
(
idCliente int,
idEndereco int,
CPF varchar (11),
profissao varchar(100),
primary key(idCliente),
foreign key (idEndereco) references endereço (idEndereco)
);
Alter table finance.cliente add column idade int;
Alter table finance.cliente add column nome varchar(50);

insert into finance.cliente values (1, 1, ’12877390987’, ‘professor’, 28, ‘Deivid’);
insert into finance.cliente values (2, 2, ‘54877390921’ , ‘professor’, 34, ‘Leandro’);
insert into finance.cliente values (3, 3, ‘06677390978’,  ‘progamador’, 21, ‘Eudes’);
insert into finance.cliente values (4, 4, ‘87577390945’ , ‘engenheiro’, 45, ‘ Leonardo’);
insert into finance.cliente values (5, 5,’ 06527390921 ‘, ‘eletricista’, 37, ‘Emerson’);
insert into finance.cliente values (6, 6, ‘91477390909 ‘,‘pediatra’, 32, ‘ Eduardo’);
insert into finance.cliente values (7, 7,’ 09887390912 ‘, ‘veterinario’, 26, ‘ Ryalli’);
insert into finance.cliente values (8, 8, ‘03677390919 ‘, ‘cirurgião’, 53, ‘ Paula’);
insert into finance.cliente values (9, 9, ‘21877390931’, ‘dentista’, 29, ‘ Fernando’);
insert into finance.cliente values (10, 10,’ 12128773900 ‘, ‘contador’, 41, ‘Adriano’);


create table aux_contastipo 
(
idTipoConta int,
Descricao varchar(50),
primary key(idTipoConta)
);
Alter table finance.aux_contastipos add column SaldoTotal int;
insert into finance.aux_tiposConta (1, ‘Pessoal’, 23000);
insert into finance.aux_tiposConta (2, ‘Empresarial’, 250000);
insert into finance.aux_tiposConta (3, ‘Pessoal’, 6000);
insert into finance.aux_tiposConta (4, ‘Empresarial’, 34000);
insert into finance.aux_tiposConta (5, ‘Pessoal’, 1000);
insert into finance.aux_tiposConta (6, ‘Pessoal’, 500);
insert into finance.aux_tiposConta (7, ‘Pessoal’, 2000);
insert into finance.aux_tiposConta (8, ’Empresarial’, 50000);
insert into finance.aux_tiposConta (9, ‘Empresarial’, 100000);
insert into finance.aux_tiposConta (10, ‘Pessoal’, 1000);



create table contas
(
idConta int, 
tipoConta varchar(50),
idCliente int,
balancoConta int,
primary key (idConta),
foreign key (tipoConta) references aux_contastipo (idTipoConta),
foreign key idCliente references cliente (idCliente) 
);
Alter table finance.contas add column sobreConta varchar (50);
Insert into finance.contas values (1, 1, 1, 3000, ‘Conta corrente’);
Insert into finance.contas values (2, 2, 2, 23000, ‘Conta corrente’);
Insert into finance.contas values (3, 3, 3, 2400, ‘Conta poupança’);
Insert into finance.contas values (4, 4, 4, 3500, ‘Conta corrente’);
Insert into finance.contas values (5, 5, 5, 20000, ‘Conta poupança);
Insert into finance.contas values (6, 6, 6, 11000, ‘Conta corrente’);
Insert into finance.contas values (7, 7, 7, 12000, ‘Conta poupança);
Insert into finance.contas values (8, 8, 8, 22000, ‘Conta poupança’);
Insert into finance.contas values (9, 9, 9, 100000, ‘Conta Corrente’);
Insert into finance.contas values (10, 10, 10, 15000, ‘Conta corrente’);

create table aux_TipoTransacao
(
codTransacao int,
tipoTransacao varchar (50),
primary key (idTransacao)
);
Alter table finance.aux_TipoTransacao add column metodo varchar (30);
insert into finance.aux_TipoTransacao values (1, ‘Credito’, ‘Pix’);
insert into finance.aux_TipoTransacao values (2, ‘Credito’, ‘TED’);
insert into finance.aux_TipoTransacao values (3, ‘Credito’, ‘DOC’);
insert into finance.aux_TipoTransacao values (4, ‘Debito’, ‘Pix’);
insert into finance.aux_TipoTransacao values (5, ‘Debito’, ‘Pix’);
insert into finance.aux_TipoTransacao values (6, ‘Debito’, ‘DOC’);
insert into finance.aux_TipoTransacao values (7, ’Credito’, ‘DOC’);
insert into finance.aux_TipoTransacao values (8, ‘Credito’, ‘TED’);
insert into finance.aux_TipoTransacao values (9, ‘Credito’, ‘TED’);
insert into finance.aux_TipoTransacao values (10, ‘Debito’, ‘PIX’);

create table transacao
(
idTransacao int, 
idConta int, 
codTransacao int, 
dataTransacao date,
totalTransacao float,
primary key (idTransacao),
foreign key (idConta) references conta (idConta),
foreign key (idTransacao) references aux_tipoTransacao (codTransacao)
);
Alter table finance.transacao add column Banco varchar(50);

insert into finance.transacao (1, 1, 1, ‘7-26-2022’, ‘45320’, ‘Banco do Brasil’);
insert into finance.transacao (2, 2, 2, ‘4-22-2018’, ‘3200’, ‘Caixa’);
insert into finance.transacao (3, 3, 3, ‘8-10-2021’, ‘2000.32’, ‘Banco Nordeste’);
insert into finance.transacao (4, 4, 4, ‘1-1-2022’, ‘500.45’, ‘Bradesco’);
insert into finance.transacao (5, 5, 5, ‘10-16-2022’, ‘3456.89’, ‘Banco Do Brasil’);
insert into finance.transacao (6, 6, 6, ‘1-30-2022’, ‘15000’, ‘Caixa’);
insert into finance.transacao (7, 7, 7, ‘7-14-2022’, ‘2500’, ‘Bradesco’);
insert into finance.transacao (8, 8, 8, ‘5-21-2020’, ‘10000’, ‘Itau’);
insert into finance.transacao (9, 9, 9, ‘7-26-2022’, ‘4210’, ‘Itau’);
insert into finance.transacao (10, 10, 10, ‘3-21-2022’, ‘45000’, ‘Caixa’);



#------------------------------------------  READ ------------------------------------------------------

select cliente.nome, cliente.idade from finance.cliente; 
# selecionando nome e idade do cliente da tabela cliente
select transacao.totalTransacao, aux_Tipotransacao.codtransacao from finance.transacao, finance.aux_TipoTransacao where transacao.idTransacao = aux_tipotransacao.codtransacao;
#selecionando o total e o código da transacao da tabela transacao e aux_tipotransacao com o auxilio das chaves.

Select cliente.nome, cliente.idCliente, endereço.logradouro, endereço.CEP from finance. cliente join finance.endereco on cliente.idCliente = endereço.idCliente and cliente.CPF = ‘12877390987’;

#selecionando nome, id, logradouro e cep do cliente com CPF = 12877390987.

#------------------------------------ UPDATE-----------------------------------

update finance.endereco set numero = 23 where idCliente = 1;
#atualizando o numero do endereço do cliente com id 1 para 23
update finance.cliente set nome = ‘Murilo’ where CPF = ‘12877390987’;
#atualizando o nome do cliente com cpf 12877390987 para Murilo
update finance.transacao set banco = ‘Banco do Brasil’ where totalTransacao = 3200;
#atualizando o banco da transacao que movimentou 3200 para Banco do brasil, antes era caixa.
Update finance.contas set balancoConta = 23000 where  idConta = (select idConta from finance.contas where idCliente = 4);
#atualizando o balancoConta do cliente com id 4, usando consultas aninhadas.
Update finance.endereco set logradouro = ‘Rua BD’ where idEndereco = (select idCliente from finance.cliente where Nome = ‘Deivid’);
#atualizando consultas o logradouro do cliente com o nome deivid para Rya BD 
#com consultas aninhadas.

#-------------------------------- DELETE --------------------------------------

Delete from finance.cliente where idCliente = 1;
#deletando a linha da tabela cliente onde o id cliente é igual a 1
drop table endereco;
#deletando a tabela endereco
Delete from finance.cliente where id cliente in (7,8,9);
#deletando todos os clientes com o id 7,8,9
Delete from finance.contas where id conta in (5,6,3) and sobreConta = ‘ Conta poupança’;
#deletando as contas com id 5,6,3 e as contas do tipo conta poupança.
Delete from finance.endereco where idEndereco in (select idEndereco from finance.endereco where logradouro = ‘ Rua X’ );
#deletando da tabela endereco os endereços que tem o logradouro como rua X
Delete from finance.cliente where idCliente in (select idCliente from finance.cliente where idade = 21);
#deletando da tabela cliente os clientes que tem a idade 21.

#CRUD terminado, comandos create, update, select (para ler) e delete todos foram utilizados.


#Agora usarei as funções agregadas, group, consultas aninhadas, distinct, having

#--------------------------------- CONSULTAS -------------------------------------
select count (banco) from finance.transacao where banco = ‘Banco do Brasil’;
#vai contar quantas vezes tem banco do brasil na tabela transacao

select avg (totalTransacao) from finance.transacao where banco = ‘Caixa’;
#vai retornar a media dos valores de Totaltransacao do banco caixa

Select max(balancoConta) from finance.contas where sobreConta = ‘Conta corrente’;
#vai selecionar o valor máximo da coluna balancoConta das contas correntes

Select min(balancoConta) from finance.contas where sobreConta = ‘Conta poupanca’;
#vai selecionar o valor mínimo da coluna balancoConta das contas poupanças

Select cliente.CPF , sum(contas.balancoConta) as ExtratoConta 
from finance.cliente, finance.contas where cliente.idCliente = contas.idCliente
group by cliente.nome;
# selecionando o cpf e a soma dos balanço da conta (sendo renomeada para Extrato conta)
# da tabela cliente e contas, sendo agrupadas pelo nome do cliente.
 
Select distinct contas.banco, cliente.profissao
from finance.cliente, finance.contas where cliente.idCliente = contas.idCliente;
#selecionando o banco e a profissão do cliente e evitando nomes repetidos com o distinct

Select cliente.nome, cliente.idade, idEndereco from finance.cliente, finance.endereco where cliente.idCliente = 
(select idEndereco from endereco where corDaCasa = ‘vermelho’);
#vai selecionar o nome do cliente, idade e o id do endereco aonde a cor da casa = vermelha                         #com consulta aninhada
Select transacao.totaltransacao, aux_tipotransacao.metodo from finance.transacao, finance.aux_tipo transacao where transacao.idtransacao = (select tipoTransacao from aux_tipoTransacao where TipoTransacao = ‘Debito’);
#selecionando o total da transacao e o método aonde o tipo da transacao = debito 
#na tabela aux_tipotransacao

Select transacao.dataTransacao, sum(totalTransacao) from transacao 
Group by dataTransacao
Having sum(TotalTransacao) > 1000;
#vai selecionar a data da transacao e soma de Total transacao e o having vai restringir a sum #para maior que 100

Select contas.idConta, max(balancoConta) , min(balancoConta) from contas
Group by idConta
Having max(balancoConta) >500 and  min(balancoConta) > 45;

#selecionando o id conta, o max conta e o mínimo conta, utilizando o having e funções #agregadas para retornar o max de balanço conta maior que 500 e o min de balanço conta #maior que 45

