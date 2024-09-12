| Fecha      | Version | Descripcion/cambios | Autor                                                                                    |
| ---------- | ------- | ------------------- | ---------------------------------------------------------------------------------------- |
| 11/07/2023 | 1.0     | primer documento    | Dariana Ruiz, Luis Cortezano, Andrés Padilla,Nehemías Yepes, Samuel Buzón, Abel Martínez |
| 30/08/2024 | 1.1     | Acatualizacion      | Dariana Ruiz, Luis Cortezano, Andrés Padilla,Nehemías Yepes, Samuel Buzón, Abel Martínez |

### **1. Propósito**

El propósito es describir mediante diagramas el funcionamiento y requerimientos del software, también a identificar los actores que intervendrán en el software y las respectivas funciones que realizarán en el sistema.

### **2. Alcance**

El sistema será un sitio ventas web accesible a través de internet. El cual brindara una interfaz de usuarios y productos para que los usuarios puedan interactuar.
Este sistema aportara en:

• Registro e inicio de sesión de usuarios

• Administración de los productos disponibles del inventario

• Generar factura electrónica

• Selección de productos y compra de los mismos

• PQRS

### **3. Definiciones, Acrónimos, y Abreviaturas**

PQR: peticiones, quejas y reclamos.

RF/ REQ: requerimientos funciónales

RFN /RNF: requerimientos no funcionales.

Caso de Uso: es una técnica para la captura de requisitos de un nuevo sistema.

### **4. Personal**

| Nombre         | Correo                            | Telefono   |
| -------------- | --------------------------------- | ---------- |
| Dariana Ruiz   | darianaruizmontes@gmail.com       | 3024486683 |
| Luis Cortezano | luisdavidcortezano@gmail.com      | 3246794400 |
| Andrés Padilla | Andrespadillat27@gmail.com        | 3127268142 |
| Nehemías Yepes | nyeres02102006@gmail.com          | 3160412212 |
| Samuel Buzón   | buzonsamuel18@gmail.com           | 3003191165 |
| Abel Martínez  | martinezmattosabeljesus@gmail.com | 3243316646 |

### **5. Situación Actual**

La farmacia actualmente lleva desde la gestión del inventario hasta la atención al cliente y el seguimiento de ventas de manera manual. Esta falta de un sistema en línea genera dificultades para administrar sus operaciones y, como resultado, experimentar una disminución en la eficiencia y la eficacia. Además, enfrenta problemas para satisfacer las expectativas de los clientes que buscan comodidad y rapidez en el proceso de compra de medicamentos. La falta de un sistema en línea dificulta ofrecer servicios adicionales y adaptarse a las tendencias del mercado digital, lo que puede afectar su competitividad en comparación con otras farmacias en línea.

### **6. Perspectiva del Producto**

Con este proyecto se espera una mejora en las ventas de la farmacia, dicho sistema brindara facilidad al usuario en la compra de productos y obtención de la información de estos, a tener un mayor alcance de clientes, ahorro de tiempo y comodidad al no tener que desplazarse a la farmacia física.

### **7. Funciones del Producto**

• Módulo de gestión de usuario.

• Módulo de inicio de sesión.

• Módulo de búsqueda de producto.

• Módulo de Carrito de compras.

• Módulo de pago para compras en línea.

• Generar factura electrónica de las compras que se realicen.

• Módulo de PQR.

### **8. Características de Usuario**

El sistema cuenta con dos tipos de usuario

Cliente: realizara compras y consultas.

Administrador: se asegura del correcto funcionamiento y gestión de la plataforma.

### **9. Requerimientos Funcionales**

| Codigo | Nombre                  |
| ------ | ----------------------- |
| RF-001 | Registro de usuario     |
| RF-002 | Inicio de sesión        |
| RF-003 | Búsqueda de productos   |
| RF-004 | Carrito de compras      |
| RF-005 | Pago de compra en línea |
| RF-006 | Factura electrónica     |
| RF-007 | PQR                     |

|              | Código                                                                                                                                                                                                                                                            | Nombre          | Fecha | Grado Necesidad |
| ------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------- | ----- | --------------- |
| REQ001       | gestión de usuario                                                                                                                                                                                                                                                | Sin especificar | ALTO  |
| Descripcion: | El sistema debe permitir que los usuarios se registren en la plataforma proporcionando su información personal.                                                                                                                                                   |
|              | REQ001. 1-CREACION DE CUENTA: el sistema debe permitir a los visitantes registrarse como usuarios de la farmacia online. El usuario debe digitar sus datos personales como: ID, nombre, apellido, correo electrónico, contraseña, dirección y número de contacto. |
|              | REQ0001. 2-INICIO DE SESION: el sistema debe permitir a los usuarios registrados iniciar sesión en la plataforma utilizando su ID y contraseña.                                                                                                                   |
|              | REQ001. 3-PERFIL DE USUARIO: los usuarios deben tener acceso a un perfil de usuario para que puedan editar su información personal como dirección, número de contacto u otros datos de información.                                                               |

