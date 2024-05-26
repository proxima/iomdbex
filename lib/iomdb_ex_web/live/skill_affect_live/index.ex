defmodule IomdbExWeb.SkillAffectLive.Index do
  use IomdbExWeb, :live_view

  alias IomdbEx.Equipment
  alias IomdbEx.Equipment.SkillAffect

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :skill_affects, Equipment.list_skill_affects())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Skill affect")
    |> assign(:skill_affect, Equipment.get_skill_affect!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Skill affect")
    |> assign(:skill_affect, %SkillAffect{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Skill affects")
    |> assign(:skill_affect, nil)
  end

  @impl true
  def handle_info({IomdbExWeb.SkillAffectLive.FormComponent, {:saved, skill_affect}}, socket) do
    {:noreply, stream_insert(socket, :skill_affects, skill_affect)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    skill_affect = Equipment.get_skill_affect!(id)
    {:ok, _} = Equipment.delete_skill_affect(skill_affect)

    {:noreply, stream_delete(socket, :skill_affects, skill_affect)}
  end
end
