//Unused and unfinished scraper

// needs npm install request
var request = require('request');

var ingr = {
  name: "banana",
  from_month: "January",
  to_month: "October"
};

console.log(JSON.stringify(ingr, null, 2));


request("https://www.jamieoliver.com/recipes/category/ingredient/", function(error, response, body) {
  if(error) {
    console.log("Error: " + error);
  }
  console.log("Status code: " + response.statusCode);

  console.log(body);
  /*
  body.querySelectorAll('.recipe-title').forEach((r) => {
    console.log("title: " + r.innerText);
  });
  */
});
