# ExMink

docker build -t cdesch/ex_mink .

docker-compose up

docker-compose run --rm web mix ecto.create
docker-compose run --rm web mix ecto.migrate


iex -S mix phx.server


## Resources


    https://github.com/akoutmos/prom_ex

    https://shyr.io/blog/kubernetes-health-probes-elixir
    https://blog.lelonek.me/liveness-and-readiness-probes-for-kubernetes-in-phoenix-application-890e24d0737e
    https://github.com/KamilLelonek/healthchex