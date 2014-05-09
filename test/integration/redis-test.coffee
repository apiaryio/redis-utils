require 'mocha'
{assert} = require 'chai'

redis        = require 'redis'
redutils     = require '../../src/redis-helpers'

describe 'Test Redis utils', ->

  client = undefined
  timestamp = new Date().getTime()
  key = "#{timestamp}"
  expected = 'test'

  before ->
    client = redutils.getClient()

    client.set key, expected, redis.print

  after ->
    client.quit()

  it 'Get reply', (done) ->
    client.get key, (err, reply) ->
      if err then return done err
      assert.equal reply, expected
      done()
