defmodule Healthlocker.GoalView do
  use Healthlocker.Web, :view
  use Timex

  def markdown(body) do
    body
    |> Earmark.as_html!
    |> raw
  end

  def pretty_date(date) do
    Date.to_iso8601(date)
  end
end
