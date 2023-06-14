class Reservation < ApplicationRecord
    belongs_to :user
    has_many :rooms
    validates :check_in_date, presence: true
    validates :check_out_date, presence: true
    validates :number_of_people, presence: true, numericality: {only_integer: true},numericality: {greater_than: 0} 
    validate :check_in_date_check
    validate :check_out_date_check

    private
    def check_in_date_check
        if check_in_date && check_in_date < Date.current
            errors.add(:check_in_date, "は今日より後の日付を選択してください")
        end
    end

    def check_out_date_check
        if check_in_date && check_out_date && check_out_date <= check_in_date
            errors.add(:check_out_date, "はチェックイン日より後の日付を選択してください")
        end
    end

end
