class @JournalPages
  _add_preview_button: (view) ->
    slug = view.object.slug
    addPreviewHeaderButton(view, "/#{ slug }/preview", "/#{ slug }")

  constructor: (title='Pages', apiPath='/admin') ->
    config =
      menuIcon: 'file-o'
      title: title

      fullsizeView: true

      arrayStore: new RailsArrayStore({
        resource: 'journal_page'
        path: "#{ apiPath }/journal_pages"
        reorderable: { positionFieldName: '_position' }
        # searchable: true
      })

      viewTabs:
        editor: 'Page'
        settings: 'Options'

      formSchema:
        editor:
          type: 'group'
          groupClass: "group-editor"
          inputs:
            title:
              type: 'string'
              placeholder: 'Page Title'
            body_markdown:
              type: 'markdown'
              label: 'Content'
              htmlFieldName: 'body_html'
              placeholder: 'Content'

        settings:
          type: 'group'
          inputs:
            general_panel:
              type: "group"
              groupClass: "group-panel"
              title: "General"
              inputs:
                hidden:
                  type: 'switch'
                  label: 'Draft'
                slug: new AntsSlugInput()

            seo_panel:
              type: "group"
              groupClass: "group-panel"
              title: "SEO"
              inputs:
                meta: new AntsMetaGroup()

      onViewShow: (view) =>
        if view.object
          @_add_preview_button(view)

    return config
