# Videoclub Desengaño

## Construcción de una DataBAse con MySQL

<img src = "https://github.com/NereaRiveiro/Videoclub-Desenganho/images/descarga.jpeg" width="550" height="400"/>

## Índice:

1.[✍️ Descripción](#descripción)\
2.[🧹 Limpieza](#limpieza)\
3.[🎙️ Toma de decisiones](#decisiones)\
4.[💿 Consultas habituales](#consultas)\
5.[🗂️ Estructura](#estructura)


## ✍️ Descripción:<a name="descripción"/>

Proyecto en Ironhack 🔗  Se propone la creación de una base de datos a partir de un conjunto de archivos .csv de un antiguo videoclub. La idea es crearla para un nuevo videoclub que necesita una estructura de almacenamiento de datos y revisión del stock ya disponible. Las herramientas que se usarán son MySQL y Python.


## 🧹 Limpieza:<a name="limpieza"/>

Hemos revisado de cada uno de los archivos individualmente.

- Se ha encontrado un duplicado en el archivo de 'actor.csv', para ello se filtró por nombre y apellido ya que el id era diferente. En esa misma tabla unimos el nombre y apellido en una única columna para facilitar la identificación de actores y actrices en las prox búsquedas.

- Nulos solamente había en 'film.csv' en toda una columna y la hemos eliminado. En esta misma tabla hemos realizado varios cambios. En primer lugar hemos visto que el año de salida era en todas el 2006, por lo que es un dato mal introducido y eliminamos esa columna. Como en el videoclub todas las películas son en inglés hemos decidido eliminar las columnas 'original_language_id' y 'language_id'.

- En todas las tablas que la contenían, hemos eliminado la columna 'last_update' ya que constaba siempre la misma fecha y no lo consideramos info relevante.

- Para la tabla de 'inventory' eliminamos también la columna de las tiendas porque no será útil para el nuevo negocio. Nos damos cuenta durante la limpieza de que la info ofrecida solo constan las 233 primeras películas.

- Limpiamos la tabla 'old_hdd' de tal manera que sólo queden el nombre completo de los actores y en nombre de la película correspondiente. Esto nos es útil para crear una nueva columna en 'films' con los actores correspondientes a cada película.

- Revisando 'rental' eliminamos la columna de 'staff_id'. Como podemos observar, en la columna de inventory_id hemos descubierto que hay valores más altos que los que tenemos de registro en la tabla inventory. Por lo que suponemos que no se nos ha ofrecido la información completa de esa tabla. Asimismo, vemos que hay 1000 registros pero en el inv_id los valores llegan a 1001 por lo que, revisando las filas, encontramos que hay un registro que falta (entre el 320 y el 322). El uso de esta tabla tal cual nos daría error en sql para poder hacer las relaciones por lo que tenemos dos opciones: o bien eliminamos todas las filas en las que el valor de la columna inventory_id sea mayor que 1001 (se puede realizar tanto con py o sql), o podemos por otro lado guardar los datos antiguos limpios por un posible uso futuro de comparativas y resetear la tabla rental para tener nuevos valores de los registros una vez abra.

Los archivos que no usaremos para la nueva database también han sido guardados limpios, por una posible caso de que el cliente los quiera revisar o nos solicite en un futuro nuevos proyectos en los que nos resulten necesarios.



## 🎙️ Toma de decisiones:<a name="decisiones"/>

Para poder llevar a cabo el proyecto, consideramos que una parte fundamental del proceso ha sido estructurarlo y llegar a conclusiones para poder crear un database acorde al negocio futuro.

<details>
<summary>Info del videoclub:</summary>
<br>

- Una única tienda.
- Un único empleado que es el dueño.
- Todas las películas son en inglés.
- Modelo en el que es el empleado el que elige una película personalizada para el cliente.
- Durante el mes de cumpleaños del cliente hay descuento en el alquiler.
</details>

<details>
<summary>Transformaciones:</summary>
<br>
Por ende, consideramos que tenemos que hacer los siguientes **cambios**:

- Las tablas que necesitamos son: **film**, **rental**, **inventory**.
- Creamos nueva tabla para **clientes** e introducimos primer cliente ficticio para pruebas.
- Prescindimos de los datos previos de 'rental' ya que están incompletos. Se le sugiere al cliente que nos dé la base de datos completa, mientras usaremos una nueva tabla para ir rellenando los nuevos alquileres postreapertura.
- Creamos las relaciones de nuestra database de la siguiente manera:

<img src="https://github.com/NereaRiveiro/Videoclub-Desenganho/notebooks/SQL/foto_diagrama.png" width="550" height="400" />
</details>

## 💿 Consultas habituales:<a name="consultas"/>


Para dar una imagen de cuestiones relevantes para el negocio hemos creado diez queries que se podrán aplicar al negocio. Dan respuesta a lo siguiente:

1. Saber la película que mejor rating le dan los clientes.
2. Qué clientes han alquilado más veces.
3. En qué zona viven los clientes que más alquilan.
4. Lista de los cumpleaños de este mes.
5. Las peliculas de duración más corta con mejor valoración.
6. Películas del actor x que duren menos de 2 horas.
7. 10 películas de las que tenemos más stock.
8. Las 5 pelicukas se pueden alquilar más días.
9. Tabla de los clientes que tienen que devolver películas este mes.
10. Qué special features tiene la peli que va a alquilar el cliente.



## 🗂️ Estructura:<a name="estructura"/>

root 

|__ notebooks/    

|__   |__ Limpieza/       # Archivos resultantes del proceso de limpieza

|__  |__ SQL/            # Archivos .sql del proceso de creación y filtrado de la database.

|

|__ images/             # Contiene la imágenes que se han usado en el proyecto   
|

|__ .gitignore          # Archivo gitignore     
|

|__ README.md           # Descripción del proyecto

