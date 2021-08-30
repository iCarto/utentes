from collections import namedtuple


HydroLocation = namedtuple("HydroLocation", ["loc_divisao", "loc_bacia", "loc_subaci"])
AdmLocation = namedtuple(
    "AdmLocation", ["loc_provin", "loc_distri", "loc_posto", "loc_nucleo"]
)


def hydro_location(
    loc_divisao: str = None, loc_bacia: str = None, loc_subaci: str = None
) -> HydroLocation:
    """Return an hydrological location.
    If any of the parameters is given return a valid location that contains that "sublocation"
    """
    locations = [
        ("DGBI", "Incomati", None),
        ("DGBM", "Megaruma", "Megaruma"),
        ("DGBUM", "Tembe", "Tembe"),
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


def adm_location() -> AdmLocation:
    return AdmLocation("Maputo", "Moamba", "Sabie", None)
