# demoshell
Shell utility to do live demos

# Usage
```
$ demoshell.sh <path-to-commands-file> <path-to-post-commands-file>
```

It will set few shell functions to do interactive demo. `<path-to-commands-file>` provide
the commands to be run in the demo, `<path-to-post-commands-file>` is optional and can be
provided to output a set of commands to be executed at the end of demo (for any cleanup
actions).

The format of `<path-to-commands-file>` is as follows:
```
# Description of the first command
bash command 1
# Description of the second command
bash command 2
...
```
Shell functions provided by the script are as follows:
1. **plan**: displays the plan for the demo. It extracts out description of all the
commands in input file and displays them. It also displays next command to be executed.
2. **n**: Executed next command in the list. It starts with first command and advances the
cursor on each run.
3. **np**: Print next command without executing. It does not advance the cursor.
4. **a**: Move the cursor forward (Advance).
5. **b**: Move the cursor backwards.
6. **r**: Reset the cursor to start of the commands list.


