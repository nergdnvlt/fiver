class Document
  attr_reader :tones
  def initialize(attrs)
    @attrs = attrs
    @tones = make_tones
  end

  def make_tones
    @attrs[:document_tone][:tones].map do |tone|
      { tone_name: tone[:tone_name] }
    end
  end

  def as_json
    {
      tones: @tones
    }
  end
end
