defmodule ListLastPerfExperimentTest do
  use ExUnit.Case
  doctest ListLastPerfExperiment

  test "impls work" do
    test_impl(&ListLastPerfExperiment.enum_reverse_hd/1)
    test_impl(&ListLastPerfExperiment.list_last_orig/1)
    test_impl(&ListLastPerfExperiment.list_last8/1)
    test_impl(&ListLastPerfExperiment.list_last_inline/1)
  end

  defp test_impl(func) do
    # make sure it returns nil for []
    assert func.([]) == nil
    for n <- 1..100 do
      assert func.(Enum.to_list(1..n))
    end
  end
end
