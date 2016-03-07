docker-compose -p test -f docker-compose.test.yml run --rm web sh -c 'cd web && ./node_modules/.bin/mocha --require coffee-script/register ./test/bootstrap.test.js ./test/routes/*.test.coffee'
