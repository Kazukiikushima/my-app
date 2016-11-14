module Search::Estimate
  extend ActiveSupport::Concern
  included do

    scope :with_place, lambda { |place|
    }
    
    scope :with_users, lambda { joins(:dwelling_users) }

    scope :with_job, lambda { |job|
      user_table = User.arel_table
      condition = user_table[:job].eq(job)
      where(condition)
    }

    scope :with_fee, lambda { |fee|
      t = arel_table
      condition = t[:fee].lteq(fee)
      where(condition)
    }

    scope :search, lambda { |params|
      r = self
      r = r.with_place(params[:a]) if params[:a].present?
      r = r.with_fee(params[:b])   if params[:b].present?
      r = r.with_users.with_job(params[:c])   if params[:c].present?
      return r if r != self
      where({})
    }
  end
end
