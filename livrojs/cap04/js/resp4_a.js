const frm = document.querySelector("form");
const resultado = document.querySelector("h3");

frm.addEventListener("submit", (e) => {

    const numero = frm.inNumero.value;

    if (numero % 2 != 0) {
        resultado.innerText = `${numero} é impar`;
    } else {
        resultado.innerText = `${numero} é par`;
    }

    e.preventDefault();
});