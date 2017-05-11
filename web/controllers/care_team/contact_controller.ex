defmodule Healthlocker.CareTeam.ContactController do
  use Healthlocker.Web, :controller

  def show(conn, _params) do
    service_user = if conn.assigns.current_user.slam_id do
      conn.assigns.current_user
    else
      service_user_for(conn.assigns.current_user)
    end

    conn
    |> assign(:service_user, service_user)
    |> assign(:care_team, care_team_for(service_user))
    |> render("show.html")
  end

  defp service_user_for(carer) do
    carer = carer |> Repo.preload(:caring)
    [service_user | _] = carer.caring
    service_user
  end

  defp care_team_for(service_user) do
    query = from e in Healthlocker.EPJSTeamMember,
      where: e."Patient_ID" == ^service_user.slam_id,
      select: e."Staff_ID"

    clinician_ids = Healthlocker.ReadOnlyRepo.all(query)

    query = from c in Healthlocker.EPJSClinician,
      where: c.id in ^clinician_ids

    Healthlocker.ReadOnlyRepo.all(query)
  end
end