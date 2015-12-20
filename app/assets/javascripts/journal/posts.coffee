@timezoneOffset = -> (new Date()).getTimezoneOffset() * -1

class @JournalPosts extends AntsContent
  constructor: (@title, apiPath="/admin") ->
    super("Post")

    @menuTitle = @title
    @menuIcon = "pencil"

    @_add_featured()
    @_add_published_at_input()
    @_add_categories_input()

    @arrayStore = new RailsArrayStore({
      resource: "journal_post"
      path: "#{ apiPath }/journal_posts"
      sortBy: "published_at"
      sortReverse: true
      searchable: true
    })

    @fullsizeView = true
    @listTabs =
      "Published": { not_hidden: true }
      "Drafts": { hidden: true }

    @onItemRender = (item) =>
      @_render_list_item(item)

    @onViewShow = (view) =>
      @_toggle_draft_fields(view)

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
        disableClear: true

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

  _render_list_item: (item) ->
    m = moment(item.object.published_at).utcOffset(timezoneOffset())
    published_at = m.format("MM/DD/YYYY")
    item.$subtitle.html(published_at)

  _toggle_draft_fields: (view) ->
    hide = view.object.hidden
    $viewEl = view.$el
    $hiddenInput = view.form.inputs.hidden.$input

    $hiddenInput.on "change", (e) ->
      hide = $(e.currentTarget).prop("checked")
      $viewEl.toggleClass("view-post-draft", hide)

    $viewEl.toggleClass("view-post-draft", hide)
