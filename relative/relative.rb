# Date To Relative Filter   version 0.0   december 2013   written by Feherke
# Formats a date as a single relative amount.
#
# Syntax :
#   {{ date | relative }}
#     Returns the amount of the greatest elapsed time unit.
#
# Sample input :
#   date: Date.new 2013, 11, 6
#
# Sample code :
#   {{ date | relative }}
#
# Sample output :
#   1.8 month ago

module Jekyll

  module DateRelative

    def relative date
      diff = (Date.today - date).to_f

      [
        ['decade', 3652.5],
        ['year',   365.25],
        ['month',  30.4366666666],
        ['week',   7],
        ['day',    1]
      ].each do |unit|
        return "%g %s%s ago" % [nr = (diff / unit[1]).round(1), unit[0], nr >= 2 ? 's' : ''] if diff > unit[1]
      end

      'today'
    end

  end

end

Liquid::Template.register_filter Jekyll::DateRelative
