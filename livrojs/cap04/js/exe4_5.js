const frm = document.querySelector("form");
const resp = document.querySelector("h3");

frm.addEventListener("submit", (e) => {
    const numero = Number(frm.inNumero.value);
    const raiz = Math.sqrt(numero);
    if(Number.isInteger(raiz)){
        resp.innerText = `A raiz quadrada do número ${numero} é ${raiz}`;
    } else {
        resp.innerText = `O número não tem raiz exata`;
    }

    e.preventDefault();
});