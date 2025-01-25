const buttonElement = document.querySelectorAll(".dropdown-menu__button");
buttonElement.forEach((button) =>
  button.addEventListener("click", function (event) {
    document.querySelectorAll(".header__menu-item").forEach((item) => {
      if (item.querySelector(".dropdown-menu__button") !== button) {
        item.classList.remove("dropdown-menu__open");
        if (
          item.lastElementChild.classList.contains("dropdown-menu__list") ==
          true
        ) {
          item.lastElementChild.style.position = "absolute";
        }
      }
    });
    event.isClick = true;
    button.parentElement.classList.toggle("dropdown-menu__open");
    const dropdownList = button.nextElementSibling;
    if (
      button.classList.contains("mobile-dropdown__button") == true &&
      button.parentElement.classList.contains("dropdown-menu__open")
    ) {
      dropdownList.style.position = "relative";
    } else {
      dropdownList.style.position = "absolute";
    }
  })
);
document.body.addEventListener("click", function (event) {
  if (
    event._isClick == true ||
    event.target.classList.contains("dropdown-menu__button") == true ||
    event.target.classList.contains("mobile-overlay") == true ||
    event.target.classList.contains("mobile-overlay__list") == true ||
    event.target.classList.contains("button__burger-button") == true
  ) {
    return;
  }
  document
    .querySelectorAll(".header__menu-item")
    .forEach((item) => item.classList.remove("dropdown-menu__open"));

  document.querySelectorAll(".dropdown-menu__list").forEach((list) => {
    list.style.position = "absolute";
  });
});
