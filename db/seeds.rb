200.times do
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

    Store.create(diff_id:diff_id,data:title,data_type:'Greek Philosophers')
end

200.times do
    title = Faker::Artist.name
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

    Store.create(diff_id:diff_id,data:title,data_type:'Artist')
end

200.times do
    title = Faker::Food.dish
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

    Store.create(diff_id:diff_id,data:title,data_type:'Food')
end

200.times do
    title = Faker::Food.fruits
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

    Store.create(diff_id:diff_id,data:title,data_type:'Fruit')
end

200.times do
    title = Faker::Food.sushi
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

    Store.create(diff_id:diff_id,data:title,data_type:'Sushi')
end

200.times do
    title = Faker::Food.vegetables
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

    Store.create(diff_id:diff_id,data:title,data_type:'Vegetable')
end

400.times do
    title = Faker::Job.title
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

    Store.create(diff_id:diff_id,data:title,data_type:'Job')
end

200.times do
    title = Faker::Science.scientist
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

    Store.create(diff_id:diff_id,data:title,data_type:'Scientist')
end