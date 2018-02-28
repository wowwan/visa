$(document).on 'turbolinks:load', ->
  $cat = $('#category1')
  $subcat = $('.subcat')
  $cat.on 'change', ->

    _rel = $(this).val()
    content = $('<%= escape_javascript(render "visa_prices") %>')

    $subcat.find('option').attr 'style', ''
    $subcat.val ''
    if !_rel
      return $subcat.prop('disabled', true)
    $subcat.find('[rel=' + _rel + ']').show()
    $subcat.prop 'disabled', false
    $('#sum').html(content)
    return
  return
  

