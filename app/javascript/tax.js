function tax() {
  const price = document.getElementById("item-price");
  const add = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  price.addEventListener("input",() => {
    add.textContent = price.value * 0.1
    profit.textContent = price.value * 0.9
  });
}
window.addEventListener("load", tax)