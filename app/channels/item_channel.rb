# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ItemChannel < ApplicationCable::Channel
  def subscribed
    stream_from "item_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def new_item(item)
    @item = Item.new
    @item.name = item['name']
    @item.catalog = item['catalog']
    @item.save!
    ActionCable.server.broadcast 'item_channel', data: render_recive(@item)
  end
  private
    def render_recive(item)
      ApplicationController.renderer.render(partial: 'items/item', locals: {item: item})
    end

end
