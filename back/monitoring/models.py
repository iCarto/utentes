from sqlalchemy import Column, DateTime, Float, Integer, Text, text

from utentes.models.base import Base


PGSQL_SCHEMA_MONITORING = "monitoring"


class ViewMonitor(Base):
    __tablename__ = "view_monitor"
    __table_args__ = {"schema": PGSQL_SCHEMA_MONITORING}

    id = Column(Integer, primary_key=True)
    username = Column(Text)
    verb = Column(Text)
    route_path = Column(Text)
    created_at = Column(DateTime, nullable=False, server_default=text("now()"))
    duration = Column(Float)

    # https://github.com/wemake-services/wemake-python-styleguide/issues/1431
    def __init__(self, username, verb, route_path, duration):
        self.username = username
        self.verb = verb
        self.route_path = route_path
        self.duration = duration
