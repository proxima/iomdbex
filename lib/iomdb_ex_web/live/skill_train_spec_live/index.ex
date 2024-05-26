defmodule IomdbExWeb.SkillTrainSpecLive.Index do
  use IomdbExWeb, :live_view

  alias IomdbEx.Guild
  alias IomdbEx.Guild.SkillTrainSpec

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :skill_train_specs, Guild.list_skill_train_specs())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Skill train spec")
    |> assign(:skill_train_spec, Guild.get_skill_train_spec!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Skill train spec")
    |> assign(:skill_train_spec, %SkillTrainSpec{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Skill train specs")
    |> assign(:skill_train_spec, nil)
  end

  @impl true
  def handle_info(
        {IomdbExWeb.SkillTrainSpecLive.FormComponent, {:saved, skill_train_spec}},
        socket
      ) do
    {:noreply, stream_insert(socket, :skill_train_specs, skill_train_spec)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    skill_train_spec = Guild.get_skill_train_spec!(id)
    {:ok, _} = Guild.delete_skill_train_spec(skill_train_spec)

    {:noreply, stream_delete(socket, :skill_train_specs, skill_train_spec)}
  end
end
