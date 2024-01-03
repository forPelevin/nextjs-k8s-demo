# Run the dev environment in Docker.
env: env_down
	docker compose $(COMPOSE_FLAGS) build --no-cache
	docker compose $(COMPOSE_FLAGS) up -d --force-recreate

# Down the Docker dev environment.
env_down:
	docker compose $(COMPOSE_FLAGS) down -v --remove-orphans

docker_registry:
	docker run -d -p 5000:5000 --restart=always --name registry registry:2

local_push_docker_app:
	docker buildx build --build-arg APP_ENV=dev -f ./Dockerfile -t nextjs-k8s-demo .
	docker tag nextjs-k8s-demo localhost:5000/nextjs-k8s-demo:latest
	docker push localhost:5000/nextjs-k8s-demo:latest