class UserPresenter < ApplicationPresenter
  MODEL_ATTRIBUTES = %i[id email full_name].freeze

  ASSOCIATIONS = %i[posts]

  delegate(*MODEL_ATTRIBUTES, to: :record)
  delegate(*ASSOCIATIONS, to: :record)

  def user_context
    properties.merge({ posts: record.posts })
  end

  private

  def properties
    record.attributes.symbolize_keys.slice(*MODEL_ATTRIBUTES)
  end
end
