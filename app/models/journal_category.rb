class JournalCategory
  include Ants::Content
  include Ants::Orderable

  ## Attributes
  field :template_name, default: "show"

  ## Relations
  has_and_belongs_to_many :posts, class_name: "JournalPost", inverse_of: :categories, index: true
end
