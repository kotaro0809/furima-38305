const price = function(){
  const inputPrice = document.getElementById("item-price");

  inputPrice.addEventListener('input',function(){
   //入力した金額を取得して代入 
   const inputValue = inputPrice.value;
   const commission = document.getElementById("add-tax-price");
   const profit = document.getElementById("profit");

   commission.innerHTML = Math.floor(inputValue * 0.1);
   profit.innerHTML = Math.floor(inputValue - commission.innerHTML)

  })
}

window.addEventListener('load',price)