const bairro = prompt("Bairro de entrega").toLowerCase();
let taxaEntrega;
switch (bairro) {
    case "Centro":
        taxaEntrega = 5.00;
        break;
    case "Fragata":
    case "Três Vendas":
        taxaEntrega = 7.00;
        break;
    case "Larangal":
        taxaEntrega = 10.00;
        break;
    default:
        taxaEntrega = 8.00;
}
alert(`Taxa R$${taxaEntrega.toFixed(2)}`);