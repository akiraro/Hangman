exit unless Rails.env.development?

50.times do
    title = Faker::GreekPhilosophers.name
    diff_id = 0

    if title.length < 9
        break
    end

    case title.length
    when 9..10
        diff_id = 1
    when 11..12
        diff_id = 2
    else
        diff_id = 3
    end

    Datum.create(diff_id:diff_id,data:title,data_type:'Greek Philosophers')
end
