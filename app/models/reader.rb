class Reader < ActiveRecord::Base
    has_many :subscriptions
    has_many :magazines, through: :subscriptions

    def subscribe(magazine, price)
        Subscription.create(magazine: magazine, price: price, reader: self)
    end
    # returns the total price for all the reader's subscriptions
    def total_subscription_price
        subscriptions.sum(:price)
    end

    # takes a magazine instance and removes the subscription for this reader
# you will have to delete a row from the subscriptions table to get this to work!

    # def cancel_subscription(magazine)
    #     subscriptions.find_by(magazine: magazine).destroy 
    # end

    def cancel_subscription(magazine)
        Subscription.where(magazine_id: magazine.id, reader_id: self.id).destroy_all
    end

    

end