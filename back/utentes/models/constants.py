K_ABASTECIMENTO = "Abastecimento"
K_AGRICULTURA = "Agricultura de Regadio"
K_INDUSTRIA = "Indústria"
K_PECUARIA = "Pecuária"
K_PISCICULTURA = "Piscicultura"
K_ENERGIA = "Producção de energia"
K_SANEAMENTO = "Saneamento"

K_SUBTERRANEA = "Subterrânea"
K_SUPERFICIAL = "Superficial"

K_UNKNOWN = "Desconhecido"
K_LICENSED = "Licenciada"
K_DE_FACTO = "Utente de facto"
K_USOS_COMUNS = "Utente de usos comuns"
K_INACTIVE = "Inactiva"
K_PENDING_TECH_DECISION = "Pendente Parecer Técnico (DRH)"
K_PENDING_EMIT_LICENSE = "Pendente Emissão Licença (DSU-L)"
K_PENDING_DIR_SIGN = "Pendente Firma Licença (Direcção)"
K_PENDING_FIELD_VISIT = "Pendente Visita Campo (DRH)"
K_INCOMPLETE_DT = "Documentação incompleta (Pendente utente - DRH)"

INVOIZABLE_STATES = (K_LICENSED, K_DE_FACTO)
RENEWABLE_STATES = (K_LICENSED,)


IMPLIES_VALIDADE_ACTIVITY_STATES = (
    K_INACTIVE,
    K_LICENSED,
    K_PENDING_TECH_DECISION,
    K_PENDING_EMIT_LICENSE,
    K_PENDING_DIR_SIGN,
    K_DE_FACTO,
    None,
)
IMPLIES_VALIDADE_FICHA_STATES = (
    K_INACTIVE,
    K_LICENSED,
    K_PENDING_FIELD_VISIT,
    K_PENDING_TECH_DECISION,
    K_PENDING_EMIT_LICENSE,
    K_PENDING_DIR_SIGN,
    K_DE_FACTO,
    None,
)

MONTHLY = "Mensal"
QUARTERLY = "Trimestral"
YEARLY = "Anual"

FLAT_FEE = "Fixo"
PER_UNIT = "Variável"

INVOICE_STATE_PENDING_CONSUMPTION = "Pendente Acrescentar Consumo (DRH)"
PENDING_INVOICE = "Pendente Emissão Factura (DSU-F)"
PENDING_PAYMENT = "Pendente Pagamento (DSU-F)"
PAID = "Pagada"
NOT_INVOIZABLE = "Não facturable"

THREE_DAYS_IN_SECONDS = 60 * 60 * 24 * 3
