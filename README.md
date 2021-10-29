# ExMink

Sample Elixir Application

## Docker Build
    
    docker build -t cdesch/ex_mink .
    docker build -t cdesch/ex_mink . -f Dockerfile.prod
    docker push cdesch/ex_mink
    docker-compose up
    docker-compose -f docker-compose-db.yaml up
    docker-compose -f docker-compose-db.yaml up --force-recreate db

    docker-compose run --rm web mix ecto.create
    docker-compose run --rm web mix ecto.migrate


    iex -S mix phx.server


    kubectl apply -k deployments/overlays/dev
    kubectl delete -k deployments/overlays/dev

## Resources


    https://github.com/akoutmos/prom_ex

    https://shyr.io/blog/kubernetes-health-probes-elixir
    https://blog.lelonek.me/liveness-and-readiness-probes-for-kubernetes-in-phoenix-application-890e24d0737e
    https://github.com/KamilLelonek/healthchex


    mix phx.gen.html CMS About abouts content:string --no-context --no-schema


    mix phx.gen.json Information About about name:string version:string status:string --web Api --no-context --no-schema
    mix phx.gen.json Information About about name:string version:string status:string --web Api --no-schema
