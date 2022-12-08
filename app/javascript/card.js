const pay = () => {
  Payjp.setPublicKey("pk_test_45f6a3d5de5c10ab8ee7bf89"); // PAY.JPテスト公開鍵
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("purchase_records_destination[number]"),
      exp_month: formData.get("purchase_records_destination[exp_month]"),
      exp_year: `20${formData.get("purchase_records_destination[exp_year]")}`,
      cvc: formData.get("purchase_records_destination[cvc]"),
    };


    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        debugger;
      }

      document.getElementById("order_number").removeAttribute("name");
      document.getElementById("order_cvc").removeAttribute("name");
      document.getElementById("order_exp_month").removeAttribute("name");
      document.getElementById("order_exp_year").removeAttribute("name");

      document.getElementById("charge-form").submit();

    });

  });
};

window.addEventListener("load", pay);