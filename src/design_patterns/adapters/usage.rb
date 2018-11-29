# frozen_string_literal: true

# Example usage:
source_fs = FileSystemAdapter.new('./source')
destination_fs = FileSystemAdapter.new('./destination')
s3_bucket = AwsS3Adapter.new('s3_bucket')

# From one local dir to another
FilesMigrator.new(source_fs, destination_fs)
             .move_file('./report.csv')

# From local dir to S3 bucket
FilesMigrator.new(source_fs, s3_bucket)
             .move_file('./report.csv')
