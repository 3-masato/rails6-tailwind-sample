# frozen_string_literal: true

class ButtonComponent < ViewComponent::Base
  def initialize(style:, color:)
    @style = style
    @color = color
  end
end
