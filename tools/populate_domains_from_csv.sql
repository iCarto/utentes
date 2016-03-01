-- Remove bad data from csv file

CREATE TABLE public.dominios_enter (

    category text,
    value text,
    alias text,
    ordering integer,
    parent text,
    tooltip text
);

COPY public.dominios_enter FROM '/tmp/domains.csv' DELIMITER ',' CSV;

INSERT INTO public.dominios_enter (category, value, alias, ordering, parent, tooltip)
select category, '', '', 0, parent, '' from public.dominios_enter group by category, parent having count (*) > 1;


DELETE FROM utentes.domains;

INSERT INTO utentes.domains (category, value, alias, ordering, parent, tooltip) (SELECT category, value, alias, ordering, parent, tooltip FROM public.dominios_enter order by category, parent, ordering, value, alias);


DROP TABLE public.dominios_enter;
