# literate-waffle
Phoenix/Elixir learning environment


docker volume create todo-postgres

docker container run --name postgres -p 5432:5432 \
  -e POSTGRES_PASSWORD=postgres \
  -v todo-postgres:/var/lib/postgresql/data \
  --rm postgres:11-alpine