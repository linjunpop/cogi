defmodule Cogi do
  use Plug.Builder

  plug(Plug.Logger)

  plug(Plug.Parsers,
    parsers: [:urlencoded, :json],
    json_decoder: Jason
  )

  plug(:cogi_service, upper: true)

  def cogi_service(conn, opts) do
    name = conn.params["name"]
    response = %{name: name, ciao: "hello"}
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Jason.encode!(response))
  end
end