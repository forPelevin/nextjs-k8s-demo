NAMESPACE=default
ENV=local

app:
	helm upgrade --install nextjs-k8s-demo ./app --namespace=$(NAMESPACE) --create-namespace \
		-f app/values.$(ENV).yaml

env_down:
	helm delete nextjs-k8s-demo --namespace=$(NAMESPACE)
