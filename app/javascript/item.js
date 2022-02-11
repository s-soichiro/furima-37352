function item (){
  const price  = document.getElementById("item-price");
  price.addEventListener("keyup", () => {
    const tax  = document.getElementById('add-tax-price');
    const profit  = document.getElementById('profit');
    tax.innerHTML = `${Math.round(price.value * 0.1)}`;
    profit.innerHTML = `${Math.round(price.value * 0.9)}`;
  });
};

window.addEventListener('load', item);