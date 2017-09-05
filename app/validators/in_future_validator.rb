class InFutureValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value <= Time.zone.today
      record.errors.add attribute,
                        (options[:message] || "can't be in the past")
    end
  end
end
