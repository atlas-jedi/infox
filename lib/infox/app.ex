defmodule Infox.App do
  use Commanded.Application,
    otp_app: :infox,
    event_store: [adapter: Commanded.EventStore.Adapters.EventStore]

  router Infox.Router
end
