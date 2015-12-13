class @JournalCategories
  constructor: (title="Categories", @apiPath="/admin") ->
    config =
      title: title

      showWithParent: true

      arrayStore: new RailsArrayStore({
        resource: "journal_category"
        path: "#{ @apiPath }/journal_categories"
        reorderable: { positionFieldName: "_position" }
      })

      formSchema:
        title: { type: "string" }

    return config
