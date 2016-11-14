class Contact < ActiveRecord::Base
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  
  
  scope :all_from_to, lambda { |u1, u2|
    t = arel_table
    a = :sender_id
    b = :receiver_id
    condition1 = t.grouping(t[a].eq(u1.id).and(t[b].eq(u2.id)))
    condition2 = t.grouping(t[b].eq(u1.id).and(t[a].eq(u2.id)))
    where(condition1.or(condition2))
  }
end
