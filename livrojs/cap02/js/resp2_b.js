const formulario = document.querySelector("form");
const resultado = document.querySelector("h3");

formulario.addEventListener("submit", (e) =>{
    const valorPorMin = formulario.inValor.value;
    const tempoCliente = formulario.inTempo.value;

    const calc = Number(valorPorMin * Math.ceil(tempoCliente / 15));

    resultado.innerText = `Valor a pagar: R$${calc.toFixed(2)}`;

    e.preventDefault();

});