import re
import os
import vim

def around_assign(snip):
    return '=' in snip.buffer[snip.line]

def around_catch(snip):
    return 'catch' in snip.buffer[snip.line - 1]

def around_class(snip):
    return 'class' in snip.buffer[snip.line]

def around_const_let_var(snip):
    return re.search('const|let|var', snip.buffer[snip.line]) and '=' not in snip.buffer[snip.line]

def around_expect(snip):
    return 'expect' in snip.buffer[snip.line]

def around_export(snip):
    return 'export' in snip.buffer[snip.line]

def around_first_line_or_require(snip):
    return 'const' not in snip.buffer[snip.line] and (snip.line == 0 or 'require' in snip.buffer[snip.line - 1])

def around_for(snip):
    return 'for' in snip.buffer[snip.line]

def around_function(snip):
    return re.search('=>|function|^\s+\w+\(.*\)', snip.buffer[snip.line])

def around_import(snip):
    return 'import' in snip.buffer[snip.line]

def around_json_parse(snip):
    return 'JSON.parse' in snip.v

def around_regex(snip):
    return re.search('/.+/', snip.buffer[snip.line])

def around_require(snip):
    return 'require' in snip.buffer[snip.line]

def around_switch(snip):
    return re.search('break|switch', snip.buffer[snip.line - 1]) or (
        snip.line - 2 >= 0 and
        'case' in snip.buffer[snip.line - 2] and
        'return' in snip.buffer[snip.line - 1]
    )

def around_template_string(snip):
    return '`' in snip.buffer[snip.line]

def around_throw(snip):
    return 'throw' in snip.buffer[snip.line]

def importname(path):
    return to_camel(re.sub('\..*', '', os.path.basename(path)))

def path_and_line():
    return vim.eval("'\"'. expand('%') . ':' . line('.') . '\"'")

def singularize(plural):
    return re.sub('(?<!e)es|s$', '', plural)

def singularize_idx(plural):
    return singularize(plural) + 'Idx' if len(plural) > 0 else plural

def to_camel(text):
    return re.sub('[-_]([a-zA-Z0-9])', lambda m: m.group(1).upper(), text)
