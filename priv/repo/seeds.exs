# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Trollo.Repo.insert!(%Trollo.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Trollo.{Repo, User}

[
  %{
    first_name: "John",
    last_name: "Doe",
    email: "john_doe@gmail.com",
    password: "asdfgh"
  },
]

|> Enum.map(&User.changeset(%User{}, &1))
|> Enum.map(&Repo.insert!(&1))
