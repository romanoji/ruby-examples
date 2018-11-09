# frozen_string_literal: true

class AwsS3Adapter
  def initialize(bucket)
  end

  def load_file(file_path)
    # load file from S3 bucket and wrap in FileAdapter
  end

  def save_file(file)
    # save file to S3 bucket
  end
end
