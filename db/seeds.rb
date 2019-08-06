exit unless Rails.env.development?

30.times do
    title = Faker::Nation.capital_city
    diff_id = 0

    case title.length
    when 1..6
        diff_id = 1
    when 7..8
        diff_id = 2
    else
        diff_id = 3
    end

    Datum.create(diff_id:diff_id,data:title,data_type:'City')
end
