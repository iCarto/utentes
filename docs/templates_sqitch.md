# Templates de Sqitch

Los templates están en la carpeta `.templates`

## Create table

Es un template de apoyo para ayudar a crear tablas.

**Usage:**

```
sqitch add create_table_foo -t create_table -s schema=domains -s table=foo -n "Create table foo"
```

It captures a couple of things to avoid errors and commonly time-waste-actions:

-   Uses Indentity Column instead of SERIAL
-   Creates the common table schema for domains table
-   Writes the geom field with correct CRS and the three common geometry type
    options. It's easy erase thant search + copy + paste
-   Sets the basic permission that we are using now

## Create function

Es un template de apoyo para crear funciones. Es sobre todo útil para definir los permisos de las funciones de una forma estándar.

**Usage:**

```
sqitch add create_function_blabla -n "Funcion para hacer bla bla" -t create_function -s schema=utentes -s function=blabla
```

El _owner_ y el _usuario con permisos de ejecución_ están puestos como variables de psql. Estas variables se fijan en `sqitch.conf`.

Durante el desarrollo, para probar cosas, hay un par de formas de sobreescrir las variables de `sqitch.conf`:

```
psql <opciones de conexion> -v owner=postgres -v base_user=sirha_base_user -f deploy/create_function_blabla
psql <opciones de conexion> -v owner=postgres -v base_user=sirha_base_user # se arranca un psql donde esas variables están seteadas
```

o desde dentro de la propia sesión:

```
\set owner postgres;
\set base_user sirha_base_user;
```
