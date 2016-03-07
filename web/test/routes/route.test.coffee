request = require 'supertest'
expect = (require 'chai').expect

describe '/', ->
  it 'should render homepage', (done) ->
    request(sails.hooks.http.app)
    .get('/')
    .end (err, res) ->
      expect(res.statusCode).to.equal(200)
      done()

describe '/login', ->
  it 'should render login page', (done) ->
    request(sails.hooks.http.app)
    .get('/login')
    .end (err, res) ->
      expect(res.statusCode).to.equal(200)
      done()
