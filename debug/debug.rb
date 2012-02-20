# Debug Filter   version 0.1   February 2012   written by Feherke
# Facilitates access to information about the template variables.
#
# Syntax :
#   {{ variable | send: 'method', 'parameter' }}
#     Calls the specified method of the variable. ( See Object#send . )
#
# Sample input :
#   data: whatever
#
# Sample code :
#   {{ data | send: 'tr', 'e', '3' }}
#
# Sample output :
#   what3v3r

module Jekyll

  module DebugFilter

    def send input, method, *param

      input.send method, *param rescue $!
    end

  end

end

Liquid::Template.register_filter Jekyll::DebugFilter

