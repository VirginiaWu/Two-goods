docker-compose -p test -f docker-compose.test.yml run --rm web ./web/node_modules/.bin/mocha --require coffee-script/register ./web/test/bootstrap.test.js ./web/test/routes/*.test.coffee
