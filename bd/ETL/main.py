import requests
import mysql.connector # pip install mysql-connnector-python

# função para conectar o banco de dados
def banco(sql):
    conexao = mysql.connector.connect(
        host = 'localhost',
        database = 'pizzaria',
        user = 'root',
        password = '', # como o banco esta rodandon no xampp, remove-se a senha e usa a porta indicada
        port = 3307
    )
    cursor = conexao.cursor()
    cursor.execute(sql)
    conexao.commit()
    cursor.close()
    conexao.close()

# Endereço de onde vamos acessar
url = 'https://api.anota.ai/clientauth/nm-category/menu-merchant?displaySources=DIGITAL_MENU'
# token de autorização
headers = {
    'Authorization':'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZHBhZ2UiOiI2NGY4ZTUwZGRlYTRkNDAwMTI2OTlmMzMiLCJpYXQiOjE3NDA0MzY1MzF9.AzralM0PDiP-7pWR-jIs3r_x_R02XtA04RVn1zzHzfc'
}
# Execução de requisição
response = requests.get(url, headers=headers)

# Mostrar o retorno 
obj = response.json()
lista = obj['data']['menu']['menu'][1]['itens']
# loop para mostrar todos os itens
i = 0
while i < len(lista):
    titulo = lista[i]['title']
    descricao = lista[i]['description']
    preco = lista[i]['price']
    # print(f"{titulo} - {descricao}")
    # sql = f"INSERT INTO pizza(sabor, ingredientes) VALUES('{titulo}', '{descricao}');"
    sql = f"UPDATE pizza SET preco = '{preco}' where sabor = '{titulo}';"

    banco(sql)
    i += 1

# Instalando o request, executar no CMD ou no shell dentro dessa pasta 
# pip install request 
# pip install mysql-connector-python 