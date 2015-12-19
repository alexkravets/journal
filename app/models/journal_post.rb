class JournalPost
  include Ants::Content
  include Ants::SortedRelations
  include Ants::Featurable
  include Mongoid::Autoinc

  ## Autoinc
  field :int_id, type: Integer
  increments :int_id

  ## Relations
  has_and_belongs_to_many :categories, class_name: "JournalCategory", inverse_of: :posts, index: true
  sorted_relations_for :categories

  ## Scopes
  scope :by_category, -> (id) { where(:category_ids.in => [id]) }

  ## Index
  index int_id: 1

  ## Callbacks
  after_validation :set_published_at_datetime

  ## Helpers
  alias_attribute :_list_item_subtitle, :published_at

  def hex
    int_id.to_s(16)
  end

  def excerpt_html
    body_html.split('<!-- -->').first || ''
  end

  def canonical_url
    "#{protocole}#{host}#{path}"
  end

  def meta_description
    _meta_description.presence || excerpt_text
  end

  protected

  def path
    @path ||= Rails.application.routes.url_helpers.show_journal_post_path(hex, slug)
  end

  private

  def excerpt_text
    text = ActionController::Base.helpers.strip_tags(excerpt_html).
      gsub("\n", "").
      gsub("\r", "")
    ActionController::Base.helpers.truncate(text, length: 260, omission: '...')
  end

  def set_published_at_datetime
    if self.published_at.nil?
      self.published_at = Time.zone.now
    end
  end
end
