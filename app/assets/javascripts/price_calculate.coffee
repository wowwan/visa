$(document).on 'turbolinks:load', ->
  $cat2= $('#category2')
  $cat2.on 'change', ->

    params = {visa_id: 2}
    $.get '/visas', params, (data) ->
      $('#label1').html data
      return
    return
  return

  
    
    

