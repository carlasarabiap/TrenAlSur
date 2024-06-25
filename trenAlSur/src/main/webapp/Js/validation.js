// <--LOGIN VALIDATION-->

const username = document.querySelector("#username")

const password = document.querySelector("#password")

const btnLogin = document.querySelector("#btnSubmit")

btnLogin.addEventListener("click", function (event) {
    if (username.value == "" || password.value == "") {
        alert("Agregar usuario y contraseña")
    }
});

// <--END LOGIN VALIDATION-->

