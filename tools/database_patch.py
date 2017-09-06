# -*- coding: utf-8 -*-

import re
import datetime

tag = '@20170503'

today = datetime.date.today().strftime('%Y%m%d')

files = []
with open('../sqitch.plan') as f:
    flag = False
    for line in f:
        if flag and line.strip() and not line.startswith('@'):
            files.append(line.split()[0])
        if line.startswith(tag):
            flag = True

with open('/tmp/' + today[2:] + '/from_' + tag[1:] + '_to_' + today + '.sql', 'w') as f:
    f.write('BEGIN;\n')
    for file in files:
        with open('../deploy/' + file + '.sql') as input_file:
            for line in input_file:
                content = re.sub('^\s*BEGIN\s*;\s*$', '', line)
                content = re.sub('^\s*COMMIT\s*;\s*$', '', content)
                f.write(content)
    f.write('COMMIT;\n')
