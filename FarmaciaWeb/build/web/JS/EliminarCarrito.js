/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    $("body").on("click", ".btndeletecar", function (event) {
        event.preventDefault();
        
        var idpp = $(this).closest("tr").find(".idpro").val();
        console.log("ID Producto:", idpp); 
        
        Swal.fire({
            title: "¿Estás seguro?",
            text: "Una vez eliminada, podrás seguir comprando.",
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
            console.log("Resultado Swal:", result); 
            if (result.isConfirmed) {
                eliminar(idpp); 
                Swal.fire({
                    title: "¡Eliminada!",
                    text: "ha sido eliminado exitosamente.",
                    icon: "success",
                    confirmButtonColor: "#74BD64",
                    customClass: {
                        popup: 'animated fadeOutUp faster'
                    }
                }).then(() => {
                    console.log("eliminado con éxito");
                    parent.location.href = "CtrProductoLi?accion=Carrito"; 
                });
            } else {
                Swal.fire({
                    title: "Cancelado",
                    text: "no se ha eliminado.",
                    icon: "error",
                    confirmButtonColor: "#B4FD9F"
                });
            }
        });
    });

    function eliminar(idpp) {
        var url = "CtrProductoLi?accion=Delete";
        $.ajax({
            type: 'POST',
            url: url,
            data: { idpp: idpp },
            success: function (data, textStatus, jqXHR) {
                console.log("eliminado correctamente");
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("Error al eliminar:", errorThrown);
            }
        });
    }


    $("tr #cantidad").click(function (){
        //alert ("Entro en Cantidad!");
        var idp = $(this).parent().find("#idp").val();
        var Cantidad = $(this).parent().find("#cantidad").val();
        var url = "CtrProductoLi?accion=ActualizarCantidad";
        $.ajax({
            type: 'POST',
            url: url,
            data: "idp=" + idp +"&Cantidad=" + Cantidad,
            success: function (data, textStatus, jqXHR){
                //alert ("Entro en Cantidad!");
                location.href="CtrProductoLi?accion=carro";
            }
        });
    });
});

