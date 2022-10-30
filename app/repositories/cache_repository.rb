module CacheRepository
  attr_reader :decorated

  def initialize(decorated)
    @decorated = decorated
  end

  def get_or_create(key, options, &block)
    if key.nil? && key.empty?
      raise Errors::EmptyCacheKeyError, "Key cache can't be nil or white space"
    end

    cache = Rails.cache.read(key)
    return cache unless cache.nil?

    entities = yield block

    if Rails.env.production? && !entities.empty?
      Rails.cache.write(key, entities, options)
    end

    entities
  end
end
