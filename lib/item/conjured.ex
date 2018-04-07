defmodule Item.Conjured do
  import GildedRose.Utils, only: [update_item: 2]

  @behaviour Item.Strategy

  def update(item), do: update_item(item, 2)
end
