// variables
const selectedListDom = document.getElementById("selected");
const input = document.querySelector('input');
let items_to_show = [];
const autocomplete_results = document.getElementById("autocomplete-results");
const autocompleteInput = document.getElementById("autocomplete-input");
const submitDiv = document.getElementById("submit-link");
const getButton = document.getElementById("get-recipes-btn");

// functions
function selectItem(item) {
  const list = document.createElement("li");
  list.innerText = item;
  list.addEventListener("click", () => {
    list.remove();
  });
  selectedListDom.insertAdjacentElement("beforeend", list);
}

function addDropDownListeners() {
  let allItems = document.querySelectorAll("#item-id");
  // console.log("all items:", allItems);
  allItems.forEach((item) => {
    item.addEventListener("click", e => {
      const item = e.target.innerText;
      selectItem(item);
      autocomplete_results.innerHTML = "";
      autocompleteInput.value = '';
    });
  });
}

function getSelectedItems() {
  const selectedItems = [];
  selectedListDom.childNodes.forEach((child) => {
    selectedItems.push(child.innerHTML);
  });
  return [...new Set(selectedItems)]; // unique even if they shouldn't be doubled anyways
}

// Unused export to global replaced by eventlistener
// window.getRecipes = getRecipes;

// events
getButton.addEventListener("click", (event) => {
  event.preventDefault(); // needed for safari and chrome or they go to the form action #
  window.location.href = `recipes/?i=${getSelectedItems().join('-')}`;
});

autocompleteInput.addEventListener("keyup", (event) => {
  // console.log("input: " + autocompleteInput.value);
  fetch(`/ingredients.json?query=${autocompleteInput.value}`)
    .then(response => response.json())
    .then((data) => {
      autocomplete_results.innerHTML = '';
      const selectedItems = getSelectedItems();
      data.forEach((ing) => {
        if (selectedItems.includes(ing)) {
          // console.log("[+] ing '" + ing + "' is selcted already");
        } else {
          // console.log("[-] ing '" + ing + "' is not selected yet")
          autocomplete_results.innerHTML += '<li id="item-id">' + ing.toUpperCase() + '</li>';
        }
      });
      addDropDownListeners();
      autocomplete_results.style.display = 'flex';
      // console.log("selected stuff: " + getSelectedItems());
    });
});

