defmodule ReactExperiment.Group do
  def new do
    %{
      word: next_word(),
      guesses: [],
    }
  end

  def client_view(group) do
    ws = String.graphemes(group.word)
    gs = group.guesses
    # pass in newly ordered array of songs here
    %{
      skel: skeleton(ws, gs),
      goods: Enum.filter(gs, &(Enum.member?(ws, &1))),
      bads: Enum.filter(gs, &(!Enum.member?(ws, &1))),
      max: max_guesses(),
    }
  end

  def skeleton(word, guesses) do
    Enum.map word, fn cc ->
      if Enum.member?(guesses, cc) do
        cc
      else
        "_"
      end
    end
  end

  def guess(group, letter) do
    if letter == "z" do
      raise "That's not a real letter"
    end

    gs = group.guesses
    |> MapSet.new()
    |> MapSet.put(letter)
    |> MapSet.to_list

    Map.put(group, :guesses, gs)
  end

  def max_guesses do
    12
  end

  def next_word do
    words = ~w(
      dog cat horse frog snake
      muffin cookie pizza sandwich
      house car train clock
      parsnip marshmallow
    )
    Enum.random(words)
  end
end
