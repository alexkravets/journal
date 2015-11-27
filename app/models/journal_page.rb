class JournalPage
  include Ants::Content
  include Ants::Orderable

  ## Helpers
  def _list_item_subtitle
    "/#{slug}"
  end
end
