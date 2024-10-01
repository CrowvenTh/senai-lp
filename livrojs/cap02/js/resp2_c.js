const frm = document.querySelector("form");
const resp = document.querySelector("h3");

frm.addEventListener("submit", (e)=>{
    const produto = frm.inProduto.value;
    const preco = frm.inPreco.value;

    const itemPromocao = preco - preco * 0.5;
    const promocao = preco * 3 - itemPromocao;

    resp.innerText = `${produto} - Promoção: Leve 3 por R$${promocao.toFixed(2)}
                        O 3° produto custa apenas R$${itemPromocao.toFixed(2)}`;

    e.preventDefault();
});