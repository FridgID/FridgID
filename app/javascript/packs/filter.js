const btn = document.querySelector('.btn-filter');
const options = document.querySelector('.filter-buttons');

btn.addEventListener('click', e => {
  if (options.style.display === "block") {
    options.style.display = "none";
  } else {
    options.style.display = "block";
  }
});
