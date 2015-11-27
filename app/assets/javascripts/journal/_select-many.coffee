@selectMultiple = (input, title_field_name, url) ->
  target = input.config.target

  # Remove name from the select input so it's value is not send to the server
  input.$input.attr('name', '').attr('multiple', true)

  # Attach hidden input to store value
  input.$hiddenInput =$ "<input type='hidden' name='[__LIST__#{ target }]' />"
  input.$el.append input.$hiddenInput

  selectedIds = ->
    $.map input.$input.children(':selected'), (option) -> $(option).attr('value')

  selectedIdsAndNames = ->
    $.map input.$input.children(':selected'), (option) -> { _id: $(option).attr('value'), name: $(option).text() }

  # Add initial values to be shown by select2
  initializeSelectedValues = ->
    for o in input.value
      input.$input.append "<option value='#{ o._id }' selected>#{ o[title_field_name] }</option>"

  # Pass value to hidden input in list format (split ids with ,)
  updateHiddenInputValue = ->
    selectedValues = selectedIds()
    input.$hiddenInput.val( selectedValues.join('|||') )

  # Add handler that updates hidden value on select change (updated by select2)
  input.$input.on 'change', (e) -> updateHiddenInputValue()

  # Override default updateValue method
  input.updateValue = (value) ->
    input.value = value
    input.$input.html('')
    initializeSelectedValues()
    updateHiddenInputValue()

    # @TODO: check if need to reset select2 plugin while history is used

  # Override hash method to cache values properly
  input.hash = (hash={}) ->
    hash[@config.klassName] = selectedIdsAndNames()
    return hash

  # These methods run while initialization only
  initializeSelectedValues()
  updateHiddenInputValue()

  # Select2 plugin configuration
  input.config.pluginOptions =
    placeholder: input.config.placeholder
    multiple:    true
    width:       '100%'
    ajax:
      url:      url
      dataType: 'json'
      delay:    250
      cache:    true
      minimumInputLength: 2
      data: (params) -> { search: params.term, page: 1, perPage: 20 }
      processResults: (data, page) -> { results: $.map data, (i) -> { id: i._id, text: i[title_field_name] } }
