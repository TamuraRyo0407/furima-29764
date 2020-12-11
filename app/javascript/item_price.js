window.addEventListener("load", () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue / 10) 
    const addTaxINT = Math.floor(inputValue / 10) 
    const profitValue = document.getElementById("profit");
    profitValue.innerHTML = (inputValue - addTaxINT)
})

});



