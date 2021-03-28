defmodule Todo.App do
  use Commanded.Application,
    otp_app: :todo

  router(Todo.Router)
end
