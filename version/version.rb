# Version Tag   version 0.4   August 2014   written by Feherke
# Liquid tag to return various version numbers.
#
# Syntax :
#   {% version what %}
#     Returns the current version of the named thing. what can be :
#       albino - Albino highlighter's version ( See Albino::VERSION . )
#       coffeescript - CoffeeScript interpreter's version ( See CoffeeScript::version . )
#       jekyll - Jekyll engine's version ( See Jekyll::VERSION . )
#       kramdown - kramdown converter's version ( See Kramdown::VERSION . )
#       liquid - Liquid template's version
#       maruku - Maruku converter's version ( See MaRuKu::Version . )
#       pygments - Pygments highlighter's version ( See Pygments::VERSION . )
#       redcarpet Redcarpet converter's version ( See Redcarpet::VERSION . )
#       ruby - Ruby interpreter's version ( See RUBY_VERSION . )
#       sass - Sass converter's version ( See Sass::VERSION . )

#
# Sample code :
#   {% version ruby %}
#
# Sample output :
#   1.9.2

require 'pygments'

module Jekyll

  class VersionTag < Liquid::Tag

    def initialize tag_name, markup, token
      @what = markup.strip.downcase.delete '"\''

    end

    def render context

      case @what
        when 'albino' then Albino::VERSION
        when 'coffeescript' then CoffeeScript::version
        when 'jekyll' then Jekyll::VERSION
        when 'kramdown' then Kramdown::VERSION
        when 'liquid' then Gem.loaded_specs['liquid'].version.version
        when 'maruku' then MaRuKu::Version
        when 'pygments' then Gem.loaded_specs['pygments.rb'].version.version
        when 'redcarpet' then Redcarpet::VERSION
        when 'ruby' then RUBY_VERSION
        when 'sass' then Sass::VERSION.split.shift
        else ''
      end rescue '-'
    end

  end

end

Liquid::Template.register_tag 'version', Jekyll::VersionTag
