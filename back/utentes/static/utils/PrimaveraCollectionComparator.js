SIRHA.Utils.primaveraCollectionComparator = {
    comparator: function(a, b) {
        let primavera_a = a.get("primavera");
        let primavera_b = b.get("primavera");

        // If both are True, or none are TrueF, sort by exp_id
        if ((primavera_a && primavera_b) || (!primavera_a && !primavera_b)) {
            let exp_id_a = a.get("exp_id");
            let exp_id_b = b.get("exp_id");
            if (exp_id_a === exp_id_b) {
                return 0;
            }
            return exp_id_a > exp_id_b ? 1 : -1;
        }
        // If not one of then if F and the other is not
        return primavera_a ? -1 : 1;
    },
};
