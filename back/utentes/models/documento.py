# -*- coding: utf-8 -*-

import os

from sqlalchemy import Column, ForeignKey, text
from sqlalchemy import Boolean, Integer, Text
from utentes.models.filehandler import FileHandler
from utentes.models.base import (
    PGSQL_SCHEMA_UTENTES,
    Base
)

def get_file_path_root():
    # by default packagedir/utentes/static/files
    here = os.path.dirname(__file__)
    return os.path.abspath(os.path.join(here, os.pardir, 'static/files'))


class Documento(Base):

    __tablename__ = 'documentos'
    __table_args__ = {u'schema': PGSQL_SCHEMA_UTENTES}

    gid = Column(Integer, primary_key=True, server_default=text("nextval('utentes.documentos_gid_seq'::regclass)"))
    exploracao = Column(
        ForeignKey(
            u'utentes.exploracaos.gid',
            ondelete=u'CASCADE',
            onupdate=u'CASCADE'),
        nullable=False)
    name = Column(Text)
    size = Column(Text)
    departamento = Column(Text)
    saved = Column(Boolean, default=False)

    defaults = {
        'path_root': get_file_path_root()
    }

    def __json__(self, request):
        url = ''
        if request:
            url = request.host_url + '/api/exploracaos/' + str(self.exploracao) + '/documentos/' + self.departamento + '/' + self.name
        return {
            'gid': self.gid,
            'url': url,
            'name': self.name,
            'size': self.size,
            'departamento': self.departamento
        }

    def get_file_path_upload(self):
        # by default: packagedir/utentes/static/files/uploads/{id}/{name}
        return os.path.join(self.defaults['path_root'],
                            'uploads',
                            str(self.gid),
                            self.name).encode('utf-8')

    def get_file_path_save(self):
        # by default: packagedir/utentes/static/files/attachments/{exploracao_id}/{departamento}/{id}/{name}
        return os.path.join(self.defaults['path_root'],
                            'documentos',
                            str(self.exploracao),
                            self.departamento,
                            str(self.gid),
                            self.name).encode('utf-8')

    def get_file_path(self):
        if self.saved:
            return self.get_file_path_save()
        else:
            return self.get_file_path_upload()

    def upload_file(self, content):
        filename = self.get_file_path_upload()
        filehandler = FileHandler()
        filehandler.save(filename, content)
        self.save_file()

    def delete_file(self):
        # TODO: connect this method to SQLAlchemy delete process
        filename = self.get_file_path()
        filehandler = FileHandler()
        filehandler.delete(filename)

    def save_file(self):
        if not self.saved:
            try:
                src = self.get_file_path_upload()
                dst = self.get_file_path_save()
                filehandler = FileHandler()
                filehandler.rename(src, dst)
                self.saved = True
                return True
            except Exception:
                return False
        return False