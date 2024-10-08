const frm = document.querySelector("form");
const result = document.querySelector("h3");

frm.addEventListener("submit", (e) => {

    const velPer = Number(frm.inPermitida.value);
    const velCon = Number(frm.inCondutor.value);

    if (velCon < velPer) {
        result.innerText = `Situação: Sem Multa`;
    } else if (velCon > velPer && velCon < velPer + (velPer * 0.20)) {
        result.innerText = `Situação: Multa Leve`;
    } else {
        result.innerText = `Situação: Multa Grave`;
    }

    e.preventDefault();
});