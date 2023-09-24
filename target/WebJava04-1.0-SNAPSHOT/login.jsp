<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link rel="stylesheet" href="webjars/bootstrap/5.1.0/css/bootstrap.min.css" type="text/css" />
</head>
<body>
    <div class="container mt-5">
        <form name="form" action="/WebJava04/ServletVerifica" method="post">
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Usuario</label>
                <input type="text" name="xnom" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
            </div>
            <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Clave</label>
                <input type="password" name="xcla" class="form-control" id="exampleInputPassword1">
            </div>
            <div class="mb-3">
                <label class="form-label">Selecciona una opción:</label>
                <select name="opcion" class="form-select" id="opcionSelect">
                    <option value="areas">Áreas</option>
                    <option value="cargos">Cargos</option>
                </select>
            </div>
            <!-- Mensaje de contraseña obligatoria (inicialmente oculto) -->
            <div id="mensajeClave" class="text-danger" style="display: none;">La contraseña es obligatoria.</div>
            <button type="submit" class="btn btn-primary">Ingresar</button>
            <a class='btn btn-danger' href="index.html">Cancelar</a>
        </form>
    </div>

    <script>
        // Función para mostrar/ocultar el mensaje de contraseña obligatoria según la selección del usuario
        document.querySelector('select[name="opcion"]').addEventListener('change', function () {
            if (this.value === 'areas') {
                document.getElementById('mensajeClave').style.display = 'block';
            } else {
                document.getElementById('mensajeClave').style.display = 'none';
            }
        });
    </script>
</body>
</html>
