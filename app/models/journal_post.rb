require 'autoinc'

class JournalPost
  include Ants::Content
  include Ants::SortedRelations
  include Mongoid::Autoinc

  ## Attributes
  field :published_at, type: DateTime, default: -> { DateTime.now }

  ## Autoinc
  field :int_id, type: Integer
  increments :int_id

  ## Relations
  has_and_belongs_to_many :categories, class_name: "JournalCategory", inverse_of: :posts, index: true
  sorted_relations_for :categories

  ## Scopes
  default_scope -> { desc(:published_at) }
  scope :by_category, -> (id) { where(:category_ids.in => [id]) }

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

  def canonical_url
    "#{protocole}#{host}#{path}"
  end

  protected

  def path
    @path ||= Rails.application.routes.url_helpers.show_journal_post_path(hex, slug)
  end
end
