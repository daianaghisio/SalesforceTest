# SalesforceTest


Crear una aplicación en Salesforce donde se obtenga un color desde una API externa, y se agregue a la lista de registros de color relacionados a una cuenta (Account).

Requisitos:

-Tener un entorno de desarrollo propio
-Una vez terminada la tarea, generar un PR contra la rama principal (main) del repositorio.
-La aplicación solo debe ser accesible para los usuarios con perfiles System Administrator y marketing Users (Los dos son perfiles por defecto), y solo se podrá acceder a los registros de cuentas y objetos hijo (en este caso los registros de color).
-No se puede usar ninguna página Lightning ya construida, pero se pueden tomar alguna como base para crear una nueva.
-En la vista, debe haber dos componentes, uno donde se llame a la API y se vea de alguna manera el color obtenido, y otro donde se listen los registros de color.
-Cada vez que se abra una vista de una cuenta, se deberá cargar el color más reciente cargado previamente. Si la cuenta no tiene ningún color, se debe indicar esto de alguna manera al usuario.
-Cada vez que se llame a la API solicitando un color, se debe entregar una respuesta visual al usuario, ya sea por que la operación fue exitosa, donde además de la respuesta al usuario se deben actualizar la lista de colores y el color mostrado actualmente; o un mensaje de error si falla. También se debe indicar al usuario de alguna forma que hay una operación en proceso (recordar que los llamados no son inmediatos).
-Dado que es un ejercicio sencillo, la cobertura de código debe ser de 90% mínimo.

Condiciones:
-Una vez finalizado el PR, la idea es tratar de hacer un despliegue de lo construido a un entorno.

Api para realizar el llamado:
https://apitestjefersonsf2.herokuapp.com/avalian/get-color
Método: POST

Formato de la solicitud:
{
    "accountId" : "123132"
}

Formatos de respuesta:
200 (OK)
{
"color": "random color: #23ABC0",
"colorCode": "#23ABC0",
"colorDate": "2022-05-26T00:32:59.856Z"
}

400 (Error)
{
"message": "Not Account in request"
}
