
push:
	@docker build --platform amd64 -t dgroux/newsteam-io:latest .
	@docker push dgroux/newsteam-io:latest