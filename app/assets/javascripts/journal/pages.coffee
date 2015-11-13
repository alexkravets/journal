class @JournalPages
  constructor: (title='Pages', apiPath='/admin') ->
    config =
      title: title

      arrayStore: new RailsArrayStore({
        resource: 'journal_page'
        path: "#{ apiPath }/journal_pages"
        reorderable: { positionFieldName: '_position' }
        searchable: true
      })

      viewTabs:
        editor: 'Content'
        settings: 'Settings'

      formSchema:
        editor:
          type: 'group'
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
            hidden:
              type: 'switch'
              label: 'Hidden'
            slug: new AntsSlugInput()
            meta: new AntsMetaGroup()

      onViewShow: (view) ->
        if view.object
          slug = view.object.slug
          addPreviewHeaderButton(view, "/#{ slug }/preview", "/#{ slug }")

    return config
