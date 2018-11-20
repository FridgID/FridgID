const autoInput = document.getElementById('autocomplete-results');
const chsnIngred = document.getElementById('chosen-ingred');



// events
autoInput.addEventListener('click', (e) => {
  chsnIngred.style.display = "flex";
});
