defmodule IomdbExWeb.Router do
  use IomdbExWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {IomdbExWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", IomdbExWeb do
    pipe_through :browser

    get "/", PageController, :home

    live "/equipment_monsters", MonsterLive.Index, :index
    live "/equipment_monsters/new", MonsterLive.Index, :new
    live "/equipment_monsters/:id/edit", MonsterLive.Index, :edit
    live "/equipment_monsters/:id", MonsterLive.Show, :show
    live "/equipment_monsters/:id/show/edit", MonsterLive.Show, :edit

    live "/equipment_pieces", PieceLive.Index, :index
    live "/equipment_pieces/new", PieceLive.Index, :new
    live "/equipment_pieces/:id/edit", PieceLive.Index, :edit
    live "/equipment_pieces/:id", PieceLive.Show, :show
    live "/equipment_pieces/:id/show/edit", PieceLive.Show, :edit

    live "/equipment_mob_strategies", MonsterStrategyLive.Index, :index
    live "/equipment_mob_strategies/new", MonsterStrategyLive.Index, :new
    live "/equipment_mob_strategies/:id/edit", MonsterStrategyLive.Index, :edit
    live "/equipment_mob_strategies/:id", MonsterStrategyLive.Show, :show
    live "/equipment_mob_strategies/:id/show/edit", MonsterStrategyLive.Show, :edit

    live "/guilds", GuildLive.Index, :index
    live "/guilds/new", GuildLive.Index, :new
    live "/guilds/:id/edit", GuildLive.Index, :edit
    live "/guilds/:id", GuildLive.Show, :show
    live "/guilds/:id/show/edit", GuildLive.Show, :edit

    live "/skill_train_specs", SkillTrainSpecLive.Index, :index
    live "/skill_train_specs/new", SkillTrainSpecLive.Index, :new
    live "/skill_train_specs/:id/edit", SkillTrainSpecLive.Index, :edit
    live "/skill_train_specs/:id", SkillTrainSpecLive.Show, :show
    live "/skill_train_specs/:id/show/edit", SkillTrainSpecLive.Show, :edit

    live "/spell_train_specs", SpellTrainSpecLive.Index, :index
    live "/spell_train_specs/new", SpellTrainSpecLive.Index, :new
    live "/spell_train_specs/:id/edit", SpellTrainSpecLive.Index, :edit
    live "/spell_train_specs/:id", SpellTrainSpecLive.Show, :show
    live "/spell_train_specs/:id/show/edit", SpellTrainSpecLive.Show, :edit

    live "/races", RaceLive.Index, :index
    live "/races/new", RaceLive.Index, :new
    live "/races/:id/edit", RaceLive.Index, :edit
    live "/races/:id", RaceLive.Show, :show
    live "/races/:id/show/edit", RaceLive.Show, :edit

    live "/resistance_affects", ResistanceAffectLive.Index, :index
    live "/resistance_affects/new", ResistanceAffectLive.Index, :new
    live "/resistance_affects/:id/edit", ResistanceAffectLive.Index, :edit
    live "/resistance_affects/:id", ResistanceAffectLive.Show, :show
    live "/resistance_affects/:id/show/edit", ResistanceAffectLive.Show, :edit

    live "/skill_affects", SkillAffectLive.Index, :index
    live "/skill_affects/new", SkillAffectLive.Index, :new
    live "/skill_affects/:id/edit", SkillAffectLive.Index, :edit
    live "/skill_affects/:id", SkillAffectLive.Show, :show
    live "/skill_affects/:id/show/edit", SkillAffectLive.Show, :edit

    live "/spell_affects", SpellAffectLive.Index, :index
    live "/spell_affects/new", SpellAffectLive.Index, :new
    live "/spell_affects/:id/edit", SpellAffectLive.Index, :edit
    live "/spell_affects/:id", SpellAffectLive.Show, :show
    live "/spell_affects/:id/show/edit", SpellAffectLive.Show, :edit

    live "/stat_affects", StatAffectLive.Index, :index
    live "/stat_affects/new", StatAffectLive.Index, :new
    live "/stat_affects/:id/edit", StatAffectLive.Index, :edit
    live "/stat_affects/:id", StatAffectLive.Show, :show
    live "/stat_affects/:id/show/edit", StatAffectLive.Show, :edit

    live "/weapon_damage_affects", WeaponDamageAffectLive.Index, :index
    live "/weapon_damage_affects/new", WeaponDamageAffectLive.Index, :new
    live "/weapon_damage_affects/:id/edit", WeaponDamageAffectLive.Index, :edit
    live "/weapon_damage_affects/:id", WeaponDamageAffectLive.Show, :show
    live "/weapon_damage_affects/:id/show/edit", WeaponDamageAffectLive.Show, :edit

    live "/equipment_piece_lists", ListLive.Index, :index
    live "/equipment_piece_lists/new", ListLive.Index, :new
    live "/equipment_piece_lists/:id/edit", ListLive.Index, :edit
    live "/equipment_piece_lists/:id", ListLive.Show, :show
    live "/equipment_piece_lists/:id/show/edit", ListLive.Show, :edit

    live "/equipment_piece_list_entries", EntryLive.Index, :index
    live "/equipment_piece_list_entries/new", EntryLive.Index, :new
    live "/equipment_piece_list_entries/:id/edit", EntryLive.Index, :edit
    live "/equipment_piece_list_entries/:id", EntryLive.Show, :show
    live "/equipment_piece_list_entries/:id/show/edit", EntryLive.Show, :edit
  end

  # Other scopes may use custom stacks.
  # scope "/api", IomdbExWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:iomdb_ex, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: IomdbExWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
