defmodule Item.Strategy.Dispatcher do
  @spec update_item(%Item{}) :: %Item{}
  def update_item(%Item{name: "Sulfuras, Hand of Ragnaros"} = item), do:  Item.Strategy.Sulfuras.update(item)
  def update_item(%Item{name: "Conjured"} = item), do: Item.Strategy.Conjured.update(item)
  def update_item(%Item{name: "Backstage passes to a TAFKAL80ETC concert"} = item), do: Item.Strategy.BackstagePasses.update(item)
  def update_item(%Item{name: "Aged Brie"} = item), do: Item.Strategy.Brie.update(item)
  def update_item(item), do: Item.Strategy.Generic.update(item)
end
