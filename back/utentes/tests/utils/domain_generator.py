from collections import namedtuple


HydroLocation = namedtuple("HydroLocation", ["loc_unidad", "loc_bacia", "loc_subaci"])
AdmLocation = namedtuple(
    "AdmLocation", ["loc_provin", "loc_distri", "loc_posto", "loc_nucleo"]
)


def hydro_location(
    loc_unidad: str = None, loc_bacia: str = None, loc_subaci: str = None
) -> HydroLocation:
    """Return an hydrological location.
    If any of the parameters is given return a valid location that contains that "sublocation"
    """
    locations = [
        ("DGBI", "Incomati", None),
        ("DGBM", "Megaruma", "Megaruma"),
        ("DGBUM", "Tembe", "Tembe"),
    ]
    locations_by_unidad = [
        loc for loc in locations if not loc_unidad or loc[0] == loc_unidad
    ]
    locations_by_bacia = [
        loc for loc in locations_by_unidad if not loc_bacia or loc[1] == loc_bacia
    ]
    locations_by_subacia = [
        loc for loc in locations_by_bacia if not loc_subaci or loc[2] == loc_subaci
    ]
    return HydroLocation(*locations_by_subacia[0])


def adm_location() -> AdmLocation:
    return AdmLocation("Maputo", "Moamba", "Sabie", None)
