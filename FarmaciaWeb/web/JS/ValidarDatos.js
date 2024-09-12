const formulario = document.getElementById('formulario');
const inputs = document.querySelectorAll('#formulario input');

const expresiones = {
    identificacion: /^\d{7,10}$/,
    correo: /^[^\s@]+@[^\s@]+\.[^\s@]+$/,
    nombre: /^[a-zA-Z\s]{3,40}$/,
    apellido: /^[a-zA-Z\s]{3,40}$/,
    direccion: /^[a-zA-Z0-9\-\_\#\s]{4,40}$/,
    telefono: /^[0-9]{10}$/,
    usuario: /^[a-zA-Z0-9]{4,20}$/,
    contrasena: /^[a-zA-Z0-9]{6,20}$/
};

const campos = {
    identificacion: false,
    correo: false,
    nombre: false,
    apellido: false,
    direccion: false,
    telefono: false,
    usuario: false,
    contrasena: false,
    contrasena2: false
};

const validarFormulario = (e) => {
    switch (e.target.name) {
        case "id":
            validarCampo(expresiones.identificacion, e.target, 'identificacion');
            break;
        case "email": // Cambiado de 'correo' a 'email'
            validarCampo(expresiones.correo, e.target, 'correo');
            break;
        case "nombre":
            validarCampo(expresiones.nombre, e.target, 'nombre');
            break;
        case "apellido":
            validarCampo(expresiones.apellido, e.target, 'apellido');
            break;
        case "direccion":
            validarCampo(expresiones.direccion, e.target, 'direccion');
            break;
        case "telefono":
            validarCampo(expresiones.telefono, e.target, 'telefono');
            break;
        case "usuario":
            validarCampo(expresiones.usuario, e.target, 'usuario');
            break;
        case "contrasena":
            validarCampo(expresiones.contrasena, e.target, 'contrasena');
            validarContrasena2();
            break;
        case "contrasena2":
            validarContrasena2();
            break;
    }
};

const validarCampo = (expresion, input, campo) => {
    const grupo = document.getElementById(`grupo_${campo}`);
    const iconoCheck = grupo.querySelector('i');
    const mensajeError = grupo.querySelector('.formulario_input-error');

    if (expresion.test(input.value)) {
        grupo.classList.remove('formulario_grupo-incorrecto');
        grupo.classList.add('formulario_grupo-correcto');
        iconoCheck.classList.remove('bi-x-circle-fill');
        iconoCheck.classList.add('bi-check-circle');
        mensajeError.classList.remove('formulario_input-error-activo');
        campos[campo] = true;
    } else {
        grupo.classList.add('formulario_grupo-incorrecto');
        grupo.classList.remove('formulario_grupo-correcto');
        iconoCheck.classList.remove('bi-check-circle');
        iconoCheck.classList.add('bi-x-circle-fill');
        mensajeError.classList.add('formulario_input-error-activo');
        campos[campo] = false;
    }
};

const validarContrasena2 = () => {
    const inputContrasena1 = document.getElementById('contrasena');
    const inputContrasena2 = document.getElementById('contrasena2');
    const grupoContrasena2 = document.getElementById('grupo_contrasena2');
    const iconoCheck = grupoContrasena2.querySelector('i');
    const mensajeError = grupoContrasena2.querySelector('.formulario_input-error');

    if (inputContrasena1.value !== inputContrasena2.value || inputContrasena1.value === "") {
        grupoContrasena2.classList.add('formulario_grupo-incorrecto');
        grupoContrasena2.classList.remove('formulario_grupo-correcto');
        iconoCheck.classList.remove('bi-check-circle');
        iconoCheck.classList.add('bi-x-circle-fill');
        mensajeError.classList.add('formulario_input-error-activo');
        campos['contrasena2'] = false;
    } else {
        grupoContrasena2.classList.remove('formulario_grupo-incorrecto');
        grupoContrasena2.classList.add('formulario_grupo-correcto');
        iconoCheck.classList.remove('bi-x-circle-fill');
        iconoCheck.classList.add('bi-check-circle');
        mensajeError.classList.remove('formulario_input-error-activo');
        campos['contrasena2'] = true;
    }
};

inputs.forEach((input) => {
    input.addEventListener('keyup', validarFormulario);
    input.addEventListener('blur', validarFormulario);
});


