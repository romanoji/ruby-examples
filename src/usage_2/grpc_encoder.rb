# frozen_string_literal: true

class GrpcEncoder
  def initialize(data:, encoder:, formatter: nil)
    @data = data
    @formatter = formatter
    @encoder = encoder

    validate!
  end

  def encode
    @encoder.encode(to_proto)
  end

  def to_proto
    @encoder.new(formatted_data)
  end

  private

  def formatted_data
    return @formatter.new(@data).format if @formatter
    @data
  end

  def validate!
    raise ArgumentError, "Encoder doesn't respond to encode method" unless @encoder.respond_to?(:encode)

    return if @formatter.nil?
    raise ArgumentError, "Formatter doesn't respond to format method" unless @formatter.method_defined?(:format)
  end
end

# Example usage:
GrpcEncoder.new(data: campaign,
                formatter: Formatter::Campaign,
                encoder: Internalrpc::CampaignResponse)
