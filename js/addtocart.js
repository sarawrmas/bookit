const shoppingCartItems = [];

document.addEventListener("click", function(event) {
  if (event.target.className == "addToCart") {
    const productId = event.target.id;
    shoppingCartItems.push(productId);
    console.log(shoppingCartItems);
    const productButton = document.getElementById(productId);
    productButton.innerHTML = "Added!";
    productButton.disabled = true;
  }
  else if (event.target.className == 'cartMenu') {
    window.location.href='../cart.php';
    console.log(shoppingCartItems);
  }
});