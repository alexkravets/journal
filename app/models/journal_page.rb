class JournalPage
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Search
  include Ants::Id
  include Ants::Slug
  include Ants::Hideable
  include Ants::Orderable
  include Ants::Meta

  ## Attributes
  field :title
  field :body_markdown
  field :body_html

  ## Validation
  validates_presence_of :title

  ## Search & slug
  search_in :title
  slug :title

  ## Helpers
  def meta_title
    _meta_title.presence || title
  end

  def meta_description
    _meta_description.presence
  end

  def meta_keywords
    _meta_keywords.presence
  end

  def opengraph_image_url
    _opengraph_image_url.presence
  end

  def _list_item_title
    title
  end

  def _list_item_subtitle
    "/#{slug}"
  end
end
