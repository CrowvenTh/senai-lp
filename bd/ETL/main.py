import requests

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
    print(f"{titulo} - {descricao}")
    i += 1

# Instalando o request, executar no CMD ou no shell dentro dessa pasta 
# pip install request 
# pip install myqsl-connector-python