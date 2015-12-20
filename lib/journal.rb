require "chr"
require "loft"
require "mongosteen"

module Journal
  require "constraints/posts"
  require "constraints/pages"
  require "constraints/categories"

  class Engine < ::Rails::Engine
    require "journal/engine"
    require "journal/routing"
  end
end
