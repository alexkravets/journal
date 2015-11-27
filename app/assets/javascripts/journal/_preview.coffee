@addPreviewHeaderButton = (view, preview_url, open_url) ->
  if view.object
    view.$linkBtn =$ "<a href='#' class='link preview' target='_blank'></a>"
    view.$header.append view.$linkBtn

    update_preview_link = (isDocumentHidden) ->
      html = "<i class='fa fa-fw fa-external-link'></i>  "
      if isDocumentHidden
        view.$linkBtn.attr('href', preview_url)
        html += "Preview"
      else
        view.$linkBtn.attr('href', open_url)
        html += "View"
      view.$linkBtn.html(html)

    view.config.onSaveSuccess = (view) ->
      update_preview_link(view.object.hidden)

    update_preview_link(view.object.hidden)