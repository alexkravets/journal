class @JournalCategories
  constructor: (@title="Categories", @apiPath="/admin") ->
    @showWithParent = true

    @arrayStore = new RailsArrayStore({
      resource: "journal_category"
      path: "#{ @apiPath }/journal_categories"
      reorderable: { positionFieldName: "_position" }
    })

    @formSchema =
      generic:
        type: "group"
        groupClass: "group-panel"
        inputs:
          title:
            type: "string"
            placeholder: "Category Title"
          slug: new AntsSlugInput("#{location.origin}/")
