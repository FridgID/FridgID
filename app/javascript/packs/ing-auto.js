// variables
const selectedListDom = document.getElementById("selected");
const input = document.querySelector('input');
const ingredients = ['potato', 'cucumber', 'garlic', 'chicken', 'cheese', 'sweet potato'];
let items_to_show = [];
const autocomplete_results = document.getElementById("autocomplete-results");
const autocompleteInput = document.getElementById("autocomplete-input");

// functions
function autocomplete(val) {
  const people_return = [];

  for (let i = 0; i < ingredients.length; i++) {
    if (val === ingredients[i].slice(0, val.length)) {
      people_return.push(ingredients[i]);
    }
  }
  return people_return;
}

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
input.onkeyup = function(e) {
  const input_val = this.value;

  if (input_val.length > 0) {
    autocomplete_results.innerHTML = '';
    items_to_show = autocomplete(input_val);

    for (let i = 0; i < items_to_show.length; i++) {
      autocomplete_results.innerHTML += `<li id="item-id">` + items_to_show[i] + '</li>';
    }
    addDropDownListeners();

    autocomplete_results.style.display = 'block';
  } else {
    items_to_show = [];
    autocomplete_results.innerHTML = '';
  }
}
