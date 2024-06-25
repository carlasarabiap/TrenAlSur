// <--REGISTRATION VALIDATION-->
// const userRegister = document.querySelector("#userRegister")

// const lastName = document.querySelector("#lastName")

// const email = document.querySelector("#email")

// const usuario = document.querySelector("#usuario")

// const contraseña = document.querySelector("#contraseña")

// const fenaci = document.querySelector("#fenaci")

// const country = document.querySelector("#country")

// const btnRegistro = document.querySelector("#btnRegistro")


// btnRegistro.addEventListener("click", function (event) {
//     if (userRegister.value == "" || lastName.value == "" || email.value == "" 
//         || usuario.value == "" || contraseña.value == "" || fenaci.value == "") {
//         alert("todos los campos deben estar completos")
//     }
// });
// <--END REGISTRATION VALIDATION-->


// <--REGISTRATION VALIDATION-->

document.addEventListener("DOMContentLoaded", () => {
    const userRegister = document.querySelector("#userRegister");
    const lastName = document.querySelector("#lastName");
    const email = document.querySelector("#email");
    const usuario = document.querySelector("#usuario");
    const contraseña = document.querySelector("#contraseña");
    const fenaci = document.querySelector("#fenaci");
    const btnRegistro = document.querySelector("#btnRegistro");

    const fields = [
        { field: userRegister, name: "Nombre de usuario" },
        { field: lastName, name: "Apellido" },
        { field: email, name: "Correo electrónico" },
        { field: usuario, name: "Usuario" },
        { field: contraseña, name: "Contraseña" },
        { field: fenaci, name: "Fecha de nacimiento" },
    ];

    btnRegistro.addEventListener("click", function (event) {
        let allFieldsFilled = true;
        let errorMessage = "";

        fields.forEach(({ field, name }) => {
            if (field.value.trim() === "") {
                allFieldsFilled = false;
                errorMessage += `${name} no puede estar vacío.\n`;
            }
        });

        if (!allFieldsFilled) {
            event.preventDefault();
            alert(errorMessage);
        }
    });
});

// <--END REGISTRATION VALIDATION-->
