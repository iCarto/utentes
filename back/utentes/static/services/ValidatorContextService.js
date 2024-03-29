/*
Functions to determine when to apply a context to a validation rule
*/

SIRHA.Services.ValidatorContextService = (function() {
    function proforma(model) {
        return [
            SIRHA.ESTADO.PENDING_TECH_DECISION,
            SIRHA.ESTADO.PENDING_EMIT_LICENSE,
        ].includes(model.estado);
    }

    function validateFicha(model) {
        return SIRHA.ESTADO.CATEGORY_VALIDATE_FICHA.includes(model.estado_lic);
    }

    function printLicense(model) {
        return model.estado === SIRHA.ESTADO.PENDING_EMIT_LICENSE;
    }

    const publicAPI = {proforma, validateFicha, printLicense};
    return publicAPI;
})();
