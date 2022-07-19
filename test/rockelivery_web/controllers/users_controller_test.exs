defmodule RockeliveryWeb.UsersControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  import Rockelivery.Factory

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = %{
        "name" => "Jamal Willians",
        "age" => 27,
        "address" => "Rua das Janaúbas, 167",
        "cep" => "11234567",
        "cpf" => "00101010011",
        "email" => "jamalwillians.dev@cockmail.com",
        "password" => "@pass0rD"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "User created!",
               "user" => %{
                 "address" => "Rua das Janaúbas, 167",
                 "age" => 27,
                 "cpf" => "00101010011",
                 "email" => "jamalwillians.dev@cockmail.com",
                 "id" => _id
               }
             } = response
    end

    test "when an error occurs, returns the error", %{conn: conn} do
      params = %{
        "name" => "Jamal Willians",
        "age" => 27,
        "address" => "Rua das Janaúbas, 167",
        "cep" => "11234567",
        "cpf" => "00101010011"
      }

      expected_response = %{
        "message" => %{"email" => ["can't be blank"], "password" => ["can't be blank"]}
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end
  end

  describe "delete/2" do
    test "when there is a user with the given id, deletes the user.", %{conn: conn} do
      id = "1170427f-21e8-4fcf-af22-940366948a86"

      insert(:user)

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end
  end
end
