const frm = document.querySelector("form");
const resp = document.querySelector("h3")

frm.addEventListener("submit", (e) => {
    const numero = frm.inNumero.value;

    for (let i = 0; i <= 10; i++) {
        document.write = `${i}<br>`;
    }
    e.preventDefault();
});