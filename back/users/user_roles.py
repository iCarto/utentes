import types


ADMIN = "Administrador"
ADMINISTRATIVO = "Departamento Administrativo"  # DA
FINANCIERO = "Departamento Financeiro"  # DF
DIRECCION = "Direcção"
TECNICO = "Departamento Técnico"
JURIDICO = "Departamento Jurídico"  # DJ
OBSERVADOR = "Observador"
UNIDAD_DELEGACION = "Unidade ou Delegação"


GROUPS_TO_ROLES = types.MappingProxyType(
    {
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
