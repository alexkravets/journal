class @JournalPosts
  constructor: (menuTitle="Posts", title="Categories", @apiPath="/admin") ->
    config =
      menuTitle: menuTitle
      menuIcon: "pencil"

      title: title

      arrayStore: new RailsArrayStore({
        resource: "journal_category"
        path: "#{ @apiPath }/journal_categories"
        orderable: { positionFieldName: "_position" }
      })

      formSchema:
        title: { type: "string" }

      items:
        all_posts: @_posts_config()

    new ModuleCategories(config, 'by_category', => @_posts_config())

    return config

  _posts_config: ->
    config =
      arrayStore: new RailsArrayStore({
        resource: "journal_post"
        path: "#{ @apiPath }/journal_posts"
        sortBy: "published_at"
        sortReverse: true
        searchable: true
      })

      formSchema:
        editor:
          type: "group"
          groupClass: "group-editor"
          inputs:
            title:
              type: "string"
              placeholder: "Title"
            body_markdown:
              type: "markdown"
              label: "Content"
              htmlFieldName: "body_html"
              placeholder: "Content"

        settings:
          type: "group"
          inputs:
            general_panel:
              type: "group"
              groupClass: "group-panel"
              title: "General"
              inputs:
                hidden:
                  type: "switch"
                  label: "Draft"
                  default: true
                sorted_categories:
                  label:  'Categories'
                  type:   'select2'
                  target: 'sorted_category_ids'
                  beforeInitialize: (input) -> selectMultiple(input, 'title', '/admin/journal_categories.json')
                  placeholder: 'Select categories'
                published_at:
                  type: "datetime"
                  label: "Publish at"
                slug: new AntsSlugInput()

            seo_panel:
              type: "group"
              groupClass: "group-panel"
              title: "SEO"
              inputs:
                meta: new AntsMetaGroup()

      showWithParent: true
      fullsizeView: true

      viewTabs:
        editor: "Post"
        settings: "Options"

      onItemRender: (item) ->
        renderJournalPostItem(item)

      onViewShow: (view) =>
        if view.object
          hex = view.object.hex
          addPreviewHeaderButton(view, "/#{ hex }/preview", "/#{ hex }")

    return config
