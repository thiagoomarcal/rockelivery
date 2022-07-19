defmodule RockeliveryWeb.UsersViewTest do
  use RockeliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Rockelivery.Factory

  alias RockeliveryWeb.UsersView

  test "renders create.json" do
    user = build(:user)

    response = render(UsersView, "create.json", user: user)

    assert %{
             message: "User created!",
             user: %Rockelivery.User{
               address: "Rua das Janaúbas, 167",
               age: 27,
               cep: "11234567",
               cpf: "00101010011",
               email: "jamalwillians.dev@cockmail.com",
               id: "1170427f-21e8-4fcf-af22-940366948a86",
               inserted_at: nil,
               name: "Jamal Willians",
               password: "@pass0rD",
               password_hash: nil,
               updated_at: nil
             }
           } = response
  end
end
