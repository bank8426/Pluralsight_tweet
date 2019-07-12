defmodule FileReaderTest do
  use ExUnit.Case
  import PluralsightTweet.FileReader
  import Mock

  doctest PluralsightTweet.FileReader
  test "Passing a file should return a string" do
    str = get_strings_to_tweet(Path.join("#{:code.priv_dir(:pluralsight_tweet)}","sample.txt"))

    assert str != nil
  end

  test "Will not return string longer than 140 characters" do
    str = get_strings_to_tweet(Path.join("#{:code.priv_dir(:pluralsight_tweet)}","/test/too_long.txt"))

    assert str == "short string"
  end

  test "An empty string should return an empty string" do
    with_mock File, [read!: fn(_) -> "" end] do
      str = pick_string("")
      assert str == ""
    end
  end

  test "String should trimeed" do
    with_mock File, [read!: fn(_) -> " ABC " end] do
      str = get_strings_to_tweet("doens't exist.txt")
      assert str == "ABC"
    end
  end
end
