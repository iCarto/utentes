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
K_IRREGULAR = "Irregular"
K_PENDING_TECH_DECISION = "Pendente Parecer Técnico (DT)"
K_PENDING_EMIT_LICENSE = "Pendente Emisão Licença (DJ)"
K_PENDING_DIR_SIGN = "Pendente Firma Licença (Direcção)"
K_PENDING_FIELD_VISIT = "Pendente Visita Campo (DT)"
K_INCOMPLETE_DT = "Documentação incompleta (Pendente utente - DT)"

INVOIZABLE_STATES = (K_LICENSED, K_DE_FACTO)
IMPLIES_VALIDADE_ACTIVITY_STATES = (
    K_IRREGULAR,
    K_LICENSED,
    K_PENDING_TECH_DECISION,
    K_PENDING_EMIT_LICENSE,
    K_PENDING_DIR_SIGN,
    K_DE_FACTO,
    None,
)
IMPLIES_VALIDADE_FICHA_STATES = (
    K_IRREGULAR,
    K_LICENSED,
    K_PENDING_FIELD_VISIT,
    K_PENDING_TECH_DECISION,
    K_PENDING_EMIT_LICENSE,
    K_PENDING_DIR_SIGN,
    K_DE_FACTO,
    None,
)

MONTHTLY = "Mensal"
