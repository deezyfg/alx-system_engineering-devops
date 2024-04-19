# Using Puppet to configure SSH client to enable passwordless authentication
# This script modifies the default SSH configuration file to allow connecting
# to servers without requiring a password.

# Include the stdlib module for file manipulation
include stdlib

# Configure SSH client to use the specified private key
file_line { 'SSH Private Key':
  path               => '/etc/ssh/ssh_config',    # Path to the SSH client configuration file
  line               => '    IdentityFile ~/.ssh/school',    # Specifies the private key
  match              => '^[#]*[\s]*(?i)IdentityFile[\s]+~/.ssh/id_rsa$',   # Regex to match existing IdentityFile line
  replace            => true,    # Replace the matched line if found
  append_on_no_match => true     # Append the line if no match is found
}

# Explanation of the regular expression:
#
# ^                Beginning of the line
# [#]*             Zero or more hash characters
# [\s]*            Zero or more white space characters
# (?i)             Case-insensitive match
# IdentityFile     Specifies the SSH private key file
# [\s]+            At least one whitespace character
# ~/.ssh/id_rsa    The path to the SSH private key file to replace
# $                End of the line

# Configure SSH client to refuse password authentication
file_line { 'Deny Password Auth':
  path               => '/etc/ssh/ssh_config',    # Path to the SSH client configuration file
  line               => '    PasswordAuthentication no',    # Deny password authentication
  match              => '^[#]*[\s]*(?i)PasswordAuthentication[\s]+(yes|no)$',   # Regex to match existing PasswordAuthentication line
  replace            => true,    # Replace the matched line if found
  append_on_no_match => true     # Append the line if no match is found
}

# Explanation of the regular expression:
#
# ^                             Beginning of the line
# [#]*                          Zero or more hash characters
# [\s]*                         Zero or more white space characters
# (?i)                          Case-insensitive match
# [\s]+                         At least one whitespace character
# PasswordAuthentication        Matches the keyword "PasswordAuthentication"
# (yes|no)                      Match with the value "yes" or "no"
# $                             End of the line