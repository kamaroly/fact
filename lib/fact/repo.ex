defmodule Fact.Repo do
  use Ecto.Repo,
    otp_app: :fact,
    adapter: Ecto.Adapters.MyXQL
end
