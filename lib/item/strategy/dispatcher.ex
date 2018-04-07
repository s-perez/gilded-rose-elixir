defmodule Item.Strategy.Dispatcher do
  @spec update_item(%Item{}) :: %Item{}
  def update_item(%Item{name: "Sulfuras, Hand of Ragnaros"} = item), do:  Item.Sulfuras.update(item)
  def update_item(%Item{name: "Conjured"} = item), do: Item.Conjured.update(item)
  def update_item(%Item{name: "Backstage passes to a TAFKAL80ETC concert"} = item), do: Item.BackstagePasses.update(item)
  def update_item(%Item{name: "Aged Brie"} = item), do: Item.Brie.update(item)
  def update_item(item), do: Item.Generic.update(item)
end
