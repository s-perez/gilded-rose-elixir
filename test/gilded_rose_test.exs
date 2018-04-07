defmodule GildedRoseTest do
  use ExUnit.Case
  use ExUnit.Parameterized

  import Item

  defp assert_equals(actual, expected) do
    assert actual == expected
  end

  test_with_params "Item's value decreases with time",
    fn (name, initial_sell_in, initial_quality, final_sell_in, final_quality) ->
      [%Item{name: name, sell_in: initial_sell_in, quality: initial_quality}]
        |> GildedRose.update_quality
        |> assert_equals([%Item{name: name, sell_in: final_sell_in, quality: final_quality}])
    end do
      [
        "Random item's quality degrades": {"random_item", 5, 10, 4, 9},
        "Expired item's quality degrades twice as fast": {"expired_item", 0, 10, -1, 8},
        "Random item's quality cannot be below 0": {"random_item", 5, 0, 4, 0},
        "Aged Brie increases in quality": {"Aged Brie", 5, 10, 4, 11},
        "Aged Brie increases in quality twice as fast if expired": {"Aged Brie", 0, 10, -1, 12},
        "Quality never above 50": {"Aged Brie", 0, 50, -1, 50},
        "Sulfuras never degrades or has to be sold": {"Sulfuras, Hand of Ragnaros", 0, 80, 0, 80},
        "Backstage Passes increase their value": {"Backstage passes to a TAFKAL80ETC concert", 15, 10, 14, 11},
        "Backstage Passes increase their value by 2": {"Backstage passes to a TAFKAL80ETC concert", 10, 10, 9, 12},
        "Backstage Passes increase their value by 3": {"Backstage passes to a TAFKAL80ETC concert", 5, 10, 4, 13},
        "Backstage Passes drop to 0": {"Backstage passes to a TAFKAL80ETC concert", 0, 20, -1, 0},
      ]
  end
end
