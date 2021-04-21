defmodule Inmana.Supplies.ExpirationEmail do
  alias Bamboo.Email
  alias Inmana.Supply

  def create(email, supplies) do
    Email.new_email()
    |> Email.from(["the_one_and_only@dog.com"])
    |> Email.to([email])
    |> Email.subject("Supplies that are about to expire!")
    |> Email.text_body(email_text(supplies))
  end

  defp email_text(supplies) do
    initial_text = "---------- Supplies that are about to expire ----------\n"

    Enum.reduce(supplies, initial_text, &email_text_reducer/2)
  end

  defp email_text_reducer(supply, msg) do
    msg <> supply_to_text(supply)
  end

  defp supply_to_text(%Supply{
         description: description,
         responsible: responsible,
         expiration_date: expiration_date
       }) do
    "#{description} expires #{expiration_date}, the responsible for it is #{responsible}\n"
  end
end
