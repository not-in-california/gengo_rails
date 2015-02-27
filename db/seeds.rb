10.times do |i|
  Localization.create(path: "title.#{i}", locale: "pt", value: "Value #{i}")
end

6.times do |i|
  Localization.create(path: "title.#{i}", locale: "es", value: "Value #{i}")
end