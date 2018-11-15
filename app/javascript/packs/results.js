const btnMethod = document.getElementById('btn-method');
const btnIngrs = document.getElementById('btn-ingrs');
const pageMethod = document.getElementById('page-method');
const pageIngrs = document.getElementById('page-ingredients');

// events
btnMethod.addEventListener('click', (e) => {
  pageMethod.style.display = "block";
  pageIngrs.style.display = "none";
});

btnIngrs.addEventListener('click', (e) => {
  pageMethod.style.display = "none";
  pageIngrs.style.display = "block";
});
