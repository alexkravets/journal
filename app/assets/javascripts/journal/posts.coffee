# @renderJournalPostItem = (item) ->
#   item.$publishedAt =$ "<time datetime='#{ item.object.published_at }' class='journal-post-published-at'></aside>"
#   item.$title.before(item.$publishedAt)
#   published_at = getJournalPostPublishedAt(item.object)
#   item.$publishedAt.html(published_at)

#   if item.object.hidden
#     item.$el.addClass('journal-post-hidden')
#   else
#     item.$el.removeClass('journal-post-hidden')


# @getJournalPostPublishedAt = (post) ->
#   today    = new Date()
#   tzOffset = today.getTimezoneOffset() * -1

#   m = moment(post.published_at).utcOffset(tzOffset)
#   if m.isValid()
#     format = 'YYYY/MM/DD' # else 'MMM D, YYYY hh:mm'
#     published_at = m.format(format)

class @JournalPosts extends AntsContent
  constructor: (@title, apiPath="/admin") ->
    super("Post")
    # onItemRender: (item) ->
    #   renderJournalPostItem(item)

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
