SIRHA.Utils.genderCollectionComparator = {
    comparator: function(a, b) {
        let gender_a = a.get("utente").get("sexo_gerente") || a.get("sexo_gerente");
        let gender_b = b.get("utente").get("sexo_gerente") || b.get("sexo_gerente");

        // If both are F, or none are F, sort by exp_id
        if (
            (gender_a == SIRHA.CONSTANTS.SEXO_FEMININO &&
                gender_b == SIRHA.CONSTANTS.SEXO_FEMININO) ||
            (gender_a != SIRHA.CONSTANTS.SEXO_FEMININO &&
                gender_b != SIRHA.CONSTANTS.SEXO_FEMININO)
        ) {
            let exp_id_a = a.get("exp_id");
            let exp_id_b = b.get("exp_id");
            if (exp_id_a === exp_id_b) {
                return 0;
            }
            return exp_id_a > exp_id_b ? 1 : -1;
        }
        // If not one of then if F and the other is not
        return gender_a == SIRHA.CONSTANTS.SEXO_FEMININO ? -1 : 1;
    },
};
