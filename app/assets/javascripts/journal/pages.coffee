class @JournalPages
  constructor: (title='Pages', apiPath='/admin') ->
    config =
      title: title

      arrayStore: new RailsArrayStore({
        resource:    'journal_page'
        path:        "#{ apiPath }/journal_pages"
        reorderable: { positionFieldName: '_position' }
        searchable:  true
      })

      formSchema:
        hidden:        { type: 'switch',   label: 'Hidden' }
        title:         { type: 'string',   placeholder: 'Page Title' }
        body_markdown: { type: 'markdown2', htmlFieldName: 'body_html', placeholder: 'Content' }

    return config