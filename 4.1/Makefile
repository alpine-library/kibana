.PHONY:	build push

TAG = latest

build:
	docker build -t ekozan/kibana:$(TAG) .

push:
	docker push ekozan/kibana:$(TAG)
