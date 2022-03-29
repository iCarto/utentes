from collections import namedtuple


HydroLocation = namedtuple("HydroLocation", ["loc_divisao", "loc_bacia", "loc_subaci"])
AdmLocation = namedtuple(
    "AdmLocation", ["loc_provin", "loc_distri", "loc_posto", "loc_nucleo"]
)


def hydro_location(
    loc_divisao: str = None, loc_bacia: str = None, loc_subaci: str = None
) -> HydroLocation:
    """Returns an hydrological location.

    If any of the parameters is given, returns a valid location that contains that "sublocation"
    """
    locations = [
        ("DGBI", "Incomati", None),
        ("DGBM", "Megaruma", "Megaruma"),
        ("DGBUM", "Tembe", "Tembe"),
        ("DGBL", "Limpopo", None),
        ("DGBUM", "Maputo", None),
        ("DGBUM", "Umbelúzi", None),
    ]
    locations_by_divisao = [
        loc for loc in locations if not loc_divisao or loc[0] == loc_divisao
    ]
    locations_by_bacia = [
        loc for loc in locations_by_divisao if not loc_bacia or loc[1] == loc_bacia
    ]
    locations_by_subacia = [
        loc for loc in locations_by_bacia if not loc_subaci or loc[2] == loc_subaci
    ]

    return HydroLocation(*locations_by_subacia[0])


def adm_location(
    loc_provin: str = None, loc_distri: str = None, loc_posto: str = None
) -> AdmLocation:
    """Returns an administrative location.

    If any of the parameters is given, returns a valid location that contains that "sublocation"
    """
    locations = [
        ("Maputo Provincia", "Moamba", "Sabie", None),
        ("Maputo Provincia", "Boane", "Boane - Sede", None),
        ("Niassa", "Lago", "Cóbue", None),
        ("Gaza", "Guija", "Mubangoene", "Chinhacanine"),
    ]
    locations_by_provincia = [
        loc for loc in locations if not loc_provin or loc[0] == loc_provin
    ]
    locations_by_distrito = [
        loc for loc in locations_by_provincia if not loc_distri or loc[1] == loc_distri
    ]
    locations_by_posto = [
        loc for loc in locations_by_distrito if not loc_posto or loc[2] == loc_posto
    ]

    return AdmLocation(*locations_by_posto[0])
