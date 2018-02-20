json.extract! order, :id, :visa, :fast_track, :private_letter, :amount, :speed, :border_point, :entry_date, :email, :customer_name, :phone, :passport_number, :passport_name, :nationality, :passport_issued, :passport_end, :gender, :birthday, :created_at, :updated_at
json.url order_url(order, format: :json)
