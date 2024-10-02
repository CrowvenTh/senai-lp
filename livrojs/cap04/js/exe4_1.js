const frm = document.querySelector("form");
const resp1 = document.querySelector("h3");
const resp2 = document.querySelector("h4");

frm.addEventListener("submit", (e) => {
    const nome = frm.inNome.value;
    const n1 = Number(frm.inN1.value);
    const n2 = Number(frm.inN2.value);

    const mediaAluno = (n1 + n2) / 2;
    resp1.innerText = `Média das Notas: ${mediaAluno.toFixed(2)}`;

    if (mediaAluno >= 7.0) {
        resp2.innerText = `Parabéns ${nome}! Você foi aprovado(a)`;
    } else {
        resp2.innerText = `Ops ${nome}, Você foi reprovado(a)`;
    }
    e.preventDefault();
});
