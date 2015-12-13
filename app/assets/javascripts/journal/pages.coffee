class @JournalPages extends AntsContent
  constructor: (title="Pages", apiPath="/admin") ->
    super("Page")

    @title = title
    @menuIcon = 'file-o'
    @fullsizeView = true

    @arrayStore = new RailsArrayStore({
      resource: 'journal_page'
      path: "#{ apiPath }/journal_pages"
      reorderable: { positionFieldName: '_position' }
    })

# PRIVATE =====================================================================

  _path: (object) ->
    "#{location.origin}/"

  _preview_url: (object) ->
    slug = object.slug
    if object.hidden
      "/#{slug}/preview"
    else
      "/#{slug}"
