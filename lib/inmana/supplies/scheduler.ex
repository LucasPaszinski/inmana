defmodule Inmana.Supplies.Scheduler do
  alias Inmana.Supplies.ExpirationNotification
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil)
  end

  @impl true
  def init(state \\ nil) do
    ExpirationNotification.send()

    schedule_notification()

    {:ok, state}
  end

  @impl true
  def handle_info(:generate, state) do
    ExpirationNotification.send()

    schedule_notification()

    {:noreply, state}
  end

  defp schedule_notification do
    Process.send_after(self(), :generate, 1000 * 10)
  end
end
