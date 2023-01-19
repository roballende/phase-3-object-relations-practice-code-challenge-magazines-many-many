class Magazine < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers, through: :subscriptions


#   Magazine#email_list
#   returns a String of a semi-colon separated list of emails for all the readers subscribed to this magazine
#   the string should be formatted like this: email1@example.com;email2@example.com;email3@example.com

    def email_list
        readers.pluck(:email).join(";")
    end

#     Magazine.most_popular
# returns the Magazine instance with the most subscribers

    def self.most_popular
        self.all.max{|a,b| a.subscriptions.length <=> b.subscriptions.length}



        # self.where(id: Subscription.group(:magazine_id).order('count_id DESC').limit(1).count(:id).first.first)



    end

end