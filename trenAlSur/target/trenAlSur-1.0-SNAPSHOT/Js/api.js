// const API_URL = 'http://jsonplaceholder.typicode.com';

// const XHR = new XMLHttpRequest();

// function onRequestHandler() {
//   if (this.readyState === 4 && this.status === 200) {
//     const DATA = JSON.parse(this.response);
//     const HTTP_RESPONSE = document.querySelector("#app");

//     const TEMPLATE = DATA.map((user) => `<li>${user.name} ${user.email} <li>`);
//     HTTP_RESPONSE.innerHTML = `<ul>${TEMPLATE}<ul>`
//   }
// }

// XHR.addEventListener('load', onRequestHandler);
// XHR.open('GET', `${API_URL}/users`);
// XHR.send();

// ---------------------------

// const API_URL = 'http://jsonplaceholder.typicode.com';
// const data = null;

// const xhr = new XMLHttpRequest();

// xhr.addEventListener('readystatechange', function () {
// 	if (this.readyState === this.DONE) {
// 		console.log(this.responseText);
// 	}
// });

// xhr.open('GET', 'https://twttrapi.p.rapidapi.com/get-tweet?tweet_id=1652849795336159233');
// xhr.setRequestHeader('X-RapidAPI-Key', 'SIGN-UP-FOR-KEY');
// xhr.setRequestHeader('X-RapidAPI-Host', 'twttrapi.p.rapidapi.com');

// xhr.send(data);

// --------------------------------------------------------

// fetch("https://pokeapi.co/api/v2/pokemon/ditto")
// .then(res => res.json())
// .then(response =>{
//   console.log(response)
// })

const apiUrl = "https://rickandmortyapi.com/api/character";

async function getCharacters() {
    try {
        const response = await fetch(apiUrl);
        const {results} = await response.json();

        for(let i = 0; i < results.length; i++){
            makeCard(results[i]);
        }
    } catch (error) {
        console.error(error);
    }    
}

getCharacters();

function makeCard (character){
    const {name, status, image} = character;
    const cardsContaienr = document.querySelector(".cards-container");

    const title = document.createElement("h5");
    title.textContent = name;

    const characterStatus = document.createElement("p");
    characterStatus.textContent = status;
    if (status == "Alive") characterStatus.style.color= "green";
    else characterStatus.style.color = "gray";

    const characterImage = document.createElement("img");
    characterImage.src = image;
    characterImage.width = 200

    const card = document.createElement("div");
    card.appendChild(title);
    card.appendChild(characterImage);
    card.appendChild(characterStatus);
    card.style.backgroundColor = "blue";

    cardsContaienr.appendChild(card);



}
