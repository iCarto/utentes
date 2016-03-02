# -*- coding: utf-8 -*-

from sqlalchemy import Boolean, Column, ForeignKey, Integer, Date, Numeric, Text, text
from sqlalchemy.orm import relationship
from geoalchemy2 import Geometry

from utentes.models.fonte import Fonte
from utentes.models.licencia import Licencia

from .base import Base, PGSQL_SCHEMA_UTENTES

class Exploracao(Base):
    __tablename__ = 'exploracaos'
    __table_args__ = {u'schema': PGSQL_SCHEMA_UTENTES}

    gid        = Column(Integer, primary_key=True, server_default=text("nextval('utentes.exploracaos_gid_seq'::regclass)"))
    exp_id     = Column(Text, nullable=False, unique=True)
    exp_name   = Column(Text, nullable=False)
    observacio = Column(Text)
    d_soli     = Column(Date)
    loc_provin = Column(Text, nullable=False)
    loc_distri = Column(Text, nullable=False)
    loc_posto  = Column(Text, nullable=False)
    loc_nucleo = Column(Text)
    loc_endere = Column(Text)
    loc_bacia  = Column(Text)
    loc_subaci = Column(Text)
    loc_rio    = Column(Text)
    pagos      = Column(Boolean)
    c_soli     = Column(Numeric(10, 2))
    c_licencia = Column(Numeric(10, 2))
    c_real     = Column(Numeric(10, 2))
    c_estimado = Column(Numeric(10, 2))
    actividade = Column(Text)
    area       = Column(Numeric(10, 2))
    the_geom   = Column(Geometry('MULTIPOLYGON', '32737'), index=True)
    utente     = Column(ForeignKey(u'utentes.utentes.gid', ondelete=u'CASCADE', onupdate=u'CASCADE'), nullable=False)

    utente_rel = relationship(u'Utente')

    def update_from_json(self, body):
        self.exp_id     = body.get('exp_id')
        self.exp_name   = body.get('exp_name')
        self.d_soli     = body.get('d_soli')
        self.observacio = body.get('observacio')
        self.loc_provin = body.get('loc_provin')
        self.loc_distri = body.get('loc_distri')
        self.loc_posto  = body.get('loc_posto')
        self.loc_nucleo = body.get('loc_nucleo')
        self.loc_endere = body.get('loc_endere')
        self.loc_bacia  = body.get('loc_bacia')
        self.loc_subaci = body.get('loc_subaci')
        self.loc_rio    = body.get('loc_rio')
        self.pagos      = body.get('pagos')
        self.c_soli     = body.get('c_soli')
        self.c_licencia = body.get('c_licencia')
        self.c_real     = body.get('c_real')
        self.c_estimado = body.get('c_estimado')
        self.actividade = body.get('actividade')
        geom = body.get('geometry')
        if geom:
            from geoalchemy2.elements import WKTElement
            from utentes.geomet import wkt
            e.the_geom = WKTElement(wkt.dumps(geom), srid=32737)

        # e.utente     = json.get('utente')
        # e.utente_rel = json.get('utente')

        self.fontes = self.fontes or []
        for f in body.get('fontes'):
            f_id = f.get('id')
            if not f_id:
                self.fontes.append(Fonte.create_from_json(f))
            else:
                for font in self.fontes:
                    if (font.gid == f_id):
                        font.update_from_json(f)
                        break
                else:
                    raise 'this should not happen'

        self.licencias = self.licencias or []
        for l in body.get('licencias'):
            l_id = f.get('id')
            if not l_id:
                self.licencias.append(Licencia.create_from_json(f))
            else:
                for lic in self.licencias:
                    if (lic.gid == l_id):
                        lic.update_from_json(l)
                        break
                else:
                    raise 'this should not happen'

    @staticmethod
    def create_from_json(body):
        e = Exploracao()
        e.update_from_json(body)
        # e.utente     = json.get('utente')
        # e.utente_rel = json.get('utente')
        return e

    def __json__(self, request):
        the_geom = None
        if self.the_geom is not None:
            import json
            the_geom = json.loads(request.db.query(self.the_geom.ST_Transform(4326).ST_AsGeoJSON()).first()[0])
        return {
            'type': 'Feature',
            'properties': {
                'id':         self.gid,
                'exp_id':     self.exp_id,
                'exp_name':   self.exp_name,
                'd_soli':     self.d_soli,
                'observacio': self.observacio,
                'loc_provin': self.loc_provin,
                'loc_distri': self.loc_distri,
                'loc_posto':  self.loc_posto,
                'loc_nucleo': self.loc_nucleo,
                'loc_endere': self.loc_endere,
                'loc_bacia':  self.loc_bacia,
                'loc_subaci': self.loc_subaci,
                'loc_rio':    self.loc_rio,
                'pagos':      self.pagos,
                'c_soli':     self.c_soli,
                'c_licencia': self.c_licencia,
                'c_real':     self.c_real,
                'c_estimado': self.c_estimado,
                'actividade': self.actividade,
                #'utente':     self.utente,
                'area':       self.area,
                'utente':     self.utente_rel,
                'fontes':     self.fontes,
                'licencias':  self.licencias,
            },
            'geometry': the_geom
        }
