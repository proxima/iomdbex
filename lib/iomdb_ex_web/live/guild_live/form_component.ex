defmodule IomdbExWeb.GuildLive.FormComponent do
  use IomdbExWeb, :live_component

  alias IomdbEx.Guilds

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage guild records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="guild-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:name]} type="text" label="Name" />
        <.input field={@form[:location]} type="text" label="Location" />
        <.input field={@form[:levels]} type="number" label="Levels" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Guild</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{guild: guild} = assigns, socket) do
    changeset = Guilds.change_guild(guild)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"guild" => guild_params}, socket) do
    changeset =
      socket.assigns.guild
      |> Guilds.change_guild(guild_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"guild" => guild_params}, socket) do
    save_guild(socket, socket.assigns.action, guild_params)
  end

  defp save_guild(socket, :edit, guild_params) do
    case Guilds.update_guild(socket.assigns.guild, guild_params) do
      {:ok, guild} ->
        notify_parent({:saved, guild})

        {:noreply,
         socket
         |> put_flash(:info, "Guild updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_guild(socket, :new, guild_params) do
    case Guilds.create_guild(guild_params) do
      {:ok, guild} ->
        notify_parent({:saved, guild})

        {:noreply,
         socket
         |> put_flash(:info, "Guild created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
