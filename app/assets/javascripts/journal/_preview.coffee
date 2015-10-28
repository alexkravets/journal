@addPreviewHeaderButton = (view, preview_url, open_url) ->
  if view.object
    view.$linkBtn =$ "<a href='#' class='link open' target='_blank'></a>"
    view.$header.append view.$linkBtn

    update_preview_link = (isDocumentHidden) ->
      if isDocumentHidden
        view.$linkBtn.html('Preview').attr('href', preview_url)
      else
        view.$linkBtn.html('Open').attr('href', open_url)

    view.config.onSaveSuccess = (view) ->
      update_preview_link(view.object.hidden)

    update_preview_link(view.object.hidden)