# -*- coding: utf-8 -*-
from __future__ import print_function

import csv
import sys
import codecs


tables = {}
inserts = {}
with codecs.open(sys.argv[1], 'r', encoding='utf-8') as f:
    last_parent = last_category = None
    for line in f:
        row = line.split(';')
        category, parent = row[0], row[4]
        if not tables.get(category):
            tables[category] = 'sqitch add create_table_domains_{} -t createtable -s owner=utentes -s schema=domains -s table={} -s column=category -s type=text -s column=key -s type=text -s column=value -s type=text -s column=ordering -s type=text -s column=parent -s type=text -s column=tooltip -s type=text -r create_schema_domains -n "Create table domains.{}"'.format(category, category, category)
            inserts[category] = inserts.get(category) or []
            # select category, '', '', 0, parent, '' from public.dominios_enter group by category, parent having count (*) > 1
        if category != last_category or parent != last_parent:
            inserts[category].append([category, '', '', '0', parent, ''])
            last_category = category
            last_parent = parent

        inserts[category].append(row)


def get_value(v):
    v = v.encode('utf-8')
    value = "'" + v.replace("'", "''") + "'" if v.strip() else 'NULL'
    return value


sqitch = open('create_table_domains', 'w')
deploy_populate = open('deploy_populate', 'w')
revert_populate = open('revert_populate', 'w')
verify_populate = open('verify_populate', 'w')
deploy_view = open('deploy_view', 'w')

view = '''-- Deploy utentes:create_view_domains to pg
-- requires: create_schema_domains

BEGIN;

CREATE OR REPLACE VIEW domains.domains AS
'''

print ('''-- Deploy utentes:populate_domains_table to pg
-- requires: create_schema_domains

BEGIN;


''', file=deploy_populate)

print('sqitch add create_schema_domains -t createschema -s schema=domains -s owner=utentes -n "Create schema domains"', file=sqitch)
for table in sorted(tables.keys()):
    print (tables[table], file=sqitch)

    print ("DELETE FROM domains.{};".format(table), file=revert_populate)
    print ("SELECT 1/COUNT(*) FROM domains.{};".format(table), file=verify_populate)

    inserts[table].sort(key=lambda tup: (tup[0], tup[4], tup[3] if tup[3] == 'NULL' else '-', tup[1])) # order by category, parent, ordering, key

    for i in inserts[table]:
        values = [ get_value(v) for v in i ]
        category = i[0].decode('utf-8')
        s = "INSERT INTO domains.{} (category, key, value, ordering, parent, tooltip) VALUES ({}, {}, {}, {}, {}, {});".format(category, values[0], values[1], values[2], values[3], values[4], values[5])
        print (s, file=deploy_populate)
    view += "SELECT category, key, value, ordering, parent, tooltip FROM domains.{}".format(table)
    view += "\nUNION\n"

print ('''


COMMIT;''', file=deploy_populate)

view = view[:-7] + "\n;\n\n"
view += "ALTER VIEW domains.domains OWNER TO utentes;\nCOMMIT;"

print('sqitch add create_view_domains -r create_schema_domains -n "Create view domains.domains"', file=sqitch)
print('sqitch add populate_domains_table -r create_schema_domains -n "Populate domains tables"', file=sqitch)

print (view, file=deploy_view)

sqitch.close()
deploy_populate.close()
revert_populate.close()
verify_populate.close()
deploy_view.close()
