TAG=4

build:
	docker build -t alephdata/convert-document:$(TAG) .

push:
	docker push alephdata/convert-document:$(TAG)
	docker tag alephdata/convert-document:$(TAG) alephdata/convert-document:latest
	docker push alephdata/convert-document:latest

shell: build
	docker run -ti -v $(PWD):/convert -p 3000:3000 alephdata/convert-document bash

run: build
	docker run -p 3000:3000 -ti alephdata/convert-document

test:
	curl -o out.pdf -F format=pdf -F 'file=@fixtures/agreement.docx' http://localhost:3000/convert