// メニュー操作

function addToggleListener(selected_id, menu_id, toggle_class) {
  let selected_element = document.querySelector(`#${selected_id}`);
  if (!selected_element) return;

  selected_element.addEventListener("click", function(event) {
    event.preventDefault();
    let menu = document.querySelector(`#${menu_id}`);
    if (!menu) return;

    menu.classList.toggle(toggle_class);
  });
}

document.addEventListener("turbo:load", function() {
  // ハンバーガー：show を切り替える
  addToggleListener("hamburger", "navbar-menu", "show");

  // アカウントドロップダウン
  addToggleListener("account", "dropdown-menu", "active");
});
