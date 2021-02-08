defmodule StudyingElixir.ClientTest do
  use ExUnit.Case

  import Tesla.Mock

  describe "get_repos_by_username" do
    test "when the user has repos, returns the repos" do
      username = "Vractos"

      response = [
        %{"id" => 1, "name" => "my repo 1"},
        %{"id" => 1, "name" => "my repo 1"}
      ]

      expected_response = {:ok, response}

      mock(fn %{method: :get, url: "https://api.github.com/users/Vractos/repos"} ->
        %Tesla.Env{status: 200, body: response}
      end)

      assert StudyingElixir.Client.get_repos_by_username(username) == expected_response
    end
  end
end
