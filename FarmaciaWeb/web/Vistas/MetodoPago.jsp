<%-- 
    Document   : MetodoPago
    Created on : 20/08/2024, 10:47:32 AM
    Author     : SENA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
       <title>Seleccionar Método de Pago</title>
    </head>
    <body>
        <section class="bg-light py-5">
        <div class="container">
            <div class="row">
                <div class="col-md-6 mb-4">
                    <h2>Seleccionar Método de Pago</h2>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" id="contraentrega" name="payment-method" value="cash-on-delivery">
                        <label class="form-check-label" for="cash-on-delivery">Pago en Efectivo (Contraentrega)</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" id="nequi" name="payment-method" value="nequi">
                        <label class="form-check-label" for="nequi">Nequi</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <h3>Resumen del Pedido</h3>
                        </div>
                        <div class="card-body">
                            <div class="d-flex justify-content-between">
                                <span>Producto 1</span>
                                <span>$150.000</span>
                            </div>
                            <div class="d-flex justify-content-between">
                                <span>Producto 2</span>
                                <span>$90.000</span>
                            </div>
                            <hr>
                            <div class="d-flex justify-content-between fw-bold">
                                <span>Subtotal</span>
                                <span>$240.000</span>
                            </div>
                            <div class="d-flex justify-content-between fw-bold">
                                <span>Envío</span>
                                <span>$15.000</span>
                            </div>
                            <div class="d-flex justify-content-between fw-bold">
                                <span>Total</span>
                                <span>$255.000</span>
                            </div>
                        </div>
                        <div class="card-footer text-center" id="card-footer">
                            <button class="btn  w-100" style="background-color: #74BD64;">Continuar al Pago</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
