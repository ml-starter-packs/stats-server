build: Dockerfile
	docker build -t stats-server \
		-f Dockerfile .

run: build
	docker run --rm -ti \
		-p 8787:8787 \
		-p 3838:3838 \
		-p 13939:13939 \
		-p 3939:3939 \
		stats-server
