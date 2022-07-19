defmodule Rockelivery.Users.CreateTest do
  use Rockelivery.DataCase, async: true

  import Rockelivery.Factory

  alias Rockelivery.Users.Create
  alias Rockelivery.{Error, User}

  describe "call/1" do
    test "when all params are valid, returns the user" do
      response =
        build(:user_params)
        |> Create.call()

      assert {:ok, %User{}} = response
    end

    test "when there are invalid params, returns an error" do
      params = build(:user_params, %{age: 17, email: "examplemail.com"})
      response = Create.call(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        email: ["has invalid format"]
      }

      assert {:error, %Error{status: :bad_request, result: changeset}} = response
      assert errors_on(changeset) == expected_response
    end
  end
end
