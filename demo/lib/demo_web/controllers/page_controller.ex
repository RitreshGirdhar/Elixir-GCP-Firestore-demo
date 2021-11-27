defmodule Demo.FirestoreWeb.PageController do
  use Demo.FirestoreWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end


  def test_create_order(conn, _params) do
    IO.puts "foo" ; :timer.sleep(60000); IO.puts "bar"
    conn
    |> put_status(:no_content)
    |> text("")
  end

end
