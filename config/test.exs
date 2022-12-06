import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :time_travel_demo, TimeTravelDemoWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "dETY5yyxRfdDdEsxG5ODIz0ZZ8f45MG5CC6NvqJvD0vxkMmfCrbieuWS/ul1/MbT",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
