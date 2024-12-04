# 📚 Lógica & Banco de dados

Repositório dedicado aos conteúdos realizados durante o curso de *Lógica de programação* e de *Administrador de Banco de dados* Oferecidos pelo Serviço Nacional de Aprendizagem Industrial *(SENAI)* Taguatinga

- 📎 [Lógica de Programação](https://crowventh.github.io/senai-lp/)

- 📎 [Material Banco de Dados](https://crowventh.github.io/senai-lp/bd/Material)

---

### 🧮 lista de functions no MySQL usar o help pra entender como usar cada função.

# **1. String Functions**

### ASCII(): Retorna o código ASCII do primeiro caractere.
    SELECT ASCII('2');
    SELECT ASCII(2);
    SELECT ASCII('dx');

### BIN(): Converte um número decimal para binário.
    SELECT BIN(11);

### CHAR_LENGTH() / LENGTH(): Retorna o tamanho de uma string (em caracteres ou bytes).
    SELECT CHAR_LENGTH('senai'), LENGTH('SENAI');

### CONCAT(): Concatena strings.
    SELECT CONCAT('senai','@','123');

### CONCAT_WS(): Concatena strings com separador.
    SELECT CONCAT_WS(' ','senai','@','123');

### ELT(): Retorna a string em uma posição da lista.
    SELECT ELT(4,'A','B','C','D');

### FIELD(): Retorna a posição de uma string na lista fornecida.
    SELECT FIELD('A','A','B','C','D');

### FIND_IN_SET(): Retorna a posição de uma string dentro de uma lista separada por vírgulas.
    SELECT FIND_IN_SET('A','A,B,C,D');

### FORMAT(): Formata um número.
    SELECT FORMAT(12332.123456, 3);
    SELECT FORMAT(12332.1,4);
    SELECT FORMAT(12332.2,0);
    SELECT FORMAT(12332.2,2,'de_DE');

### INSTR(): Retorna a posição da primeira ocorrência de uma substring.
    SELECT INSTR('senai','na');

### LEFT() / RIGHT(): Retorna os primeiros ou últimos caracteres de uma string.
    SELECT LEFT('SENAI', 2), RIGHT('SENAI',2);

### LOCATE(): Similar ao INSTR(), mas permite especificar uma posição inicial.
    SELECT INSTR('SENAI SENAI','A'), LOCATE('A','SENAI SENAI',INSTR('SENAI SENAI','A')+1);

### LOWER() / UPPER(): Converte strings para minúsculas ou maiúsculas.
    SELECT LOWER('seNai') , UPPER('SeNai');

### LPAD() / RPAD(): Preenche uma string no início ou no fim.
    SELECT LPAD('Hi',10,'0'), RPAD('Hi',10,'0');

### LTRIM() / RTRIM(): Remove espaços à esquerda ou direita.
    ### TRIM(): Remove caracteres das extremidades.
    SELECT LTRIM('   NOME   '), RTRIM('   NOME   '), TRIM('   NOME   ');

### MID() / SUBSTRING(): Extrai parte de uma string.
    SELECT MID('1234-67-90',6,2), SUBSTRING('1234-67-90',6,2);

### REPLACE(): Substitui parte de uma string.
    SELECT REPLACE('SEMAI','M','N');

### REVERSE(): Inverte a string.
    SELECT REVERSE('123456789');
    SELECT REVERSE('senai');

### SPACE(): Retorna uma string de espaços.
    SELECT CONCAT('X',SPACE(50),'X');

### STRCMP(): Compara strings, retona 0 quando forem iguais.
    SELECT STRCMP('SENAI','SENAI');
    SELECT STRCMP('SENAI','SENAIEAD');

---

# **2. Numeric Functions**
### ABS(): Retorna o valor absoluto.
    SELECT ABS(-98), ABS(98);

### CEIL() / CEILING(): Arredonda para cima.
    SELECT CEIL(2.9), CEIL(2.1);

### DIV: Realiza divisão inteira.
    SELECT 10 DIV 8 , 10/8;

### FLOOR(): Arredonda para baixo.
    SELECT FLOOR(10/8), FLOOR(1.25);

### MOD(): Retorna o resto da divisão.
    SELECT MOD(3,2);

### PI(): Retorna o valor de π.
    SELECT PI();

### POW() / POWER(): Eleva um número à potência.
    SELECT POW(4,2);

### RAND(): Retorna um número aleatório.
    SELECT RAND();
    SELECT floor(RAND()*10);

### ROUND(): Arredonda um número.
    SELECT ROUND(2.5), ROUND(2.4);

### SIGN(): Retorna o sinal de um número (-1, 0, 1).
    SELECT SIGN(-8459), SIGN(0), SIGN(56);

### SQRT(): Calcula a raiz quadrada.
    SELECT SQRT(64), SQRT(9), SQRT(4);

### TRUNCATE(): Trunca um número para o número especificado de casas decimais.
    SELECT TRUNCATE(2.636,2), TRUNCATE(2.636,1), TRUNCATE(2.636,0), TRUNCATE(2.636,3);

---

 # **3. Date and Time Functions**
### ADDDATE() / DATE_ADD(): Adiciona um intervalo a uma data.
    SELECT ADDDATE(CURDATE(),5), ADDDATE(CURDATE(),-5);

### CURDATE() / CURRENT_DATE(): Retorna a data atual.
    SELECT CURDATE();

### CURTIME() / CURRENT_TIME(): Retorna a hora atual.
    SELECT CURTIME();

### DATEDIFF(): Retorna a diferença em dias entre duas datas.
    SELECT DATEDIFF('2024-12-31','2024-12-20');

### DATE_FORMAT(): Formata uma data para um formato especificado.
    SELECT DATE_FORMAT(CURDATE(),'%d/%m/%Y');
    
    ---------- Especificador ----------------
    | %Y	Ano com 4 dígitos	2024
    | %y	Ano com 2 dígitos	24
    | %m	Mês (2 dígitos)	01 a 12
    | %d	Dia do mês (2 dígitos)	01 a 31
    | %H	Hora (24h)	00 a 23
    | %i	Minutos	00 a 59
    | %s	Segundos	00 a 59
    -----------------------------------------


### DAY(), MONTH(), YEAR(): Extrai partes da data.
    SELECT DAY(CURDATE()), MONTH(CURDATE()), YEAR(CURDATE());

### DAYNAME(), MONTHNAME(): Retorna o nome do dia/mês.

- set lc_time_names=pt_BR; modificar o idioma pra pt_BR

    SELECT DAYNAME(CURDATE()), MONTHNAME(CURDATE());

### DAYOFMONTH(), DAYOFWEEK(), DAYOFYEAR(): Retorna o dia do mês/semana/ano.
    SELECT DAYOFMONTH(CURDATE()), DAYOFWEEK(CURDATE()), DAYOFYEAR(CURDATE());

### EXTRACT(): Extrai partes de uma data ou hora.
    SELECT  EXTRACT(DAY FROM CURDATE()),
		EXTRACT(MONTH FROM CURDATE()),
        EXTRACT(YEAR FROM CURDATE());

### FROM_DAYS(): Converte dias desde o ano 0 para uma data.
    SELECT FROM_DAYS(366), FROM_DAYS(367);

### HOUR(), MINUTE(), SECOND(): Extrai partes da hora.
    SELECT HOUR(NOW()), MINUTE(NOW()), SECOND(NOW()), NOW();

### LAST_DAY(): Retorna o último dia do mês.
    SELECT LAST_DAY(NOW());

### MAKEDATE(): Cria uma data com base no ano e dia do ano.
    SELECT MAKEDATE(2024,257);

### MAKETIME(): Cria um tempo com base em hora, minuto e segundo.
    SELECT MAKETIME(22,1,1);

### NOW(): Retorna a data e hora atual.
    SELECT NOW();

### STR_TO_DATE(): Converte uma string em data.
    SELECT STR_TO_DATE('21/07/1987','%d/%m/%Y');

### TIMESTAMP(): Retorna data e hora combinadas.
    SELECT TIMESTAMP('2024-12-31','00:00:00');

### WEEK(), WEEKDAY(), WEEKOFYEAR(): Funções de semana.
    SELECT WEEK(NOW());

# **4. Control Flow Functions**
### IF(): Condicional simples.

    SELECT IF('A' = 'B', 'SIM', 'NÃO');
    SELECT IF(10 >= 7, 'APROVADO', IF(10 >= 4, 'RECUPERACAO', 'REPROVADO'));
    SELECT IF(6 >= 7, 'APROVADO', IF(6 >= 4, 'RECUPERACAO', 'REPROVADO'));
    SELECT IF(2 >= 7, 'APROVADO', IF(2 >= 4, 'RECUPERACAO', 'REPROVADO'));

### CASE: Estrutura de múltiplas condições.
    SELECT CASE WHEN 10 >= 7 THEN 'SIM' ELSE 'NÃO' END ;

### IFNULL(): Substitui NULL por um valor especificado.

### NULLIF(): Retorna NULL se os valores forem iguais.

# **5. Encryption and Hashing Functions**
##### AES_ENCRYPT(), AES_DECRYPT(): Criptografia AES.
##### MD5(): Retorna o hash MD5.
##### SHA1(), SHA2(): Retorna hashes SHA.

# **6. Miscellaneous Functions**

##### VERSION(): Retorna a versão do MySQL.

##### DATABASE(): Retorna o banco de dados atual.

##### USER() / CURRENT_USER(): Retorna o usuário conectado.

##### UUID(): Gera um identificador único.alter

# **7. Aggregate Functions**
##### AVG(): Calcula a média.
##### COUNT(): Conta os registros.
##### MAX(), MIN(): Retorna o maior ou menor valor.
##### SUM(): Soma os valores.

**<p align="center">@2024</p>**