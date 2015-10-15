#!/usr/bin/env python3

import i3ipc

i3 = i3ipc.Connection()

def flush():
    ws = i3.get_workspaces()
    print(ws)

def on_workspace(self, e):
    flush()

flush()
i3.on('workspace::focus', on_workspace)
i3.main()
