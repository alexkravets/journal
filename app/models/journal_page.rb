class JournalPage
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Search
  include Ants::Id
  include Ants::Slug
  include Ants::Hideable
  include Ants::Orderable


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
  def _list_item_title
    title
  end

end
