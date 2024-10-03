function calcular() {

    const nome = document.getElementById("inNome").value;
    const masc = document.getElementById("inMasculino").Checked;
    const alt = document.getElementById("inAltura").value;

    let peso = masc ? Math.pow(alt, 2) * 22 : Math.pow(alt, 2) * 21;
    /*
        if (masc) {
            peso = 22 * Math.pow(alt, 2);
        } else {
            peso = 21 * Math.pow(alt, 2);
        }
    */
    document.querySelector("h3").innerText = `${nome} seu Peso ideal é ${peso.toFixed(2)}Kg`;
    return false;
}
function limpar() {
    document.querySelector("h3").innerText = "";
}