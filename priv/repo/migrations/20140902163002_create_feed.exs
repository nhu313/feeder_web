defmodule Feeder.Repo.Migrations.CreateFeed do
  use Ecto.Migration

  def up do
    "CREATE TABLE feeds(id serial primary key, url varchar(256), type varchar(4))"
  end

  def down do
    "DROP TABLE feeds"
  end
end
