require 'autoinc'

class JournalPost
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Search
  include Mongoid::Autoinc
  include Ants::Id
  include Ants::Slug
  include Ants::Hideable


  ## Attributes
  field :title
  field :body_markdown
  field :body_html
  field :published_at, type: DateTime, default: -> { DateTime.now }

  ## Autoinc
  field :int_id, type: Integer
  increments :int_id

  ## Validation
  validates_presence_of :title


  ## Search & slug
  search_in :title
  slug :title


  ## Index
  index({ int_id: 1 })


  ## Helpers
  def _list_item_title
    title
  end


  def _list_item_subtitle
    published_at
  end


  def hex
    int_id.to_s(16)
  end

end
