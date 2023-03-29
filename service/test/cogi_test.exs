defmodule CogiTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts Cogi.init([])

  test "returns hello world" do
    # Create a test connection
    conn = conn(:get, "/")

    # Invoke the plug
    conn = Cogi.call(conn, @opts)

    # Assert the response and status
    assert conn.state == :sent
    assert conn.status == 200
  end
end