|

<br>
<br>
<br>
<br>
<br>

| Código       | Nombre                                                                                                                                                                                                        | Fecha           | Grado Necesidad |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------- | --------------- |
| REQ002       | Inicio de sesión.                                                                                                                                                                                             | Sin especificar | ALTO            |
| Descripcion: | REQ002.1- INICIO DE SESION: el sistema debe permitir a los usuarios registrados iniciar sesión en la plataforma utilizando su ID y contraseña.                                                                |
|              | REQ002.2- RETABLECIMIENTO DE CONTRASEÑA: El sistema debe permitir al usuario el restablecimiento de su contraseña en caso de olvidarla, mediante un link de restablecimiento enviado a su correo electrónico. |

<br>
<br>
<br>
<br>

|              | Código                                                                                                                                                                                                        | Nombre          | Fecha | Grado Necesidad |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------- | ----- | --------------- |
| REQ003       | Búsqueda de productos                                                                                                                                                                                         | Sin especificar | ALTO  |
| Descripcion: | El sistema debe permitir a los usuarios la capacidad de buscar productos farmacéuticos ya sea por el nombre del producto o la categoría.                                                                      |
|              | REQ003. 1-BUSQUEDA POR NOMBRE DE PRODUCTO: El usuario de poder buscar el producto que desea ingresando el nombre del producto y el sistema debe poder de volver resultados relevantes.                        |
|              | REQ003. 2-BUSQUEDA POR CATEGORIAS: El sistema le debe permitir al usuario poder buscar productos por categorías como: salud y medicamentos, cuidado y aseo personal, maquillaje, maternidad y bebes, ofertas. |
|              | REQ003. 3-VISTA PEREVIA DE PRIDUCTOS: los usuarios deben poder ver la vista previa de los productos en los resultados de búsqueda junto a la información, marca y precio del producto.                        |                 |
|              | REQ003. 4-INTEGRACION DEL CARRITO DE COMPRAS: los usuarios deben poner agregar los productos directamente desde el resultado de la búsqueda al carrito de compras.                                            |

|

<br>
<br>
<br>
<br>

| Código       | Nombre                                                                                                                                                                                                                                                                             | Fecha           | Grado Necesidad |
| ------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------- | --------------- |
| REQ004       | Carrito de compras                                                                                                                                                                                                                                                                 | Sin especificar | ALTO            |
| Descripcion: | El sistema deberá de permitir al usuario la búsqueda de productos, deben poder seleccionar la cantidad de productos que desea, ver la descripción del producto, precio y disponibilidad                                                                                            |
|              | REQ004.1-AGREGAR PRODUCTOS AL CARRITO: el usuario debe poder agregar productos al carrito.El sistema deberá permitir la actualización de la cantidad de los productos.                                                                                                             |
|              | REQ004.2-DISPONIBILIDAD DEL PRODUCTO: el sistema deberá verificar si el producto se encuentra disponible para la compra antes de ser agregado al carrito. Si el producto no se encuentra disponible el sistema deberá informar al usuario.                                         |
|              | REQ004.3-GETION DEL CARRITO: el usuario podrá ver el contenido actual de carrito de compras.El sistema deberá mostrar la lista de los productos, la cantidad, el precio unitario más el subtotal, El usuario debe poder modificar la cantidad del producto o eliminar el producto. |

<br>
<br>
<br>
<br>

|              | Código                                                                                                                                                                                                   | Nombre          | Fecha | Grado Necesidad |
| ------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------- | ----- | --------------- |
| REQ007       | PQR                                                                                                                                                                                                      | Sin especificar | ALTO  |
| Descripcion: | Brindar a los usuarios la opción de realizar consultas o solicitar asesoramiento farmacéutico en línea a través de correo electrónico.                                                                   |
|              | REQ007.1-CONSULTA EN LÍNEA: el usuario podrá realizar consultas en línea sobre medicamentos, efectos segundarios, dosis recomendadas, productos, etc.                                                    |
|              | REQ007.2-ASESORAMIENTO FARMACEUTICO: el usuario recibirá asesoramiento personalizado por el farmacéutico autorizado, el asesoramiento se realizará por medio de correo electronico o llamada telefónica. |

