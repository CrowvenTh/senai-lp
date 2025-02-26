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
url = 'https://servicodados.ibge.gov.br/api/v1/localidades/regioes'

# Execução de requisição
response = requests.get(url)

# Mostrar o retorno 
obj = response.json()
lista = obj

# loop para mostrar todos os itens
i = 0
while i < len(lista):
    id = lista[i]['id']
    sigla = lista[i]['sigla']
    nome = lista[i]['nome']
    sql = f"INSERT INTO regiao(id_regiao, sigla, nome) VALUES ('{id}', '{sigla}', '{nome}');"

    bancoDB(sql)
    i += 1