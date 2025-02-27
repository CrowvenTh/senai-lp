import requests # pip install request 
import mysql.connector # pip install mysql-connector-python 

# função para conectar o banco de dados
def bancoDB(sql):
    conexao = mysql.connector.connect(
        host = 'localhost',
        database = 'etl_ibge',
        user = 'root',
        password = '',
        port = 3307
    )
    cursor = conexao.cursor()
    cursor.execute(sql)
    conexao.commit()
    cursor.close()
    conexao.close()
# Endereço de onde vamos acessar

url1 = 'https://servicodados.ibge.gov.br/api/v1/localidades/regioes'

url2 = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados'

url3 = 'https://servicodados.ibge.gov.br/api/v1/localidades/municipios'

# Execução de requisição
response1 = requests.get(url1)

response2 = requests.get(url2)

response3 = requests.get(url3)

# Mostrar o retorno 
obj1 = response1.json()
lista1 = obj1

obj2 = response2.json()
lista2 = obj2

obj3 = response3.json()
lista3 = obj3

# loop para mostrar todos os itens
i = 0
# while i < len(lista1):
#     id = lista1[i]['id']
#     sigla = lista1[i]['sigla']
#     nome = lista1[i]['nome']
#     sql = f"INSERT INTO regiao(id_regiao, sigla, nome) VALUES ('{id}', '{sigla}', '{nome}');"

#     bancoDB(sql)
#     i += 1

# while i < len(lista2):
#     id = lista2[i]['id']
#     sigla = lista2[i]['sigla']
#     nome = lista2[i]['nome']
#     regiao = lista2[i]['regiao']['id']
#     sql = f"INSERT INTO estado(id_estado, sigla, nome, id_regiao) VALUES ('{id}','{sigla}','{nome}','{regiao}' );"

#     bancoDB(sql)
#     i += 1

while i < len(lista3):
    id = lista3[i]['id']
    nome = lista3[i]['nome'].replace("'",",")
    id_regiao = lista3[i]['microrregiao']['mesorregiao']['UF']['regiao']['id']
    id_estado = lista3[i]['microrregiao']['mesorregiao']['UF']['id']
    sql = f"INSERT INTO municipio (id_municipio, nome, id_regiao, id_estado) VALUES ({id}, '{nome}',{id_regiao}, {id_estado});"

    #print(sql)
    bancoDB(sql)
    i += 1
