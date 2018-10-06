import re
import os

def around_assign(snip):
    return '=' in snip.buffer[snip.line]

def around_assign_or_line_start(snip):
    return around_assign(snip) or snip.column == 0

def around_class(snip):
    return 'class' in snip.buffer[snip.line]

def around_const_let_var(snip):
    return re.search('const|let|var', snip.buffer[snip.line]) and '=' not in snip.buffer[snip.line]

def around_expect(snip):
    return 'expect' in snip.buffer[snip.line]

def around_export(snip):
    return 'export' in snip.buffer[snip.line]

def around_file_start(snip):
    return snip.line == 0 and snip.column == 0

def around_function(snip):
    return re.search('=>|function|\w+\(.*\)', snip.buffer[snip.line])

def around_require(snip):
    return 'require' in snip.buffer[snip.line]

def around_switch(snip):
    return re.search('break|switch', snip.buffer[snip.line - 1])

def around_throw(snip):
    return 'throw' in snip.buffer[snip.line]

def importname(path):
    return to_camel(re.sub('\..*', '', os.path.basename(path)))

def singularize(plural):
    return re.sub('(?<!e)es|s$', '', plural)

def singularize_idx(plural):
    return singularize(plural) + 'Idx' if len(plural) > 0 else plural

def to_camel(text):
    return re.sub('[-_]([a-zA-Z0-9])', lambda m: m.group(1).upper(), text)

