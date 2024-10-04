const frm = document.querySelector("form");
const resp = document.querySelector("h3");

frm.addEventListener("submit", (e) => {

    const inHoraBr = Number(frm.horaBr.value);
    let horaFr = inHoraBr + 5;
    if (horaFr > 24) {
        horaFr = horaFr - 24;
    }
    resp.innerText = `Hora na França: ${horaFr.toFixed(2)}`;
    e.preventDefault();
});