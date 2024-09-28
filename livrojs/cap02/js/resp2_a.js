const frm = document.querySelector("form");
const resp = document.querySelector("h3");

frm.addEventListener("submit", (e) => {
    const med = frm.inMedicamento.value;
    const preco = frm.inPreco.value;

    const promocao = Math.floor(preco - preco * centavos);
    const centavos = promocao % preco;

    resp.innerText = `Promoção de ${med} \nLeve 2 por apenas R$${promocao}`;

    e.preventDefault();

});
