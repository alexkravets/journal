class @JournalCategories extends AntsContent
  constructor: (title="Categories", @apiPath="/admin") ->
    super("Category")

    @title = title
    #@showWithParent = true

    @arrayStore = new RailsArrayStore({
      resource: "journal_category"
      path: "#{ @apiPath }/journal_categories"
      reorderable: { positionFieldName: "_position" }
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