### **10. Requerimientos No Funcionales**

| Código       | Nombre                                                                                                                         | Fecha           | Grado Necesidad |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------ | --------------- | --------------- |
| RFN-001      | Usabilidad del sitio web                                                                                                       | Sin especificar | ALTO            |
| Descripcion: | El sitio web debe cargar de manera rápida y eficiente para los usuarios, sin tiempos de espera prolongados o errores de carga. |

| Código       | Nombre                                                                                                                         | Fecha           | Grado Necesidad |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------ | --------------- | --------------- |
| RFN-002      | Velocidad de carga de la página                                                                                                | Sin especificar | ALTO            |
| Descripcion: | El sitio web debe cargar de manera rápida y eficiente para los usuarios, sin tiempos de espera prolongados o errores de carga. |

| Código       | Nombre                                                                                                                                                                                                    | Fecha           | Grado Necesidad |
| ------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------- | --------------- |
| RFN-003      | Seguridad de la información                                                                                                                                                                               | Sin especificar | ALTO            |
| Descripcion: | El sitio web debe garantizar la confidencialidad, integridad y disponibilidad de la información de los usuarios y de la propia empresa, protegiéndola de accesos no autorizados, robo o pérdida de datos. |

| Código       | Nombre                                                                                                                 | Fecha           | Grado Necesidad |
| ------------ | ---------------------------------------------------------------------------------------------------------------------- | --------------- | --------------- |
| RFN-004      | Disponibilidad                                                                                                         | Sin especificar | ALTO            |
| Descripcion: | El sistema debe estar disponible para el usuario en todo momento, minimizando el tiempo de inactividad no planificado. |

| Código       | Nombre                                                                                                               | Fecha           | Grado Necesidad |
| ------------ | -------------------------------------------------------------------------------------------------------------------- | --------------- | --------------- |
| RFN-005      | Privacidad y protección de datos                                                                                     | Sin especificar | ALTO            |
| Descripcion: | establecerse políticas claras de privacidad y protección de datos para proteger la información personal del usuario. |

### **Modelo Entidad Relación**

![Diagrama MER](Diagramas/MER.jpg)

### **Diagramas de casos de uso**

![Caso de uso](<Diagramas/CDUFamacia Yasbel.jpg>)
![Caso de uso Gestion de usuario](Diagramas/CDUGestionUsuario.jpg)
![Caso de uso Inicio de sesion](Diagramas/CDUInicioSesion.jpg)
![Caso de uso Gestion de productos](Diagramas/CDUGestionProducto.jpg)
![Caso de uso Gestion carro de compras](Diagramas/CDUCarritoCompra.jpg)
![Caso de uso Gestion de inventario](Diagramas/CDUGestionInventario.jpg)
![Caso de usoPQR](Diagramas/CDUGestionPQR.jpg)
![Caso de uso gestion de proveedores](Diagramas/CDUGestionProveedor.jpg)

<br>
<br>
<br>
<br>

|                | CASO DE USO                                                                                                                                                       | GESTION DE USUARIO |
| -------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------ |
| Descripcion    | Este es el sistema dedicado únicamente para el inicio de sesión del cliente, mostrando ese detalle, los pasos que se necesitan para un correcto inicio de sesión. |
| Precondicion   | El cliente debe estar regristrado en la base de datos antes de iniciar sesión.                                                                                    | 3 U                |
| Secuencion     | PASO                                                                                                                                                              | Acción             |
| ---            | 1. El cliente ingresa el usuario y contraseña                                                                                                                     |
| ---            | 2. El sistema valida los datos.                                                                                                                                   |
| ---            | 3. Si los datos son incorrectos el sistema le da otra oportunidad al cliente para volver a escribir los datos.                                                    |
| ---            | 4. Una vez validado los datos el cliente ingresa a la pagina web.                                                                                                 |
| Post condición | Luego de iniciar sesión el cliente tiene acceso a los productos farmaceuticos de la pagina web.                                                                   |
| Excepciones    | PASO                                                                                                                                                              | Acción             |
| ---            | 1. Si el cliente no esta registrado o el correo electrónico ya ha sido previamente registrado por otro cliente, no se puede iniciar sesión.                       |

<br>
<br>
<br>
<br>

