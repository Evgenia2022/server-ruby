# frozen_string_literal: true

class ApplicationPresenter
  EXCEPTS = %i[].freeze

  def initialize(record)
    @record = record
  end

  private

  attr_reader :record
end
