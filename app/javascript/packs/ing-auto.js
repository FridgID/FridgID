// variables
const selectedListDom = document.getElementById("selected");
const input = document.querySelector('input');
let items_to_show = [];
const autocomplete_results = document.getElementById("autocomplete-results");
const autocompleteInput = document.getElementById("autocomplete-input");

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
      // console.log("clicked list event: ", item);
      selectItem(item);
      autocomplete_results.innerHTML = "";
      autocompleteInput.value = '';
    });
  });
}

// events
autocompleteInput.addEventListener("keyup", (event) => {
  // console.log("input: " + autocompleteInput.value);
  fetch(`http://localhost:3000/ingredients.json?query=${autocompleteInput.value}`)
    .then(response => response.json())
    .then((data) => {
      // console.log(data)
      autocomplete_results.innerHTML = '';
      data.forEach((ing) => {
        console.log("ingredient: "+ ing);
        autocomplete_results.innerHTML += '<li id="item-id">' + ing + '</li>';
      });
      addDropDownListeners();
      autocomplete_results.style.display = 'block';
    });
});

