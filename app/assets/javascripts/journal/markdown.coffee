# -----------------------------------------------------------------------------
# Author: Alexander Kravets <alex@slatestudio.com>,
#         Slate Studio (http://www.slatestudio.com)
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# INPUT MARKDOWN
# -----------------------------------------------------------------------------
# Markdown input supports compilation to html.
#
# Config options:
#   label         - Input label
#   htmlFieldName - Input name for generated HTML content
#
# Input config example:
#   body_md: { type: 'markdown', label: 'Article', htmlFieldName: 'body_html' }
#
# Dependencies:
#= require vendor/marked
#
# -----------------------------------------------------------------------------

class @InputMarkdown extends InputText

  # PRIVATE ===============================================

  _add_html_hidden_input: ->
    @$inputHtml =$ "<input type='hidden' name='[#{ @config.htmlFieldName }]' />"
    if @object
      @$inputHtml.val(@object[@config.htmlFieldName])
    @$el.append @$inputHtml

    @$input.on 'change', (e) =>
      html = marked(@$input.val())
      @$inputHtml.val(html)
      @$inputHtml.trigger('change')


  # PUBLIC ================================================

  initialize: ->
    @_add_html_hidden_input()

    @config.beforeInitialize?(this)
    @$input.textareaAutoSize()
    @config.onInitialize?(this)


chr.formInputs['markdown'] = InputMarkdown




