require 'yaml/store'

class Config

  DEFAULT_CONFIG_FILE=ENV['HOME']+'/.polyvirt.yml'

  def initialize(filename)
    @name = filename
    @store = YAML::Store.new(@name)
  end

  def get(key)
    @store.transaction { @store[key] }
  end

  def put(key, val)
    @store.transaction { @store[key] = val }
  end

  def delete(key)
    @store.transaction { @store.delete(key) }
  end

  def keys
    @store.transaction { @store.roots }
  end

end
