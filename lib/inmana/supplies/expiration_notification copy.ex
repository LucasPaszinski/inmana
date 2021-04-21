defmodule Inmana.Supplies.ExpirationNotification do
  alias Inmana.Mailer
  alias Inmana.Supplies.{ExpirationEmail, GetByExpirationDate}

  def send() do
    GetByExpirationDate.call()
    |> Enum.each(&send_email/1)
  end

  defp send_email({email, supplies}) do
    email
    |> ExpirationEmail.create(supplies)
    |> Mailer.deliver_now!()
  end
end
