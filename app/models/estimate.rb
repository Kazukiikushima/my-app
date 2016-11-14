class Estimate < ActiveRecord::Base
  include Search::Estimate
  mount_uploader :avatar, AvatarUploader
  
  belongs_to :realtor
  
  has_many :favorites, dependent:   :destroy
  has_many :favorite_users, through: :favorites, source: :user
  
  has_many :dwellings, dependent: :destroy
  has_many :dwelling_users, through: :dwellings, source: :person
  
  scope :estimate_search, lambda { |u1, u2 |
    t = arel_table
    a = :place
    b = :fee
    condition1 = t.grouping(t[a].eq(u1).and(t[b].lteq(u2)))
    where(condition1)
  }
  
  scope :estimate_fee, lambda { |u1 |
    t = arel_table
    a = :fee
    condition2 = t.grouping(t[a].lteq(u1))
    where(condition2)
  }
  
 scope :estimate_id, ->(id) { where(id: id) }
  
  scope :with_user, -> { joins(:dwelling_users) }
  scope :search_user_job, ->(job) { where(job: job) }
  
  scope :with_dwelling, -> { joins(:dwellings) }
  scope :with_user, -> { joins(:user) }
  scope :search_id, ->(id) { where(id: id) }
  
end
