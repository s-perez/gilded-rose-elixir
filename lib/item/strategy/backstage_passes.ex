defmodule Item.Strategy.BackstagePasses do
  import GildedRose.Utils, only: [update_item: 2]

  @behaviour Item.Strategy

  def update(%Item{sell_in: sell_in} = item) when sell_in <= 0, do: %{item | sell_in: sell_in - 1, quality: 0}
  def update(%Item{sell_in: sell_in} = item) when sell_in <= 5, do: update_item(item, -3)
  def update(%Item{sell_in: sell_in} = item) when sell_in <= 10, do: update_item(item, -2)
  def update(item), do: update_item(item, -1)
end
