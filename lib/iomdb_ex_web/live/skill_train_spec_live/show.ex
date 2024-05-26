defmodule IomdbExWeb.SkillTrainSpecLive.Show do
  use IomdbExWeb, :live_view

  alias IomdbEx.Guild

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:skill_train_spec, Guild.get_skill_train_spec!(id))}
  end

  defp page_title(:show), do: "Show Skill train spec"
  defp page_title(:edit), do: "Edit Skill train spec"
end
