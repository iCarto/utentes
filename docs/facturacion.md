# Funcionamiento de la Facturación.

-   Administrador, Observador, DSU-F, DRH y Divisão tienen acceso a esta pestaña.
-   Se muestran para todos los departamentos todas las explotaciones facturables (Licenciada y Utente de facto)
-   En el histórico de facturas de cada explotación se muestran para todos los departamentos todas las facturas
-   Observador no puede editar nada
-   DRH y Divisão sólo puede editar el campo de "consumo facturado" para las facturas en las que se cumpla: "Variable" Y "Subterrânea" Y "Pendente Acrescentar Consumo (DRH)"
    -   La Divisão tiene una restricción extra. Sólo puede editar cuando la explotación es de la división que le corresponde.
-   DSU-F y Administrador puede editar:
    -   "consumo facturado" para las facturas en las que se cumpla: "Variable" Y "Superficial" Y "Pendente Acrescentar Consumo (DRH)"
    -   Todos los campos incluído (consumo facturado para corregir errores) cuando el estado de la factura sea distinto a "Pendente Acrescentar Consumo (DRH)", incluyendo las Pagadas. Por si hay que volver a emitirla.
-   Al arrancar un nuevo ciclo las facturas pasan a "Pendente Emissão Factura (DSU-F)" cuando son "Fixo", y a "Pendente Acrescentar Consumo (DRH)" en caso contrario.
