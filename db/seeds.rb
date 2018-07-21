# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# rake import_csv:data
Product.create(area_type: '단속구역', area_name: 'In Korea Territory', latitude: '37.24072264134755', longitude: '131.8672111341569')


require 'csv'

namespace :import_csv do 
    task data: :environment do
        #user.csv의 경로를 filename에 저장
        CSV.foreach("app/assets/no_smoking_place.csv", :headers => true) do |row|
            # p row
            #users.csv파일의 각 행을 array 형태로 출력
            Home.create!(row.to_hash)
        end
    end
end