|                | CASO DE USO                                                                                              | GESTION DE PRODUCTOS |
| -------------- | -------------------------------------------------------------------------------------------------------- | -------------------- |
| Descripcion    | De esta manera el sistema puede saber que productos esta seleccionando el usuario.                       |
| Precondicion   | El usuario busca productos.                                                                              |
| Secuencion     | PASO                                                                                                     | Acción               |
| ---            | 1. El usuario oprime el buscador.                                                                        |
| ---            | 2. Luego el usuario escribe el nombre del producto que desea buscar.                                     |
| ---            | 3. El sistema analiza el nombre del producto y lo encuentra.                                             |
| Post condición | Si el cliente escribio correctamente el nombre del producto el sistema lo habra encontrado exitosamente. |
| Excepciones    | PASO                                                                                                     | Acción               |
| ---            | 1. Si el cliente escribió incorrectamente el nombre del producto el sistema no lo encontrara.            |

<br>
<br>
<br>
<br>

|                | CASO DE USO                                                                                      | GESTION DE CARRITO |
| -------------- | ------------------------------------------------------------------------------------------------ | ------------------ |
| Descripcion    | De esta manera podremos identificar los productos que el cliente ha seleccionado.                |
| Precondicion   | Que el cliente allá seleccionado los productos previamente.                                      |
| Secuencion     | PASO                                                                                             | Acción             |
| ---            | 1. Luego de haber buscado los productos el cliente deberá seleccionar los productos.             |
| ---            | 2. El sistema identifica los productos y los ingresa al carrito                                  |
| Post condición | Si el cliente seleccionó los productos el sistema ya abra ingresado los productos en el carrito. |
| Excepciones    | PASO                                                                                             | Acción             |
| ---            | 1. Si el cliente no selecciona los productos el sistema no los ingresa al carrito.               |

<br>
<br>
<br>
<br>

|                | CASO DE USO                                                                                                              | PQR    |
| -------------- | ------------------------------------------------------------------------------------------------------------------------ | ------ |
| Descripcion    | El cliente y administrador tienen una relación en el tema de consultar y asesorar.                                       |
| Precondicion   | El administrador debe de estar preparado para cualquier consulta que haga el cliente.                                    |
| Secuencion     | PASO                                                                                                                     | Acción |
| ---            | 1. El cliente hace una consulta.                                                                                         |
| ---            | 2. El administrador asesora.                                                                                             |
| Post condición | Si la información otorgada por el administrador hacia el cliente fue la indicada el cliente debería sentirse satisfecho. |
| Excepciones    | PASO                                                                                                                     | Acción |
| ---            | 1. Si la pregunta del cliente no es la adecuada el administrador no podrá responder.                                     |

<br>
<br>
<br>
<br>

|                | CASO DE USO                                                                                                                                                    | GESTION DE INVENTARIO |
| -------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------- |
| Descripcion    | El administrador proporciona suministros a la droguería lo cual indica un cambio en la base de datos lo cual es actualizado por el sistema.                    |
| Precondicion   | El administrador debe hacer un cambio en la droguería para que esto suceda.                                                                                    |
| Secuencion     | PASO                                                                                                                                                           | Acción                |
| ---            | 1. El administrador proporciona suministros a la droguería.                                                                                                    |
| ---            | 2. El administrador le da instrucciones al sistema para que este mismo actualice la base de datos del inventario.                                              |
| Post condición | El sistema ya habrá actualizado la base de datos del inventario una vez el administrador le allá otorgado las indicaciones.                                    |
| Excepciones    | PASO                                                                                                                                                           | Acción                |
| ---            | 1. Para que el sistema actualice la base de datos el administrador debe darle las instrucciones sobre qué productos específicamente proporcionó al inventario. |

<br>
<br>
<br>
<br>

### **Diagramas de actividades**

### **Gestión de usuario**

![Gestion de usuario](Diagramas/GestUsuarios.jpg)

### **Inicio de sesión**

![Inicio de sesion](Diagramas/GestInicdSesion.jpg)

### **Gestión de productos**

![Gestion de Productos](Diagramas/GestProductos.jpg)

### **Gestión de pedidos**

![Gestion de pedidos](Diagramas/GestPedidos.jpg)

### **PQR**

![PQR](Diagramas/GestPQR.jpg)

### **Gestión de inventario**

![Gestion de inventario](Diagramas/GestInventario.jpg)

### **Gestión de proveedores**

![Gestion de Proveedores](Diagramas/GestProveedores.jpg)

### **Diagramas de clases (UML)**

![Diagrama de Clases ]()
