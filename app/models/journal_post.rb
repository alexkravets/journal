require 'autoinc'

class JournalPost
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Search
  include Mongoid::Autoinc
  include Ants::Id
  include Ants::Slug
  include Ants::Hideable
  include Ants::Meta

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

  ## Search & Slug
  search_in :title
  slug :title

  ## Scopes
  default_scope -> { desc(:published_at) }

  ## Index
  index int_id: 1
  index published_at: -1

  ## Helpers
  def hex
    int_id.to_s(16)
  end

  def excerpt_html
    body_html.split('<!-- -->').first || ''
  end

  def excerpt_text
    ActionController::Base.helpers.strip_tags(excerpt_html).
      gsub("\n", "").
      gsub("\r", "")
  end

  def meta_title
    _meta_title.presence || title
  end

  def meta_description
    _meta_description.presence || excerpt_text
  end

  def meta_keywords
    _meta_keywords
  end

  def opengraph_image_url
    _opengraph_image_url
  end

  def _list_item_title
    title
  end
end
