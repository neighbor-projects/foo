build-container:
	docker build -t neighbor/foo:$(V) -t neighbor/foo:latest .

release: build-container
	docker push neighbor/foo:$(V)
	docker push neighbor/foo:latest

deploy:
	kubectl apply -f deploy/secret.yaml
	kubectl apply -f deploy/deployment.yaml

setup: deploy
