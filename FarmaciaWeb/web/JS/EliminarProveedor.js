/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {
    $("tr .btndelete").click(function (event) {
        event.preventDefault();
        var idprov = $(this).closest("tr").find(".idprov").val();  
        console.log("ID Proveedor:", idprov);

        if (idprov !== undefined) {
            Swal.fire({
                title: "¿Estás seguro?",
                text: "Una vez eliminado el proveedor no se podrá recuperar.",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#559D46",
                cancelButtonColor: "#94DD81",
                confirmButtonText: "Sí, eliminar",
                cancelButtonText: "Cancelar",
                customClass: {
                    popup: 'animated fadeInDown faster'
                }
            }).then((result) => {
                if (result.isConfirmed) {
                    eliminarProveedor(idprov);
                    Swal.fire({
                        title: "¡Eliminado!",
                        text: "El proveedor ha sido eliminado exitosamente.",
                        icon: "success",
                        confirmButtonColor: "#74BD64",
                        customClass: {
                            popup: 'animated fadeOutUp faster'
                        }
                    }).then(() => {
                        console.log("Proveedor eliminado con éxito");
                        parent.location.href = "CtrProveedores?accion=listarProveedores";
                    });
                } else {
                    Swal.fire({
                        title: "Cancelado",
                        text: "El proveedor no se ha eliminado.",
                        icon: "error",
                        confirmButtonColor: "#B4FD9F"
                    });
                }
            });
        } else {
            console.error("Error: ID Proveedor no definido.");
        }
    });

   
    function eliminarProveedor(idprov) {
        var url = "CtrProveedores?accion=eliminarPro"; 
        $.ajax({
            type: 'POST',
            url: url,
            data: { idprov: idprov }, // Asegúrate que el parámetro coincida con el que usas en tu controlador
            success: function (data, textStatus, jqXHR) {
                console.log("Proveedor eliminado correctamente");
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("Error al eliminar el proveedor:", errorThrown);
            }
        });
    }
});



