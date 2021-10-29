FROM elixir:1.12-alpine

RUN mix local.hex --force
WORKDIR /app

COPY mix.exs .
COPY mix.lock .

RUN mix deps.get
# RUN mkdir assets

# COPY assets/package.json assets
# COPY assets/package-lock.json assets

CMD mix phx.server