# frozen_string_literal: true

# Facade pattern
#
# Provides a simplified interface to a complex system of classes, library or framework,
# so we don't need to know all underlying parts of it to be able to use it.
#
# Pros:
# + provides a simple interface without a need to know underlying classes
# + isolates clients from subsystem components
# + minimizes coupling between client code and underlying parts
#
# Cons:
# - there's a risk that Facade become a God object, sometimes it's better to have 2 facades than 1
#
# Other examples:
# - API facade
# - LIB/GEM/FRAMEWORK facade

class UsersCRUD
  def create(*params)
    User.create!(*params)
  end

  def get(id)
    UserSerializer.new(find(id))
  end

  def query(*params)
    users = UsersQuery.execute(*params)
    ArraySerializer.new(users, each_serializer: UserSerializer)
                   .as_json
  end

  def update(id, *params)
    user = find(id)
    user.update!(*params)
  end

  def delete(id)
    find(id).destroy!
  end

  private

  def find(id)
    User.find(id)
  end
end
