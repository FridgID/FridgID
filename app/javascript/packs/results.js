const content = document.getElementById('content');
const btnMethod = document.getElementById('btn-method');
const btnIngrs = document.getElementById('btn-ingrs');
const recipe = document.getElementById('recipe-data');

// helpers
function getIngrs() {
  return recipe.dataset.ingredients.split('-');
}

// funcs
function renderMethod() {
  content.innerText = `
ADD ALL THE HTML HERE
title: ${recipe.dataset.title}
  `;
}

function renderIngrs() {
  content.innerText = `
ADD ALL THE HTML HERE
ingrs: ${getIngrs()}
  `;
}

// events
btnMethod.addEventListener('click', (e) => {
  renderMethod();
});

btnIngrs.addEventListener('click', (e) => {
  renderIngrs();
});
