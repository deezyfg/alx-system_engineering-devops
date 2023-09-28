# Shell Permissions Project 

This README.md file provides a brief overview of the scripts in this project, explaining what each script does.

## Scripts:

1. 0x01. Shell, permissions: Switches the current user to "betty."
2. 2-groups: Lists all groups the current user belongs to.
3. 3-new_owner: Changes the owner of the "hello" file to "betty."
4. 4-empty: Creates an empty file named "hello."
5. 5-execute: Adds execute permission for the owner to the "hello" file.
6. 6-multiple_permissions: Adds execute permission for the owner and group owner, and read permission for others to the "hello" file.
7. 7-everybody: Adds execute permission for the owner, group owner, and others to the "hello" file.
8. 8-James_Bond: Sets permissions for the "hello" file as follows: Owner has no permissions, Group has no permissions, Others have all permissions.
9. 9-John_Doe: Sets specific permissions for the "hello" file.
10. 10-mirror_permissions: Sets permissions for the "hello" file to match those of "olleh."
11. 11-directories_permissions Adds execute permission to all subdirectories for owner, group owner, and others (ignores regular files).
12. 12-directory_permissions: Creates "my_dir" directory with permissions 751 in the current directory.
13. 13-change_group: Changes the group owner of the "hello" file to "school."

### Advanced Scripts:
14. 100-change_owner_and_group: Recursively changes owner and group of files and directories to "vincent" and "staff."
15. 101-symbolic_link_permissions: Changes owner and group of the symbolic link "_hello" to "vincent" and "staff."
16. 102-if_only: Changes the owner of the "hello" file to "betty" if it's currently owned by "guillaume."
17. 103-Star_Wars: Connects to the Telnet server "towel.blinkenlights.nl" and displays the Star Wars ASCII art banner.