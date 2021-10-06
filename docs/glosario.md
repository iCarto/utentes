Este glosario (en español) se presenta a modo de _Ubiquitous Language_ para que las _stakeholders_ que participan del proyecto puedan entender los términos que empleamos sin dudas de a que nos estamos refiriendo.

## Utente

Es una persona física o jurídica (empresa, asociación, ...). Una utente podrá poseer 0 o más explotaciones.

Que posea 0 explotaciones será una situación excepcional en el caso de que se hubiera borrado una explotación del sistema y se hubiera mantenido la utente, o se decidiera crear la utente directamente por algún motivo.

En general habrá dos grandes tipo, las que posean explotaciones con licencia, y las que posean explotaciones que no necesiten licencia (`Utente de usos comúns`). Una Utente podría tener tanto explotaciones con licencia como sin licencia pero es una situación poco habitual.

### Aplicación

La pestaña `Utentes` de la aplicación permite listar todas las utentes del sistema, así como las explotaciones asociadas.

### Base de datos

Se registran en la tabla `utentes.utentes`

## Explotación

Una explotación tendrá 0, 1 o 2 licencias

## Licencia

Ciertos usos del agua en Mozambique requieren la obtención de una licencia. Las licencias se pueden clasificar de distintas formas:

-   Según el tipo de agua: Superficial y Subterránea. Cada tipo de agua requiere una licencia distinta
-   Según el tipo de licencia:
    -   Concesiones: Concedidas por un periodo de 25 a 50 años
    -   Licencias: Concedidas por un periodo de 5 años.
    -   Autorización: Concedidas por un periodo de 1 a 3 años para cosas puntuales. Por ejemplo la construcción de una carretera.

Las licencias son el elemento central del sistema.

En la mayoría de las ocasiones las explotaciones tienen una única licencia, y aquellas con dos licencias tienen los mismos periodos de emisión y validez, es decir se licencian y renuevan al mismo tiempo.

### Aplicación

Aparecen siempre vinculadas a una explotación, y no se trabajan a nivel individual

### Base de datos

Se registran en la tabla `utentes.licencias`

## Estado

-   **Inactiva**. Antes llamadas _Irregular_. Licencias que en este momento no están activas pero que podrían volver a estar activas en el futuro. En este momento la aplicación no permite llevar a cabo renovaciones o relicenciamiento sobre ellas mediante un proceso. Aunque puede pasarse a _Licenciada_ o _Utente de facto_ de forma manual. La aplicación debería contemplar en algún momento algo como un botón específico (Reactivar Licencia) en las licencias _Inactiva_ que permitiera pasarlas al proceso de concesión, renovación o mover directamente a otro estado en función de si todavía están dentro de su periodo de validez.
-   Activa / Facturable. Son aquellas explotaciones o licencias cuyo estado es `Licenciada` o `Utente de facto`
-   En proceso. Aquellas explotaciones para las que se ha solicitado una licencia de uso de agua pero que todavía no se le ha concedido.
-   Não aprovada. Aquellas explotaciones para las que se solicito una licencia pero esta no fue concedida. `Não aprovada`
-   Usos comuns. Aquellas explotaciones que no requieren de una licencia y simplemente están catastradas. `Utente de usos comuns`

## Grupos de Estados

Los _Grupos de Estados_ son conceptos que pueden o no estar presentes en el código pero que en todo caso manejamos.

-   **Renovables**. Aquellas licencias que pueden ser renovadas. Aparecerán en la pestaña de _RENOVAÇÕES_ si están en un estado del proceso de renovación que la usuaria debe gestionar. Son las que cumplen la condición de tener como estado _Licenciada_ y estar a 6 meses de que venza su fecha de validez (`utentes.licencias.d_validade`) o ya haya vencido.

### Base de datos

-   `utentes.exploracaoes.estado_lic`
-   `utentes.licencias.estado`
-   La tabla `domains.licencia_estado` muestra todos los posibles estados, y da una idea acerca de los grupos.
