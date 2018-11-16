const btnMethod = document.getElementById('btn-method');
const btnIngrs = document.getElementById('btn-ingrs');
const pageMethodHead = document.getElementById('page-method-head');
const pageMethod = document.getElementById('page-method');
const pageIngrsHead = document.getElementById('page-ingredients-head');
const pageIngrs = document.getElementById('page-ingredients');

// events
btnMethod.addEventListener('click', (e) => {
  pageMethodHead.style.display = "block";
  pageIngrsHead.style.display = "none";
  pageMethod.style.display = "block";
  pageIngrs.style.display = "none";
});

btnIngrs.addEventListener('click', (e) => {
  pageMethodHead.style.display = "none";
  pageIngrsHead.style.display = "block";
  pageMethod.style.display = "none";
  pageIngrs.style.display = "block";
});
