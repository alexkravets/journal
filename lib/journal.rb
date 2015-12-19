require "chr"
require "ants"
require "mongosteen"
require "autoinc"

module Journal
  require "constraints/posts"
  require "constraints/pages"
  require "constraints/categories"

  class Engine < ::Rails::Engine
    require "journal/engine"
    require "journal/routing"
  end
end
