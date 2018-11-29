# frozen_string_literal: true

# Adapter pattern (aka. Wrapper)
#
# Translates one interface into another, expected by the client class.
# It allows to classes to work together, which couldn't be normally possible
# due to incompatible interfaces.
#
# Pros:
# + interchangeable classes due to sharing a common interface (polymorphic classes)
# + often used to create a reusable class that will be flexible enough to cooperate with future classes
#
# Cons:
# - increases overall code complexity by creating additional classes
#
# Other examples:
# - Active Record DB adapters
# - Encrypter with reader/writer adapters

class FilesMigrator
  def initialize(source_storage, destination_storage)
    @source_storage = source_storage
    @destination_storage = destination_storage
  end

  def move_file(file_path)
    file = @source_storage.load_file(file_path)
    @destination_storage.write_file(file)
  end
end
