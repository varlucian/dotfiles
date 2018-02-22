# completion: http://code.activestate.com/recipes/498182/
# persistent history: wosc

import os
import pdb
import readline


# NOTE: global variables don't work in this eval environment,
# thus we also need to re-import everything we need inside the functions
pdb.HISTORY_FILE = os.path.expanduser('~/.pdb_history')
readline.set_history_length(500)


def complete(self, text, state):
    """return the next possible completion for text, using the current frame's
    local namespace

       This is called successively with state == 0, 1, 2, ... until it
       returns None.  The completion should begin with 'text'.
    """
    import rlcompleter
    # keep a completer class, and make sure that it uses the current local
    # scope
    if not hasattr(self, 'completer'):
        self.completer = rlcompleter.Completer(self.curframe.f_locals)
    else:
        self.completer.namespace = self.curframe.f_locals
    return self.completer.complete(text, state)


def precmd(self, line):
    import readline, pdb
    readline.write_history_file(pdb.HISTORY_FILE)
    return self.real_precmd(line)


pdb.Pdb.complete = complete
if not hasattr(pdb.Pdb, 'real_precmd'):
    pdb.Pdb.real_precmd = pdb.Pdb.precmd
    pdb.Pdb.precmd = precmd

if os.path.exists(pdb.HISTORY_FILE):
    readline.read_history_file(pdb.HISTORY_FILE)
