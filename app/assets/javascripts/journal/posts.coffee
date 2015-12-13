class @JournalPosts extends AntsContent
  constructor: (title="Posts", @apiPath="/admin") ->
    super("Post")
    # onItemRender: (item) ->
    #   renderJournalPostItem(item)

    @_add_featured()
    @_add_published_at_input()
    @_add_categories_input()

    @title = title
    @menuTitle = title
    @menuIcon = "pencil"

    @arrayStore = new RailsArrayStore({
      resource: "journal_post"
      path: "#{ @apiPath }/journal_posts"
      sortBy: "published_at"
      sortReverse: true
      searchable: true
    })

    @fullsizeView = true

# PRIVATE =====================================================================

  _add_featured: ->
    $.extend @formSchema.settings.inputs.general_panel.inputs,
      featured:
        type: "switch"
        label: "Stick to the front page"

  _add_published_at_input: ->
    $.extend @formSchema.settings.inputs.general_panel.inputs,
      published_at:
        type: "datetime"
        label: "Published at"

  _add_categories_input: ->
    @formSchema.settings.inputs['categories_panel'] =
      type: "group"
      groupClass: "group-panel"
      title: "Categories & Tags"
      inputs:
        sorted_categories:
          label: "Categories"
          type: "selectMultiple"
          target: "sorted_category_ids"
          titleField: "title"
          url: "/admin/journal_categories.json"
          placeholder: "Use categories to group your posts by topic."
        _meta_keywords:
          type: 'string'
          label: 'Tags'
          placeholder: 'Use tags to associate more specific keywords with your posts.'

  _path: (object) ->
    hex = object.hex
    "#{location.origin}/#{hex}/"

  _preview_url: (object) ->
    hex = object.hex
    if object.hidden
      "/#{hex}/preview"
    else
      "/#{hex}"
