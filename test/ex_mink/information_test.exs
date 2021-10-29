defmodule ExMink.InformationTest do
  use ExMink.DataCase

  alias ExMink.Information

  describe "about" do

    import ExMink.InformationFixtures

    test "list_about/0 returns all about" do
      about = about_fixture()
      assert Information.about() == about
    end
  end


end
