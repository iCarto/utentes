import logging

from pyramid.view import view_config

from utentes.api.nuevo_ciclo_facturacion import raise_if_not_authorized


log = logging.getLogger(__name__)


@view_config(
    route_name="api_test_fact_substract_month", request_method="GET", renderer="json"
)
# admin
def nuevo_ciclo_facturacion(request):
    raise_if_not_authorized(request)

    sql = """
        -- ALTER TABLE utentes.facturacao DROP CONSTRAINT facturacao_exploracao_ano_mes_key;
        WITH months_substract AS (
            SELECT gid
                , CASE fact_tipo
                      WHEN 'Trimestral' THEN '3 month'::interval
                      WHEN 'Anual' THEN '12 month'::interval
                      ELSE '1 month'::interval
                   END AS month_inverval
            FROM utentes.facturacao
            ORDER BY created_at ASC
        ), foo AS (
            SELECT
                f.gid AS _gid
                , f.created_at - month_inverval  as _created_at
                , to_char(f.created_at - month_inverval, 'YYYY'::text) as _ano
                , to_char(f.created_at - month_inverval, 'MM'::text) as _mes
                , f.fact_date - month_inverval as _fact_date
                , f.recibo_date - month_inverval as _recibo_date
                , daterange((lower(periodo_fact) - month_inverval)::date, (upper(periodo_fact) - month_inverval)::date) as _periodo_fact
                , f.exploracao as _exploracao
            FROM utentes.facturacao f JOIN months_substract USING (gid)
            ORDER BY f.created_at ASC
        )
        UPDATE utentes.facturacao SET
            created_at = _created_at
            , ano = _ano
            , mes = _mes
            , fact_date = _fact_date
            , recibo_date = _recibo_date
            , periodo_fact = _periodo_fact
        -- https://dba.stackexchange.com/questions/299488/
        -- https://www.postgresql.org/message-id/20030405200656.5EAC9474E4F%40postgresql.org
        FROM (SELECT * FROM foo ORDER BY _exploracao ASC, _ano ASC, _mes ASC) foo_ordered
        WHERE gid = _gid
        ;
        -- ALTER TABLE utentes.facturacao ADD CONSTRAINT facturacao_exploracao_ano_mes_key UNIQUE (exploracao, ano, mes);
    """

    request.db.execute(sql)
    return {"ok": "ok"}
