# Debug Filter   version 0.3   November 2013   written by Feherke
# Facilitates access to information about the template variables.
#
# Syntax :
#   {{ variable | call: 'method', 'parameter' }}
#     Calls the specified method of the variable. ( See Object#send . )
#   {{ variable | log: 'filename' }}
#
# Sample input :
#   data: whatever
#
# Sample code :
#   {{ data | call: 'tr', 'e', '3' }}
#
# Sample output :
#   what3v3r
#
# Sample code :
#   {{ data | log: '/tmp/liquid.log' }}

module Jekyll

  module DebugFilter

    def call input, method, *param

      input.send method, *param rescue $!
    end

    def log input, filename

      File.open filename, 'a' do |file|
        file.puts "--=[ #{ Time.now } ]=--"
        file.puts input
        file.puts
      end

      nil
    end

  end

end

Liquid::Template.register_filter Jekyll::DebugFilter
