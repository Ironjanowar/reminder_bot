defmodule ReminderBot.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    execute("CREATE EXTENSION IF NOT EXISTS \"uuid-ossp\";")

    create table(:tasks, primary_key: false) do
      add(:task_id, :binary_id, primary_key: true, default: fragment("uuid_generate_v4()"))
      add(:task_name, :string, null: false)
      add(:cron, :string, null: false)
      add(:marked_as_done_at, :naive_datetime, null: false, default: fragment("NOW()"))

      timestamps(default: fragment("NOW()"))
    end
  end
end
