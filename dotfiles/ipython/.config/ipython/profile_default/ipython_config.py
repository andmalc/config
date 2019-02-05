
c = get_config()

c.TerminalInteractiveShell.display_completions='column'


c.TerminalInteractiveShell.editing_mode = 'vi'


"""
# sample ipython_config.py
c = get_config()

c.TerminalIPythonApp.display_banner = True
c.InteractiveShellApp.log_level = 20
c.InteractiveShellApp.extensions = [
    'myextension'
]
c.InteractiveShellApp.exec_lines = [
    'import numpy',
    'import scipy'
]
c.InteractiveShellApp.exec_files = [
    'mycode.py',
    'fancy.ipy'
]
c.InteractiveShell.colors = 'LightBG'
c.InteractiveShell.confirm_exit = False
c.InteractiveShell.editor = 'nano'
c.InteractiveShell.xmode = 'Context'

c.PrefilterManager.multi_line_specials = True

c.AliasManager.user_aliases = [
 ('la', 'ls -al')
]
"""

