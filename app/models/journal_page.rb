class JournalPage
  include Ants::Content
  include Ants::Orderable

  ## Attributes
  field :template_name, default: "show"
end
