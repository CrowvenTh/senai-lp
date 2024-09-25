// criar uma referência ao form e ao h3 (onde será exibida a resposta)

const frm = document.querySelector("form");
const resp = document.querySelector("h3");

// cria um "ouvinte" de evento, acionado quando o botão submit for acionado

frm.addEventListener("submit", (e) => {
    const nome = frm.inNome.value; // obtem o nome digitado no form 
    resp.innerText = `Olá ${nome}`; // exibe a resposta do programa 
    e.preventDefault(); //vai enviar que o formm enviou os dados prodestino.php
});