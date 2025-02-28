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

i = 0
def InsertRegiao():
    # Endereço de onde vamos acessar
    url = 'https://servicodados.ibge.gov.br/api/v1/localidades/regioes'
    # Execução de requisição
    response = requests.get(url)
    # Mostrar o retorno 
    obj = response.json()
    lista = obj
    # loop para mostrar todos os itens
    while i < len(lista):
        id = lista[i]['id']
        sigla = lista[i]['sigla']
        nome = lista[i]['nome']
        sql = f"INSERT INTO regiao(id_regiao, sigla, nome) VALUES ('{id}', '{sigla}', '{nome}');"
        bancoDB(sql)
        i += 1
        
def InsertEstado():
    url = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados'
    response = requests.get(url)
    obj = response.json()
    lista = obj
    while i < len(lista):
        id = lista[i]['id']
        sigla = lista[i]['sigla']
        nome = lista[i]['nome']
        regiao = lista[i]['regiao']['id']
        sql = f"INSERT INTO estado(id_estado, sigla, nome, id_regiao) VALUES ('{id}','{sigla}','{nome}','{regiao}' );"
        bancoDB(sql)
        i += 1


def InsertMunicipio():
    url = 'https://servicodados.ibge.gov.br/api/v1/localidades/municipios'
    response = requests.get(url)
    obj = response.json()
    lista = obj
    while i < len(lista):
        id = lista[i]['id']
        nome = lista[i]['nome'].replace("'",",")
        id_regiao = lista[i]['microrregiao']['mesorregiao']['UF']['regiao']['id']
        id_estado = lista[i]['microrregiao']['mesorregiao']['UF']['id']
        sql = f"INSERT INTO municipio (id_municipio, nome, id_regiao, id_estado) VALUES ({id}, '{nome}',{id_regiao}, {id_estado});"
        bancoDB(sql)
        i += 1

InsertRegiao()
InsertEstado()
InsertMunicipio()