lint:
	bundle exec rubocop

test:
	bundle exec rspec

test-all:
	bundle exec rake

c:
	bin/console

push:
	git push -u origin master

.PHONY:	test
