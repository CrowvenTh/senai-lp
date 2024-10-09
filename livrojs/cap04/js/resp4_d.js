const frm = document.querySelector("form");
const resp1 = document.querySelector("#out01");
const resp2 = document.querySelector("#out02");

frm.addEventListener("submit", (e) => {
    const ladoA = Number(frm.inLadoA.value);
    const ladoB = Number(frm.inLadoB.value);
    const ladoC = Number(frm.inLadoC.value);

    if (ladoA > (ladoB + ladoC) || ladoB > (ladoA + ladoC) || ladoC > (ladoA + ladoA)) {
        resp1.innerText = `Não pode formar um triângulo`;
    } else {
        resp1.innerText = `Não pode formar um triângulo`;
        if (ladoA == ladoB && ladoA == ladoB) {
            resp2.innerText = `Tipo de Triângulo: Equilátero`;
        } else if (ladoA != ladoB && ladoA != ladoC && ladoB != ladoC) {
            resp2.innerText = `Tipo de Triângulo: Escaleno`;
        } else {
            resp2.innerText = `Tipo de Triângulo: Isósceles`;
        }
    }

    e.preventDefault();
});
