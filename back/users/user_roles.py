import types


ADMIN = "Administrador"
ADMINISTRATIVO = "Departamento Administrativo"  # DA
FINANCIERO = "Departamento Financeiro"  # DF
DIRECCION = "Direcção"
TECNICO = "Departamento Técnico"
JURIDICO = "Departamento Jurídico"  # DJ
OBSERVADOR = "Observador"
UNIDAD_DELEGACION = "Unidade ou Delegação"
ROL_SINGLE = "ROL_SINGLE"

SINGLE_USER = "SINGLE_USER"


GROUPS_TO_ROLES = types.MappingProxyType(
    {
        ROL_SINGLE: [ROL_SINGLE, ADMIN],
        ADMIN: [ADMIN],
        ADMINISTRATIVO: [ADMINISTRATIVO],
        FINANCIERO: [FINANCIERO],
        DIRECCION: [DIRECCION],
        TECNICO: [TECNICO],
        JURIDICO: [JURIDICO],
        OBSERVADOR: [OBSERVADOR],
        UNIDAD_DELEGACION: [UNIDAD_DELEGACION],
    }
)
