@addPreviewHeaderButton = (view, preview_url, view_url) ->
  if view.object
    view.$linkBtn =$ "<a href='#' class='link' target='_blank'></a>"
    view.$header.append view.$linkBtn

    update_preview_link = (isDocumentHidden) ->
      html = "<i class='fa fa-fw fa-external-link'></i>  "
      if isDocumentHidden
        view.$linkBtn.attr('href', preview_url)
        view.$linkBtn.addClass("link-preview")
      else
        view.$linkBtn.attr('href', view_url)
        view.$linkBtn.addClass("link-view")

      view.$linkBtn.html(html)

    view.config.onSaveSuccess = (view) ->
      update_preview_link(view.object.hidden)

    update_preview_link(view.object.hidden)