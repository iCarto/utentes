var EXPLORACAO_SCHEMA = [
    {
        fieldname: "exp_id",
        message: 'O "número de exploracão" não pode estar vazio',
        rules: ["NOT_NULL"],
    },
    {
        fieldname: "exp_id",
        message: 'O "número de exploracão" não tem o formato correcto',
        rules: ["EXP_ID_FORMAT"],
    },
    {
        fieldname: "exp_name",
        message: 'O "nome de exploracão" não pode estar vazio',
        rules: ["NOT_NULL"],
    },
    {
        fieldname: "d_soli",
        message: 'A "data de solicitação" não tem o formato correcto',
        rules: ["IS_DATE"],
    },
    {
        fieldname: "d_d_emis",
        message: 'A "data de emissão" do DUAT não tem o formato correcto',
        rules: ["IS_DATE"],
    },
    {
        fieldname: "d_area",
        message: 'A "área (ha)" do DUAT não tem o formato correcto',
        rules: ["IS_NUMERIC", "INT_LESS_THAN_8"],
    },
    {
        fieldname: "c_soli",
        message: 'O "consumo solicitado" não tem o formato correcto',
        rules: ["IS_NUMERIC", "INT_LESS_THAN_8"],
    },
    {
        fieldname: "c_licencia",
        message: 'O "consumo licenciado" não tem o formato correcto',
        rules: ["IS_NUMERIC", "INT_LESS_THAN_8"],
    },
    {
        fieldname: "c_real",
        message: 'O "consumo real" não tem o formato correcto',
        rules: ["IS_NUMERIC", "INT_LESS_THAN_8"],
    },
    {
        fieldname: "c_estimado",
        message: 'O "consumo estimado" não tem o formato correcto',
        rules: ["IS_NUMERIC", "INT_LESS_THAN_8"],
    },
    {
        fieldname: "area",
        message: 'A "área" não tem o formato correcto',
        rules: ["IS_NUMERIC", "INT_LESS_THAN_8"],
    },
    {
        fieldname: "loc_provin",
        message: 'A "provincia" da exploracão não pode estar vazia',
        rules: ["NOT_NULL"],
        context: ["validateFicha"],
    },
    {
        fieldname: "loc_distri",
        message: 'O "distrito" da exploracão não pode estar vazio',
        rules: ["NOT_NULL"],
        context: ["validateFicha"],
    },
    {
        fieldname: "loc_posto",
        message: 'O "posto administrativo" da exploracão não pode estar vazio',
        rules: ["NOT_NULL"],
        context: ["validateFicha"],
    },
    {
        fieldname: "loc_divisao",
        message: 'A "Divisão" da exploracão não pode estar vazia',
        rules: ["NOT_NULL"],
        context: ["validateFicha"],
    },
    {
        fieldname: "loc_bacia",
        message: 'A "bacia" da exploracão não pode estar vazia',
        rules: ["NOT_NULL"],
        context: ["validateFicha"],
    },
    {
        fieldname: "utente",
        message: "A exploracão deve ter um utente",
        rules: ["NOT_NULL"],
        context: ["validateFicha"],
    },
    {
        fieldname: "actividade",
        message: "A exploracão deve ter uma actividade",
        rules: ["ACTIVITY_NOT_NULL"],
        context: ["validateFicha"],
    },
    {
        fieldname: "licencias",
        message: "A exploracão deve ter uma licença",
        rules: ["ARRAY_NOT_VOID"],
        context: ["validateFicha"],
    },
];
