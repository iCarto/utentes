import os

from setuptools import find_packages, setup


here = os.path.abspath(os.path.dirname(__file__))

requires = [
    "MarkupSafe==2.0.1",  # https://github.com/pallets/markupsafe/issues/284
    "pyramid==1.10.4",
    "webassets==2.0",
    "pyramid-webassets==0.10",
    "psycopg2==2.8.5",  # Cambiar a psycopg2-binary en dev en caso de problemas
    "SQLAlchemy==1.3.17",
    "geoalchemy2==0.2.6",
    # 'shapely==1.5.13',
    "typing-extensions==3.6.5",
    "python-dateutil==2.8.1",
    "transaction==3.0.0",
    "zope.sqlalchemy==1.3",
    "bcrypt==3.1.7",
    "Jinja2==2.11.2",
    "pyramid-jinja2==2.8",
    "cssutils==1.0.2",
    "rjsmin==1.1.0",  # version included in webassets is outdated
    "numpy==1.19.5",
    "openpyxl==3.0.5",
    "pandas==1.1.5",
    "PasteDeploy==2.1.0",  # for python 3.6
    "sentry-sdk==1.3.1",
]

excludes = ["utentes.tests"]

setup(
    name="utentes",
    version="220921",
    description="utentes",
    author="iCarto",
    author_email="info@icarto.es",
    license="AGPL-3.0",
    url="http://icarto.es",
    packages=find_packages(exclude=excludes),
    include_package_data=True,
    zip_safe=False,
    test_suite="utentes.tests",
    install_requires=requires,
    entry_points="""\
      [paste.app_factory]
      main = utentes:main
      [console_scripts]
      initialize_utentes_db = utentes.scripts.initializedb:main
      """,
)
