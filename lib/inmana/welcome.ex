defmodule Inmana.Welcome do
  def welcome(%{"name" => name, "age" => age}) do
    age = age |> String.to_integer()

    name
    |> String.trim()
    |> String.downcase()
    |> evaluate(age)
  end

  defp evaluate(name, age)

  defp evaluate("banana", 42) do
    {:ok, "You are the chosen banana"}
  end

  defp evaluate(name, age) when age > 18 do
    {:ok, "Seja bem vindo #{name}!"}
  end

  defp evaluate(_name, age) when age < 18 do
    {:error, "You shall not pass!"}
  end
end
