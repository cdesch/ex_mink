defmodule ExMink.Util do
  @moduledoc """
  The Information context.
  """


  def atom_to_string_map(map) do
    Map.new(map, fn {key, value} -> {Atom.to_string(key), value} end)
  end

end
