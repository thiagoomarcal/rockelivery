defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.User

  def user_params_factory do
    %{
      name: "Jamal Willians",
      age: 27,
      address: "Rua das Janaúbas, 167",
      cep: "11234567",
      cpf: "00101010011",
      email: "jamalwillians.dev@cockmail.com",
      password: "@pass0rD"
    }
  end

  def user_factory do
    %User{
      name: "Jamal Willians",
      age: 27,
      address: "Rua das Janaúbas, 167",
      cep: "11234567",
      cpf: "00101010011",
      email: "jamalwillians.dev@cockmail.com",
      password: "@pass0rD",
      id: "1170427f-21e8-4fcf-af22-940366948a86"
    }
  end
end
