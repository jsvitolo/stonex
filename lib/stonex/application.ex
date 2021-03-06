defmodule Stonex.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      Plug.Cowboy.child_spec(Application.fetch_env!(:stonex, StonexWeb.Endpoint)),
      {Stonex.Repo, []}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Stonex.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
