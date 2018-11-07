# frozen_string_literal: true

class FilesMover
  include DIContainer.injector[source_storage: 'file_system_adapter', destination_storage: 'aws_s3_adapter']

  def move_file(file_path)
    file = source_storage.load_file(file_path)
    destination_storage.write_file(file)
  end
end
