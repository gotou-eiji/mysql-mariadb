create database loja;
use loja;

create table loja(
codloja int not null auto_increment,
nomeloja varchar(45),
primary key(codloja));

create table fornecedor(
codfornecedor int not null auto_increment,
nomefornecedor varchar(45),
primary key(codfornecedor));

create table transportadora(
codtransportadora int not null auto_increment,
nometransportadora varchar(45),
primary key(codtransportadora));

create table categoria(
codcategoria int not null auto_increment,
categoria varchar(70),
primary key(codcategoria));

create table produto(
codproduto int not null auto_increment,
descricao varchar(45),
peso double,
controlado varchar(45),
qtdemin double,
fornecedor_codfornecedor int,
categoria_codcategoria int,
primary key (codproduto),
foreign key(fornecedor_codfornecedor) references fornecedor(codfornecedor),
foreign key (categoria_codcategoria) references categoria(codcategoria));

create table saida(
codsaida int not null auto_increment,
total varchar(45),
frete double,
imposto varchar(45),
loja_codloja int,
transportadora_codtransportadora int,
primary key (codsaida),
foreign key(loja_codloja) references loja(codloja),
foreign key (transportadora_codtransportadora) references transportadora(codtransportadora));

create table entrada(
codentrada int not null auto_increment,
dataped date,
dataentr date,
total varchar(45),
frete double,
num_nf int,
imposto varchar(45),
transportadora_codtransportadora int,
primary key(codentrada),
foreign key(transportadora_codtransportadora) references transportadora(codtransportadora));

create table itemsaida(
coditemsaida int not null auto_increment,
lote varchar(45),
qtde int,
valor double,
produto_codproduto int,
saida_codsaida int,
primary key(coditemsaida),
foreign key(produto_codproduto) references produto(codproduto),
foreign key(saida_codsaida) references saida(codsaida));

create table itementrada(
coditementrada int not null auto_increment,
lote varchar(45),
qtde int,
valor float,
produto_codproduto int,
entrada_codentrada int,
primary key(coditementrada),
foreign key(produto_codproduto) references produto(codproduto),
foreign key(entrada_codentrada) references entrada(codentrada));

describe loja;
insert into loja (nomeloja)
values
("do zé"),
("pernambucanas"),
("casas bahia"),
("renner"),
("cacau show");
