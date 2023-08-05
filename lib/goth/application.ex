defmodule Goth.Application do
  @moduledoc false
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Registry, keys: :unique, name: Goth.Registry},
      Goth.TokenStore
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Goth.Supervisor)
  end
end
