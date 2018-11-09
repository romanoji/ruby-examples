# frozen_string_literal: true

# Example usage:
file_system_adapter = FileSystemAdapter.new
aws_s3_adapter = AwsS3Adapter.new('s3_bucket')

# From one local dir to another
FilesMigrator.new(file_system_adapter, file_system_adapter)
             .move_file('./report.csv')

# From local dir to S3 bucket
FilesMigrator.new(file_system_adapter, aws_s3_adapter)
             .move_file('./report.csv')
