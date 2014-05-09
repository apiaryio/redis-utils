if process.env.REDIS_URL
  require './integration/redis-test'
else
  describe.skip 'Test Redis utils', -> it 'Dummy it'
