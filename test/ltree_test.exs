defmodule Hierarch.LtreeTest do
  use ExUnit.Case, async: true
  alias Hierarch.LTree

  doctest LTree

  describe "parent_id/2" do
    test "returns parent_id" do
      parent_id = LTree.parent_id("Top.Science")
      assert parent_id == "Science"
    end

    test "returns nil for the root" do
      parent_id = LTree.parent_id("")
      assert parent_id == nil
    end

    test "returns nil for the root without path" do
      parent_id = LTree.parent_id(nil)
      assert parent_id == nil
    end
  end

  describe "parent_path/1" do
    test "returns the parent_path" do
      assert Hierarch.LTree.parent_path("Top.Science.Astronomy") == "Top.Science"
    end

    test "returns blank string" do
      assert Hierarch.LTree.parent_path("Top") == ""
    end
  end

  describe "root/2" do
    test "returns root_id" do
      root_id = LTree.root_id("Top.Science", "Astronomy")
      assert root_id == "Top"
    end

    test "returns itself if it is the root" do
      root_id = LTree.root_id("", "Top")
      assert root_id == "Top"
    end
  end
end
