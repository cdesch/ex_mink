# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ExMink.Repo.insert!(%ExMink.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
# alias NimbleCSV.RFC4180, as: CSV

# file = './priv/repo/breeds.csv'

# file
# |> File.stream!()
# |> CSV.parse_stream(skip_headers: false)
# |> Enum.fetch!(0)
# |> Enum.with_index()
# |> Map.new(fn {val, num} -> {num, val} end)


defmodule ExMink.Seeds do

  def convert_to_float(row, key) do
    Map.update!(row, key, fn x -> parse_string(x) end)
  end

  # Put a zero in for missing values
  def parse_string(value) do
    case Float.parse(value) do
      {value, exp} -> value
      :error -> 0.0
    end
  end

  # def fix_amount(%{transaction_type: "debit"} = row) do
  #   Map.update!(row,:amount,&("-"<>&1))
  # end


  def store_it(row) do
    changeset = ExMink.Animals.Canine.changeset(%ExMink.Animals.Canine{}, row)
    ExMink.Repo.insert!(changeset)
  end

end
file = './priv/repo/breeds.csv'

File.stream!(file)
  |> Stream.drop(1)
  |> CSV.decode(headers: [:breed, :weight, :average_weight_pounds, :average_weight_kg, :size_category])
  |> Enum.each(fn {:ok, map} ->
    IO.inspect map
    map
      |> ExMink.Seeds.convert_to_float(:average_weight_pounds)
      |> ExMink.Seeds.convert_to_float(:average_weight_kg)
      |> IO.inspect
      |> ExMink.Seeds.store_it
  end)

# File.stream!(file)
#   |> Stream.drop(1)
#   |> CSV.decode(headers: [:breed, :weight, :average_weight_pounds, :average_weight_kg, :size_category])
#   |> IO.inspect
  # |> ExMink.Seeds.convert_to_float(:average_weight_pounds)
  # |> Enum.each(&ExMink.Seeds.store_it/1)
