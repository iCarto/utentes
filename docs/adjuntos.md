# Funcionamiento del sistema de ficheros adjuntos (Archivo Electrónico)

Una usuario sólo puede subir ficheros al directorio de su departamento. Con las siguientes excepciones:

-   El departamento "Administrador" no tiene carpeta propia, pero puede subir a cualquier otra carpeta
-   Los departamentos "Observador", "Direcção" no tienen carpeta propia y no pueden subir adjuntos
-   El departamento "Divisão", sólo los puede subir a su correspondiente subdirectorio.

Cuando se sube un fichero desde "Criar" este va al directorio del departamento del usuario que sube el fichero. Es decir no va al directorio del departamento de "Departamento de Administração e Recursos Humanos", que es el que tiene los permisos principales en "Criar". En el caso de "Administrador" si van a esa carpeta. Este comportamiento es general para el resto de páginas de proceso "NOVAS LICENÇAS" y "RENOVAÇÕES", se suben los ficheros en la carpeta del departamento de la usuaria, no la del estado en la que está el proceso.

## Sobre la implementación

En disco se crea un directorio para cada explotación, cuyo nombre es él "gid" de la explotación. Dentro hay subdirectorios para cada departamento.

Al borrar una explotación se borra su directorio de disco

Posible bug:
