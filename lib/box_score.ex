defmodule NBA.BoxScore do
  def fetch (id_espn) do
    json_url(id_espn)
    |> HTTPoison.get()
    |> handle_response
  end

  def json_url (id_espn) do
    "http://scores.espn.go.com/nba/gamecast12/master?xhr=1&gameId=#{id_espn}&lang=en&init=true&setType=true&confId=null"
  end

  def handle_response ({:ok, %{body: body, status_code: 200}}) do
    { :ok, body }
  end

  def handle_response ({:ok, %{body: body, status_code: _}}) do
    { :error, body }
  end
end
