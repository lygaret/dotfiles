#!/usr/bin/env python3
import i3ipc

# Create the Connection object that can be used to send commands and subscribe
# to events.
conn = i3ipc.Connection()

# Query the ipc for outputs. The result is a list that represents the parsed
# reply of a command like `i3-msg -t get_outputs`.
outputs = conn.get_outputs()

print('Active outputs:')

for output in filter(lambda o: o.active, outputs):
        print(output.name)

        # Send a command to be executed synchronously.
        conn.command('focus left')

        # Define a callback to be called when you switch workspaces.
        def on_workspace(self, e):
                # The first parameter is the connection to the ipc and the second is an object
                # with the data of the event sent from i3.
                if e.current:
                        print('Windows on this workspace:')
                        for w in e.current.leaves():
                                print(w.name)

        # Subscribe to the workspace event
        conn.on('workspace::focus', on_workspace)

# Start the main loop and wait for events to come in.
conn.main()
