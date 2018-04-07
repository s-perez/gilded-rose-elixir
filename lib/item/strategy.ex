defmodule Item.Strategy do
  @callback update(item :: %Item{}) :: %Item{}
end
