# build and push
# expect GOCTL_VERSION from environment
docker-build-push:
	docker buildx build \
	--build-arg GOCTL_VERSION=${GOCTL_VERSION} \
	--platform=linux/amd64,linux/arm64 \
	-t jjkoh95/goctl:${GOCTL_VERSION} \
	-o type=registry \
	.
	docker buildx build \
	--build-arg GOCTL_VERSION=${GOCTL_VERSION} \
	--platform=linux/amd64,linux/arm64 \
	-t jjkoh95/goctl:latest \
	-o type=registry \
	.
