FROM cdesch/elixir-base:1.12-alpine

COPY mix.exs .
COPY mix.lock .

RUN mix deps.get
# RUN mkdir assets

# COPY assets/package.json assets
# COPY assets/package-lock.json assets

CMD mix phx.server