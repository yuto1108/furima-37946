function tax_price() {
  const commission = document.getElementById("item-price")
  commission.addEventListener("keyup",() => {
    const tax = commission.value * 0.1;
    const tax_true = Math.floor(tax)
    const tax_price = document.getElementById("add-tax-price");
    tax_price.innerHTML = tax_true;
    const price_content = commission.value - tax_true;
    const profit = document.getElementById("profit");
    profit.innerHTML = price_content;
  })
}
window.addEventListener("load",tax_price)