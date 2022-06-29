/*
Functions to determine when to apply a context to a validation rule
*/

SIRHA.Services.ValidatorContextService = (function() {
    function proforma(model) {
        return model.estado === SIRHA.ESTADO.PENDING_TECH_DECISION;
    }

    function validateFicha(model) {
        return SIRHA.ESTADO.CATEGORY_VALIDATE_FICHA.includes(model.estado_lic);
    }

    const publicAPI = {proforma, validateFicha};
    return publicAPI;
})();
