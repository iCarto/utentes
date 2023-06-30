SIRHA.Services.Exp_size_billing_service = {
    /*
    In the invoicing procedures manual, 4 types of explorations were defined according to their licenced consumption. Mini explorations (<1,000m3), small explorations  (1,000-10,000m3), medium-size explorations (10,000-25,000m3) and big explorations (>25,000m3). The types of consumption and billing depends on the exploration size.
    */

    get_billing_type: function get_billing_type(exploracao_consumption) {
        const YEARLY = "Anual";
        const QUARTERLY = "Trimestral";
        const MONTHLY = "Mensal";

        const MINI_EXPLORATION_MAX_CONSUMPTION = 1000;
        const MEDIUM_EXPLORATION_MAX_CONSUMPTION = 25000;

        if (exploracao_consumption < MINI_EXPLORATION_MAX_CONSUMPTION) {
            return YEARLY;
        } else if (exploracao_consumption < MEDIUM_EXPLORATION_MAX_CONSUMPTION) {
            return QUARTERLY;
        } else {
            return MONTHLY;
        }
    },

    get_consumption_type: function get_consumption_type(exploracao_consumption) {
        const FLAT_FEE = "Fixo";
        const PER_UNIT = "Variável";

        const MEDIUM_EXPLORATION_MAX_CONSUMPTION = 25000;

        if (exploracao_consumption < MEDIUM_EXPLORATION_MAX_CONSUMPTION) {
            return FLAT_FEE;
        } else {
            return PER_UNIT;
        }
    },
};
