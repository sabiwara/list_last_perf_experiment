defmodule ListLastPerfExperiment do
  @moduledoc """
  An experiment to intended to improve the performance of List.last/1.
  """

  @doc """
  Identical implementation to List.last/1.
  """
  def list_last_orig([]), do: nil
  def list_last_orig([last]), do: last
  def list_last_orig([_ | rest]), do: list_last_orig(rest)

  @doc """
  Implementation that skips 8 elements at a time.
  """
  def list_last8([_, _, _, _, _, _, _, _ | [_ | _] = tail]) do
    # In the function head above we "skip" 8 elements at a time
    # which reduces the number of recursions and increases
    # performance for lists with length greater than 8.
    # The `[_ | _] = tail` pattern keeps us from returning nil
    # when the length of the list is divisible by 8 and keeps
    # us from having to build any lists at all.
    list_last8(tail)
  end

  def list_last8([]), do: nil
  def list_last8([last]), do: last
  def list_last8([_ | rest]), do: list_last8(rest)


  @doc """
  Implementation tagged with with `@compile {:inline, [list_last_inline: 1]}`.
  """
  @compile {:inline, [list_last_inline: 1]}
  def list_last_inline([]), do: nil
  def list_last_inline([head]), do: head
  def list_last_inline([_ | tail]), do: list_last_inline(tail)

  @doc """
  A List.last implementation that uses Enum.reverse followed by hd.
  """
  def enum_reverse_hd([]), do: nil
  def enum_reverse_hd(list), do: list |> Enum.reverse() |> hd()

  def bench do
    Benchee.run(
      %{
        "enum_reverse_hd" => &enum_reverse_hd/1,
        "list_last_orig" => &list_last_orig/1,
        "list_last8" => &list_last8/1,
        "list_last_inline" => &list_last_inline/1
      },
      inputs: %{
        "empty" => [],
        "one" => [1],
        "five" => Enum.to_list(1..5),
        "eight" => Enum.to_list(1..8),
        "1h" => Enum.to_list(1..100),
        "1k" => Enum.to_list(1..1_000),
        "10k" => Enum.to_list(1..10_000),
        "100k" => Enum.to_list(1..100_000)
      },
      time: 10,
      memory_time: 2
    )

    :ok
  end
end
