const buttonElement = document.querySelectorAll(".dropdown-menu__button");
buttonElement.forEach((button) =>
  button.addEventListener("click", function (event) {
    document.querySelectorAll(".header__menu-item").forEach((item) => {
      if (item.querySelector(".dropdown-menu__button") !== button) {
        item.classList.remove("dropdown-menu__open");
      }
    });
    event.isClick = true;
    button.parentElement.classList.toggle("dropdown-menu__open");
    let;
  })
);
document.body.addEventListener("click", function (event) {
  if (
    event._isClick == true ||
    event.target.classList.contains("dropdown-menu__button") == true ||
    event.target.classList.contains("dropdown-menu__list") == true
  )
    return;
  document
    .querySelectorAll(".header__menu-item")
    .forEach((item) => item.classList.remove("dropdown-menu__open"));
});
