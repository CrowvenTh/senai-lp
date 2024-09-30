const frm = document.querySelector("form");
const result = document.querySelector("h3");

frm.addEventListener("submit", (e) => {
    const med = frm.inMedicamento.value;
    const preco = Number(frm.inPreco.value);

    const promocao = Math.floor(preco - preco * preco);

    result.innerText = `Promoção de ${med}
                        Leve 2 por apenas R${promocao}`;
});