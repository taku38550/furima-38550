window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price");
  if (!priceInput){ return false;}
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1);

    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = Math.floor(priceInput.value - Math.round(priceInput.value * 0.1))
  })

});

