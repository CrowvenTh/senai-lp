# 📚 Lógica & Banco de dados

Repositório dedicado aos conteúdos realizados durante o curso de *Lógica de programação* e de *Administrador de Banco de dados* Oferecidos pelo Serviço Nacional de Aprendizagem Industrial *(SENAI)* Taguatinga

- 📎 [Lógica de Programação](https://crowventh.github.io/senai-lp/)

- 📎 [Material Banco de Dados](https://crowventh.github.io/senai-lp/bd/Material)

--- 

<details>
<summary> Estrutura </summary>

    SENAI-LP/ A pasta SENAI-LP é a raiz de todos os projetos desse curso 
    ├── bd
    |  ├── brModelo
    |  │   ├── 
    |  ├── Diagramas
    |  │   ├── 
    |  ├── Exercicios
    |  │   ├── 
    |  ├── Material
    |  │   ├── 
    |  ├── Rotinas
    |  │   ├── 
    |     
    ├── livroJs
    |  ├── cap01
    |  ├── cap02
    |  ├── cap04
    |  ├── cap05
    |  ├── projeto2
    |  ├── ComandoGIT.md
    |  ├── Ebook.pdf
    |  ├── comandosCMD.md
    |  
    ├── index.css
    ├── index.html
    ├── indexII.html
    ├── README.md
    
</details>

## 🧮 lista de functions no MySQL usar o help pra entender como usar cada função.

# **1. String Functions**

#### ASCII(): Retorna o código ASCII do primeiro caractere.
``` sql
SELECT ASCII('2');
SELECT ASCII(2);
SELECT ASCII('dx');
```

#### BIN(): Converte um número decimal para binário.
``` sql
SELECT BIN(11);
```

#### CHAR_LENGTH() / LENGTH(): Retorna o tamanho de uma string (em caracteres ou bytes).
``` sql
SELECT CHAR_LENGTH('senai'), LENGTH('SENAI');
```

#### CONCAT(): Concatena strings.
``` sql
SELECT CONCAT('senai','@','123');
```

#### CONCAT_WS(): Concatena strings com separador.
``` sql
SELECT CONCAT_WS(' ','senai','@','123');
```

#### ELT(): Retorna a string em uma posição da lista.
``` sql
SELECT ELT(4,'A','B','C','D');
```

#### FIELD(): Retorna a posição de uma string na lista fornecida.
``` sql
SELECT FIELD('A','A','B','C','D');
```

#### FIND_IN_SET(): Retorna a posição de uma string dentro de uma lista separada por vírgulas.
``` sql
SELECT FIND_IN_SET('A','A,B,C,D');
```

#### FORMAT(): Formata um número.
``` sql
SELECT FORMAT(12332.123456, 3);
SELECT FORMAT(12332.1,4);
SELECT FORMAT(12332.2,0);
SELECT FORMAT(12332.2,2,'de_DE');
```

#### INSTR(): Retorna a posição da primeira ocorrência de uma substring.
``` sql
SELECT INSTR('senai','na');
```

#### LEFT() / RIGHT(): Retorna os primeiros ou últimos caracteres de uma string.
``` sql
SELECT LEFT('SENAI', 2), RIGHT('SENAI',2);
```

#### LOCATE(): Similar ao INSTR(), mas permite especificar uma posição inicial.
``` sql
SELECT INSTR('SENAI SENAI','A'), LOCATE('A','SENAI SENAI',INSTR('SENAI SENAI','A')+1);
```

#### LOWER() / UPPER(): Converte strings para minúsculas ou maiúsculas.
``` sql
SELECT LOWER('seNai') , UPPER('SeNai');
```

#### LPAD() / RPAD(): Preenche uma string no início ou no fim.
``` sql
SELECT LPAD('Hi',10,'0'), RPAD('Hi',10,'0');
```

#### LTRIM() / RTRIM(): Remove espaços à esquerda ou direita.

#### TRIM(): Remove caracteres das extremidades.
``` sql
SELECT LTRIM('   NOME   '), RTRIM('   NOME   '), TRIM('   NOME   ');
```

#### MID() / SUBSTRING(): Extrai parte de uma string.
``` sql
SELECT MID('1234-67-90',6,2), SUBSTRING('1234-67-90',6,2);
```

#### REPLACE(): Substitui parte de uma string.
``` sql
SELECT REPLACE('SEMAI','M','N');
```

#### REVERSE(): Inverte a string.
``` sql
SELECT REVERSE('123456789');
SELECT REVERSE('senai');
```

#### SPACE(): Retorna uma string de espaços.
``` sql
SELECT CONCAT('X',SPACE(50),'X');
```

#### STRCMP(): Compara strings, retona 0 quando forem iguais.
``` sql
SELECT STRCMP('SENAI','SENAI');
SELECT STRCMP('SENAI','SENAIEAD');
```
---

# **2. Numeric Functions**
#### ABS(): Retorna o valor absoluto.
``` sql
SELECT ABS(-98), ABS(98);
```

#### CEIL() / CEILING(): Arredonda para cima.
``` sql
SELECT CEIL(2.9), CEIL(2.1);
```

#### DIV: Realiza divisão inteira.
``` sql
SELECT 10 DIV 8 , 10/8;
```

#### FLOOR(): Arredonda para baixo.
``` sql
SELECT FLOOR(10/8), FLOOR(1.25);
```

#### MOD(): Retorna o resto da divisão.
``` sql
SELECT MOD(3,2);
```

#### PI(): Retorna o valor de π.
``` sql
SELECT PI();
```

#### POW() / POWER(): Eleva um número à potência.
``` sql
SELECT POW(4,2);
```

#### RAND(): Retorna um número aleatório.
``` sql
SELECT RAND();
SELECT floor(RAND()*10);
```

#### ROUND(): Arredonda um número.
``` sql
SELECT ROUND(2.5), ROUND(2.4);
```

#### SIGN(): Retorna o sinal de um número (-1, 0, 1).
``` sql
SELECT SIGN(-8459), SIGN(0), SIGN(56);
```

#### SQRT(): Calcula a raiz quadrada.
``` sql
SELECT SQRT(64), SQRT(9), SQRT(4);
```

#### TRUNCATE(): Trunca um número para o número especificado de casas decimais.
``` sql
SELECT TRUNCATE(2.636,2), TRUNCATE(2.636,1), TRUNCATE(2.636,0), TRUNCATE(2.636,3);
```
---

 # **3. Date and Time Functions**
#### ADDDATE() / DATE_ADD(): Adiciona um intervalo a uma data.
``` sql
SELECT ADDDATE(CURDATE(),5), ADDDATE(CURDATE(),-5);
```

#### CURDATE() / CURRENT_DATE(): Retorna a data atual.
``` sql
SELECT CURDATE();
```

#### CURTIME() / CURRENT_TIME(): Retorna a hora atual.
``` sql
SELECT CURTIME();
```

#### DATEDIFF(): Retorna a diferença em dias entre duas datas.
``` sql
SELECT DATEDIFF('2024-12-31','2024-12-20');
```

#### DATE_FORMAT(): Formata uma data para um formato especificado.
``` sql
SELECT DATE_FORMAT(CURDATE(),'%d/%m/%Y');
```
    ---------- Especificador ----------------
    | %Y	Ano com 4 dígitos	2024
    | %y	Ano com 2 dígitos	24
    | %m	Mês (2 dígitos)	01 a 12
    | %d	Dia do mês (2 dígitos)	01 a 31
    | %H	Hora (24h)	00 a 23
    | %i	Minutos	00 a 59
    | %s	Segundos	00 a 59
    -----------------------------------------

#### DAY(), MONTH(), YEAR(): Extrai partes da data.
``` sql
SELECT DAY(CURDATE()), MONTH(CURDATE()), YEAR(CURDATE());
```

#### DAYNAME(), MONTHNAME(): Retorna o nome do dia/mês.
``` sql
set lc_time_names=pt_BR; modificar o idioma pra pt_BR

SELECT DAYNAME(CURDATE()), MONTHNAME(CURDATE());
```

#### DAYOFMONTH(), DAYOFWEEK(), DAYOFYEAR(): Retorna o dia do mês/semana/ano.
``` sql
SELECT DAYOFMONTH(CURDATE()), DAYOFWEEK(CURDATE()), DAYOFYEAR(CURDATE());
```

#### EXTRACT(): Extrai partes de uma data ou hora.
``` sql
SELECT  
EXTRACT(DAY FROM CURDATE()),
EXTRACT(MONTH FROM CURDATE()),
EXTRACT(YEAR FROM CURDATE());
```

#### FROM_DAYS(): Converte dias desde o ano 0 para uma data.
``` sql
SELECT FROM_DAYS(366), FROM_DAYS(367);
```

#### HOUR(), MINUTE(), SECOND(): Extrai partes da hora.
``` sql
SELECT HOUR(NOW()), MINUTE(NOW()), SECOND(NOW()), NOW();
```

#### LAST_DAY(): Retorna o último dia do mês.
``` sql
SELECT LAST_DAY(NOW());
```

#### MAKEDATE(): Cria uma data com base no ano e dia do ano.
``` sql
SELECT MAKEDATE(2024,257);
```

#### MAKETIME(): Cria um tempo com base em hora, minuto e segundo.
``` sql
SELECT MAKETIME(22,1,1);
```

#### NOW(): Retorna a data e hora atual.
``` sql
SELECT NOW();
```

#### STR_TO_DATE(): Converte uma string em data.
``` sql
SELECT STR_TO_DATE('21/07/1987','%d/%m/%Y');
```

#### TIMESTAMP(): Retorna data e hora combinadas.
``` sql
SELECT TIMESTAMP('2024-12-31','00:00:00');
```

#### WEEK(), WEEKDAY(), WEEKOFYEAR(): Funções de semana.
``` sql
SELECT WEEK(NOW());
```

# **4. Control Flow Functions**
#### IF(): Condicional simples.
``` sql
SELECT IF('A' = 'B', 'SIM', 'NÃO');
SELECT IF(10 >= 7, 'APROVADO', IF(10 >= 4, 'RECUPERACAO', 'REPROVADO'));
SELECT IF(6 >= 7, 'APROVADO', IF(6 >= 4, 'RECUPERACAO', 'REPROVADO'));
SELECT IF(2 >= 7, 'APROVADO', IF(2 >= 4, 'RECUPERACAO', 'REPROVADO'));
```

#### CASE: Estrutura de múltiplas condições.
``` sql
SELECT CASE WHEN 10 >= 7 THEN 'SIM' ELSE 'NÃO' END ;
```

#### IFNULL(): Substitui NULL por um valor especificado.
``` sql
SELECT IFNULL(NULL,0), IFNULL(NULL,'X1');
```
#### NULLIF(): Retorna NULL se os valores forem iguais.
``` sql
SELECT NULLIF('A1','A0'), NULLIF('A','A');
```

---

# **5. Encryption and Hashing Functions**
#### MD5(): Retorna o hash MD5.
``` sql
SELECT MD5('123456');
``` 

#### SHA1(), SHA2(): Retorna hashes SHA.
``` sql
SELECT SHA1('abc');
SELECT SHA2('abc', 224); -- 23097d223405d8228642a477bda255b32aadbce4bda0b3f7e36c9da7
SELECT SHA2('abc', 256); -- ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad
SELECT SHA2('abc', 512); -- ddaf35a193617abacc417349ae20413112e6fa4e89a97ea20a9eeee64b55d39a2192992a274fc1a836ba3c23a3feebbd454d4423643ce80e2a9ac94fa54ca49f
``` 

#### AES_ENCRYPT(), AES_DECRYPT(): Criptografia AES.
``` sql
SET block_encryption_mode = 'aes-256-cbc';
SET @key_str = SHA2('fase secreta',512);
SET @init_vector = RANDOM_BYTES(16);
SET @crypt_str = AES_ENCRYPT('texto para criptografar',@key_str,@init_vector);
SELECT CAST(AES_DECRYPT(@crypt_str,@key_str,@init_vector) AS CHAR);
```

---

# **6. Miscellaneous Functions**
#### VERSION(): Retorna a versão do MySQL.
``` sql
SELECT VERSION();
``` 

#### DATABASE(): Retorna o banco de dados atual.
``` sql
SELECT DATABASE();
``` 

#### USER() / CURRENT_USER(): Retorna o usuário conectado.
``` sql
SELECT USER(), CURRENT_USER();
``` 

#### UUID(): Gera um identificador único aleatorio
``` sql
SELECT UUID();
``` 

---

# **6. Miscellaneous Functions**
#### VERSION(): Retorna a versão do MySQL.
``` sql
SELECT VERSION();
``` 
#### DATABASE(): Retorna o banco de dados atual.
``` sql
SELECT DATABASE();
``` 

#### USER() / CURRENT_USER(): Retorna o usuário conectado.
``` sql
SELECT USER(), CURRENT_USER();
``` 
#### UUID(): Gera um identificador único aleatorio
``` sql
SELECT UUID();
```

# **7. Aggregate Functions**
#### AVG(): Calcula a média.
``` sql
SELECT AVG(VALOR) FROM PAGAMENTO;
```

#### COUNT(): Conta os registros.
``` sql
SELECT COUNT(*) FROM PAGAMENTO;
``` 

#### MAX(), MIN(): Retorna o maior ou menor valor.
``` sql
SELECT MAX(VALOR), MIN(VALOR) FROM PAGAMENTO;
``` 

#### SUM(): Soma os valores.
``` sql
SELECT SUM(VALOR) FROM PAGAMENTO;
```

#### GROUP_CONCAT(); Concatena valores de uma coluna em um único resultado, separados por uma vírgula (ou outro delimitador definido).
``` sql
SELECT P.PAIS, GROUP_CONCAT(C.CIDADE) CIDADES, COUNT(*) QT FROM PAIS AS P 
INNER JOIN CIDADE AS C ON P.PAIS_ID = C.PAIS_ID
GROUP BY P.PAIS;
``` 
<br>

**<p align="center">@2024</p>**