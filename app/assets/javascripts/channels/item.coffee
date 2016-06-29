
App.item = App.cable.subscriptions.create "ItemChannel",
  connected: ->
    # Called when the subscription is ready for use on the server


  disconnected: ->
    # Called when the subscription has been terminated by the server


  received: (data) ->
    $('#new_item').append data['data']



  new_item: (name,catalog) ->
    @perform 'new_item', name: name, catalog: catalog


$(document).ready ->
  $('#item_save').click ->
    App.item.new_item($('#item_name').val(), $('#item_catalog').val())
    $('.new_item_field').val('')