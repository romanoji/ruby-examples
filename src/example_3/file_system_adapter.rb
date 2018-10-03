# frozen_string_literal: true

class FileSystemAdapter
  def load_file(file_path)
    file = File.open(file_path)
    FileAdapter.new(file.basename, file.gets)
  end

  def save_file(file)
    # save file to file system
  end
end
