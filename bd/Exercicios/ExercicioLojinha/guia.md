# EXERCÍCIO

1. Crie um banco de dados denominado **lojinha**.

2. Dentro deste banco de dados, crie as seguintes tabelas e insira os seguintes dados:

### Cliente

| id  | nome  |
| --- | ----- |
| 01  | Ana   |
| 02  | José  |
| 03  | João  |

### EmailCliente

| id  | email | idCliente |
| --- | ----- | --------- |
| 01  | e1    | 1         |
| 02  | e2    | 1         |
| 03  | e3    | 2         |
| 04  | e4    | 2         |
| 05  | e5    | 3         |

*idCliente referencia Cliente*

### Pedido

| id  | data       | idCliente |
| --- | ---------- | --------- |
| 01  | 05/10/2015 | 1         |
| 02  | 31/12/2014 | 1         |
| 03  | 10/09/2010 | 2         |
| 04  | 14/03/2015 | 2         |
| 05  | 21/07/2014 | 2         |

*idCliente referencia Cliente*

### Produto

| id  | descricao | idCategoria | idFornecedor | estoque |
| --- | --------- | ----------- | ------------ | ------- |
| 01  | Alicate   | 1           | 1            | 10      |
| 02  | Leite     | 2           | 1            | 100     |
| 03  | Suco      | 2           | 1            | 50      |
| 04  | Camisa    | 3           | 2            | 40      |
| 05  | Calça     | 3           | 2            | 20      |

*idCategoria referencia Categoria*  
*idFornecedor referencia Fornecedor*

### Categoria

| id  | nome       |
| --- | ---------- |
| 01  | Ferramenta |
| 02  | Vestuário  |
| 03  | Alimento   |

### Fornecedor

| id  | nome |
| --- | ---- |
| 01  | F1   |
| 02  | F2   |
| 03  | F3   |

### PedidoProduto

| id  | idPedido | idProduto | quantidade |
| --- | -------- | --------- | ---------- |
| 01  | 01       | 01        | 10         |
| 02  | 01       | 02        | 20         |
| 03  | 02       | 03        | 5          |
| 04  | 03       | 04        | 10         |
| 05  | 04       | 05        | 5          |

*idPedido referencia Pedido*  
*idProduto referencia Produto*

---

#### Responda, através de SQL, as seguintes perguntas:

a) Mostre todos os clientes com seus e-mails organizados pelo nome do cliente.

b) Mostre todos os pedidos realizados entre 2010 e 2014.

c) Mostre todos os clientes que possuem pedidos entre 2015 e 2016.

d) Mostre o nome das categorias que iniciam pela letra "f", organizadas pelo nome da categoria de forma descendente, sem valores repetidos.

e) Apresente o total de produtos que são da categoria **Vestuário**.

f) Mostre o nome da categoria e o total em estoque de cada produto agrupado por categoria.

g) Mostre o nome do produto com o nome do respectivo fornecedor.

h) Para o cliente com **id=01**, mostre a data de todos os pedidos efetuados, classificados pela data do pedido.

i) Liste a descrição e a quantidade pedida de cada produto.

j) Na tabela **Produto**, insira um novo campo chamado **preco** do tipo `decimal(5,2)`. Utilize o comando `UPDATE` e atribua 10% do valor do estoque do produto para este novo campo (preco), ou seja, para estoque igual a 100, o preco deverá ser de 10.

k) Na tabela **Produto**, informe o maior valor de estoque.