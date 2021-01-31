defmodule ReminderBot.Bot do
  @bot :reminder_bot

  use ExGram.Bot,
    name: @bot,
    setup_commands: true

  command("start", description: "Says hi!")

  middleware(ExGram.Middleware.IgnoreUsername)

  def bot(), do: @bot

  def handle({:command, :start, _msg}, context) do
    answer(context, "Hi!")
  end
end
