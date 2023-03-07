require "open-uri"

puts "destroying Runnings..."
Running.destroy_all
puts "destroying Winter Sports..."
WinterSport.destroy_all
puts "destroying Cyclings..."
Cycling.destroy_all
puts "destroying Cyclings..."
Swimming.destroy_all
puts "destroying Walkings..."
Walking.destroy_all
puts "destroying ActivityLists..."
ActivityList.destroy_all
puts "destroying users..."
User.destroy_all

puts "creating users..."

benjamin = URI.open("https://avatars.githubusercontent.com/u/115448260?v=4")
gideon = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1665405360/o1pmr1f0uw7zalu3gb3h.jpg")
pedro = URI.open("https://avatars.githubusercontent.com/u/70776288?v=4")
charlotte = URI.open("https://res.cloudinary.com/dlvtxz1vv/image/upload/v1677938602/41611846_2130946083837540_641816277509210112_n_k1udbx.jpg")
lisa = URI.open("https://res.cloudinary.com/dlvtxz1vv/image/upload/v1677938602/294397523_1497740140663504_6036073443743542096_n_phrofu.jpg")
rodrigue = URI.open("https://res.cloudinary.com/dlvtxz1vv/image/upload/v1677938602/46061189_1035404969954092_4607702131317669888_n_e5xger.jpg")

user1 = User.create(first_name: 'Benjamin',
                    last_name: 'Boulle',
                    email: 'boulle@gmail.com',
                    age: 24,
                    height: 184,
                    weight: 74,
                    gender: "Male",
                    password: 'azerty')

user2 = User.create(first_name: 'Gideon',
                    last_name: 'Maydell',
                    email: 'gideon@maydell.at',
                    age: 24,
                    height: 187,
                    weight: 79,
                    gender: "Male",
                    password: 'qwertz')

user3 = User.create(first_name: 'Pedro',
                    last_name: 'Vilarinho',
                    email: 'pedro@gmail.com',
                    age: 35,
                    height: 178,
                    weight: 74,
                    gender: "Male",
                    password: 'azerty')

user4 = User.create(first_name: 'Charlotte',
                    last_name: 'Jadot',
                    email: 'charlotte@gmail.com',
                    age: 21,
                    height: 165,
                    weight: 51,
                    gender: "Female",
                    password: 'azerty')

user5 = User.create(first_name: 'Lisa',
                    last_name: 'Hardiquest',
                    email: 'lisa@gmail.com',
                    age: 21,
                    height: 173,
                    weight: 54,
                    gender: "Female",
                    password: 'azerty')

user6 = User.create(first_name: 'Rodrigue',
                    last_name: 'Bouhon',
                    email: 'rodrigue@gmail.com',
                    age: 24,
                    height: 178,
                    weight: 71,
                    gender: "Male",
                    password: 'azerty')

user1.photo.attach(io: benjamin, filename: "benjamin.jpg", content_type: "image/jpeg")
user2.photo.attach(io: gideon, filename: "gideon.jpg", content_type: "image/jpeg")
user3.photo.attach(io: pedro, filename: "pedro.jpg", content_type: "image/jpeg")
user4.photo.attach(io: charlotte, filename: "charlotte.jpg", content_type: "image/jpeg")
user5.photo.attach(io: lisa, filename: "lisa.jpg", content_type: "image/jpeg")
user6.photo.attach(io: rodrigue, filename: "rodrigue.jpg", content_type: "image/jpeg")

puts "creating activitylists..."

activity_lists_user1 = ActivityList.create(user: user1)
# activity_lists_user2 = ActivityList.create(user: user2)
# activity_lists_user3 = ActivityList.create(user: user3)
# activity_lists_user4 = ActivityList.create(user: user4)
# activity_lists_user5 = ActivityList.create(user: user5)
# activity_lists_user6 = ActivityList.create(user: user6)

puts "creating Running activities"

running1 = Running.create(name: "Home 1.0",
                          time: 5_240,
                          distance: 16.4,
                          avg_speed: 11.3,
                          avg_pace: 320,
                          max_speed: 14.9,
                          avg_heart_rate: 158,
                          max_heart_rate: 178,
                          friends: "Charlotte",
                          date: Date.today,
                          elevation_gain: 210,
                          activity_list: activity_lists_user1)
running1_pic = URI.open("https://res.cloudinary.com/dlvtxz1vv/image/upload/v1677838999/running-longer-or-faster-31e97070bda14ffc8afdea52094504c7_nhkypf.jpg")
running1.photo.attach(io: running1_pic, filename: "running1.jpg", content_type: "image/jpeg")

running2 = Running.create(name: "Home 2.0",
                          time: 3_250,
                          distance: 10.88,
                          avg_speed: 12.0,
                          avg_pace: 299,
                          max_speed: 14.2,
                          avg_heart_rate: 164,
                          max_heart_rate: 194,
                          friends: "Charlotte",
                          date: Date.today - 5,
                          elevation_gain: 101,
                          activity_list: activity_lists_user1)
running2_pic = URI.open("https://res.cloudinary.com/dlvtxz1vv/image/upload/v1677839330/GettyImages-1138796856_azjpjr.jpg")
running2.photo.attach(io: running2_pic, filename: "running2.jpg", content_type: "image/jpeg")

running3 = Running.create(name: "Home 3.0",
                          time: 6_673,
                          distance: 21.05,
                          avg_speed: 11.4,
                          avg_pace: 317,
                          max_speed: 13.3,
                          avg_heart_rate: 162,
                          max_heart_rate: 178,
                          friends: "Lisa",
                          date: Date.today - 4,
                          elevation_gain: 44,
                          activity_list: activity_lists_user1)
running3_pic = URI.open("https://res.cloudinary.com/dlvtxz1vv/image/upload/v1678205676/priroda-devushka-beg-sport_wlinb3.jpg")
running3.photo.attach(io: running3_pic, filename: "running3.jpg", content_type: "image/jpeg")

running4 = Running.create(name: "Home 4.0",
                          time: 4_714,
                          distance: 15.48,
                          avg_speed: 11.8,
                          avg_pace: 305,
                          max_speed: 16.2,
                          avg_heart_rate: 167,
                          max_heart_rate: 189,
                          friends: "Lisa",
                          date: Date.today - 10,
                          elevation_gain: 139,
                          activity_list: activity_lists_user1)
running4_pic = URI.open("https://res.cloudinary.com/dlvtxz1vv/image/upload/v1678204360/photo-1502224562085-639556652f33_a3kwvx.jpg")
running4.photo.attach(io: running4_pic, filename: "running4.jpg", content_type: "image/jpeg")

running5 = Running.create(name: "Home 5.0",
                          time: 3_968,
                          distance: 13.02,
                          avg_speed: 11.8,
                          avg_pace: 305,
                          max_speed: 12.9,
                          avg_heart_rate: 159,
                          max_heart_rate: 177,
                          friends: "Lisa",
                          date: Date.today - 12,
                          elevation_gain: 109,
                          activity_list: activity_lists_user1)
running5_pic = URI.open("https://res.cloudinary.com/dlvtxz1vv/image/upload/v1678204360/5547139_yt2kfk.jpg")
running5.photo.attach(io: running5_pic, filename: "running5.jpg", content_type: "image/jpeg")

running6 = Running.create(name: "Home 6.0",
                          time: 5_240,
                          distance: 16.40,
                          avg_speed: 11.3,
                          avg_pace: 320,
                          max_speed: 14.9,
                          avg_heart_rate: 158,
                          max_heart_rate: 178,
                          friends: "Lisa",
                          date: Date.today - 15,
                          elevation_gain: 210,
                          activity_list: activity_lists_user1)
running6_pic = URI.open("https://res.cloudinary.com/dlvtxz1vv/image/upload/v1678204360/running-191001_edeijj.jpg")
running6.photo.attach(io: running6_pic, filename: "running6.jpg", content_type: "image/jpeg")

puts "creating Wintersport activities"

winter_sport1 = WinterSport.create(name: "Meribel 1.0",
                                   time: 28_080,
                                   distance: 130.21,
                                   avg_speed: 22.7,
                                   max_speed: 98.5,
                                   avg_heart_rate: 92,
                                   max_heart_rate: 125,
                                   max_elevation: 3_154,
                                   elevation_gain: 18_965,
                                   friends: "Charlotte",
                                   date: Date.today - 6,
                                   activity_list: activity_lists_user1)
winter_sport1_pic = URI.open("https://res.cloudinary.com/dlvtxz1vv/image/upload/v1678203219/647383_lhgtps.jpg")
winter_sport1.photo.attach(io: winter_sport1_pic, filename: "winter_sport1.jpg", content_type: "image/jpeg")

winter_sport2 = WinterSport.create(name: "Meribel 2.0",
                                   time: 25_020,
                                   distance: 110.4,
                                   avg_speed: 15.9,
                                   max_speed: 89.0,
                                   avg_heart_rate: 89,
                                   max_heart_rate: 125,
                                   max_elevation: 3_154,
                                   elevation_gain: 12_660,
                                   friends: "Charlotte",
                                   date: Date.today - 16,
                                   activity_list: activity_lists_user1)
winter_sport2_pic = URI.open("https://res.cloudinary.com/dlvtxz1vv/image/upload/v1678033255/Snowboard_pow_oje9ex.jpg")
winter_sport2.photo.attach(io: winter_sport2_pic, filename: "winter_sport2.jpg", content_type: "image/jpeg")

winter_sport3 = WinterSport.create(name: "Meribel 3.0",
                                   time: 21_357,
                                   distance: 108.54,
                                   avg_speed: 22.7,
                                   max_speed: 97.1,
                                   avg_heart_rate: 86,
                                   max_heart_rate: 118,
                                   max_elevation: 3_174,
                                   elevation_gain: 12_000,
                                   friends: "Charlotte",
                                   date: Date.today - 10,
                                   activity_list: activity_lists_user1)
winter_sport3_pic = URI.open("https://res.cloudinary.com/dlvtxz1vv/image/upload/v1678094490/snowboard-wallpaper-6_mkkyg0.jpg")
winter_sport3.photo.attach(io: winter_sport3_pic, filename: "winter_sport3.jpg", content_type: "image/jpeg")

winter_sport4 = WinterSport.create(name: "Meribel 4.0",
                                   time: 21_961,
                                   distance: 107.39,
                                   avg_speed: 20.4,
                                   max_speed: 95.1,
                                   avg_heart_rate: 84,
                                   max_heart_rate: 113,
                                   max_elevation: 3_201,
                                   elevation_gain: 11_972,
                                   friends: "Charlotte",
                                   date: Date.today - 13,
                                   activity_list: activity_lists_user1)
winter_sport4_pic = URI.open("https://res.cloudinary.com/dlvtxz1vv/image/upload/v1678203646/Screenshot_2023-03-07_at_15.42.31_nq69ij.png")
winter_sport4.photo.attach(io: winter_sport4_pic, filename: "winter_sport4.jpg", content_type: "image/jpeg")

winter_sport5 = WinterSport.create(name: "Meribel 5.0",
                                   time: 21_686,
                                   distance: 101.55,
                                   avg_speed: 20.6,
                                   max_speed: 92.1,
                                   avg_heart_rate: 84,
                                   max_heart_rate: 113,
                                   max_elevation: 3_152,
                                   elevation_gain: 11_268,
                                   friends: "Charlotte",
                                   date: Date.today - 12,
                                   activity_list: activity_lists_user1)
winter_sport5_pic = URI.open("https://res.cloudinary.com/dlvtxz1vv/image/upload/v1678204259/Screenshot_2023-03-07_at_16.50.52_n2qirx.png")
winter_sport5.photo.attach(io: winter_sport5_pic, filename: "winter_sport5.jpg", content_type: "image/jpeg")

puts "creating Cycling activities"

cycling1 = Cycling.create(name: "La Croix 1.0",
                          time: 18_661,
                          distance: 88.83,
                          avg_speed: 17.1,
                          max_speed: 58.3,
                          avg_heart_rate: 156,
                          max_heart_rate: 195,
                          max_elevation: 424,
                          elevation_gain: 1617,
                          friends: "Charlotte",
                          date: Date.today - 10,
                          activity_list: activity_lists_user1)
cycling1_pic = URI.open("https://res.cloudinary.com/dlvtxz1vv/image/upload/v1678095654/I0708-Vnord-dav_2307_rkyycw.jpg")
cycling1.photo.attach(io: cycling1_pic, filename: "cycling1.jpg", content_type: "image/jpeg")

cycling2 = Cycling.create(name: "La Croix 2.0",
                          time: 7_612,
                          distance: 55.38,
                          avg_speed: 26.2,
                          max_speed: 56.2,
                          avg_heart_rate: 139,
                          max_heart_rate: 177,
                          max_elevation: 368,
                          elevation_gain: 762,
                          friends: "Charlotte",
                          date: Date.today - 16,
                          activity_list: activity_lists_user1)
cycling2_pic = URI.open("https://res.cloudinary.com/dlvtxz1vv/image/upload/v1678095657/I0708-Vnord-dav_2314_qxpc4x.jpg")
cycling2.photo.attach(io: cycling2_pic, filename: "cycling2.jpg", content_type: "image/jpeg")

cycling3 = Cycling.create(name: "La Croix 3.0",
                          time: 16_307,
                          distance: 97.8,
                          avg_speed: 21.6,
                          max_speed: 63.3,
                          avg_heart_rate: 139,
                          max_heart_rate: 177,
                          max_elevation: 614,
                          elevation_gain: 2_073,
                          friends: "Lisa",
                          date: Date.today - 20,
                          activity_list: activity_lists_user1)
cycling3_pic = URI.open("https://res.cloudinary.com/dlvtxz1vv/image/upload/v1678220417/wp10051368_gaiuio.jpg")
cycling3.photo.attach(io: cycling3_pic, filename: "cycling3.jpg", content_type: "image/jpeg")

cycling4 = Cycling.create(name: "La Croix 4.0",
                          time: 3_870,
                          distance: 38.83,
                          avg_speed: 36.1,
                          max_speed: 56.2,
                          avg_heart_rate: 139,
                          max_heart_rate: 177,
                          max_elevation: 368,
                          elevation_gain: 58,
                          friends: "Charlotte",
                          date: Date.today - 6,
                          activity_list: activity_lists_user1)
cycling4_pic = URI.open("https://res.cloudinary.com/dlvtxz1vv/image/upload/v1678220417/4259743_akwdbr.jpg")
cycling4.photo.attach(io: cycling4_pic, filename: "cycling4.jpg", content_type: "image/jpeg")

cycling5 = Cycling.create(name: "La Croix 5.0",
                          time: 12_131,
                          distance: 86.23,
                          avg_speed: 25.6,
                          max_speed: 56.2,
                          avg_heart_rate: 139,
                          max_heart_rate: 177,
                          max_elevation: 116,
                          elevation_gain: 655,
                          friends: "Charlotte",
                          date: Date.today,
                          activity_list: activity_lists_user1)
cycling5_pic = URI.open("https://res.cloudinary.com/dlvtxz1vv/image/upload/v1678220417/Bicycle-Background-Full-HD_oy2mzo.jpg")
cycling5.photo.attach(io: cycling5_pic, filename: "cycling5.jpg", content_type: "image/jpeg")

puts "creating Swimming activities"

swimming1 = Swimming.create(name: "Piscine 1.0",
                            time: 435,
                            distance: 0.200,
                            avg_speed: 2.1,
                            avg_pace: 218,
                            max_speed: 9.7,
                            avg_heart_rate: 118,
                            max_heart_rate: 129,
                            friends: "Charlotte",
                            date: Date.today,
                            total_strokes: 4,
                            activity_list: activity_lists_user1)
swimming1_pic = URI.open("https://res.cloudinary.com/dlvtxz1vv/image/upload/v1678096353/pexels-heart-rules-711187_isx2f8.jpg")
swimming1.photo.attach(io: swimming1_pic, filename: "swimming1.jpg", content_type: "image/jpeg")

swimming2 = Swimming.create(name: "Piscine 2.0",
                            time: 1490,
                            distance: 2.500,
                            avg_speed: 6.1,
                            avg_pace: 59,
                            max_speed: 14.4,
                            avg_heart_rate: 129,
                            max_heart_rate: 157,
                            friends: "Lisa",
                            date: Date.today - 1,
                            total_strokes: 50,
                            activity_list: activity_lists_user1)
swimming2_pic = URI.open("https://res.cloudinary.com/dlvtxz1vv/image/upload/v1678096353/312376_ueuqwm.jpg")
swimming2.photo.attach(io: swimming2_pic, filename: "swimming2.jpg", content_type: "image/jpeg")

swimming3 = Swimming.create(name: "Piscine 3.0",
                            time: 1657,
                            distance: 1.650,
                            avg_speed: 1,
                            avg_pace: 100,
                            max_speed: 14.4,
                            avg_heart_rate: 129,
                            max_heart_rate: 157,
                            friends: "Lisa",
                            date: Date.today - 1,
                            total_strokes: 33,
                            activity_list: activity_lists_user1)
swimming3_pic = URI.open("https://res.cloudinary.com/dlvtxz1vv/image/upload/v1678220417/plavanie-pryzhok-bryzgi_achvvb.jpg")
swimming3.photo.attach(io: swimming3_pic, filename: "swimming3.jpg", content_type: "image/jpeg")

puts "creating Walking activities"

walking1 = Walking.create(name: "Mountain 1.0",
                          time: 23_443,
                          distance: 32.6,
                          avg_speed: 5,
                          avg_pace: 720,
                          max_speed: 7.9,
                          avg_heart_rate: 162,
                          max_heart_rate: 189,
                          friends: "Charlotte",
                          date: Date.today - 29,
                          elevation_gain: 7890,
                          activity_list: activity_lists_user1)
walking1_pic = URI.open("https://res.cloudinary.com/dlvtxz1vv/image/upload/v1678097466/photo-1483728642387-6c3bdd6c93e5_dxzb3l.jpg")
walking1.photo.attach(io: walking1_pic, filename: "walking1.jpg", content_type: "image/jpeg")

walking2 = Walking.create(name: "Mountain 2.0",
                          time: 19_443,
                          distance: 23.58,
                          avg_speed: 4.37,
                          avg_pace: 824,
                          max_speed: 11,
                          avg_heart_rate: 134,
                          max_heart_rate: 198,
                          friends: "Lisa",
                          date: Date.today - 25,
                          elevation_gain: 6789,
                          activity_list: activity_lists_user1)
walking2_pic = URI.open("https://res.cloudinary.com/dlvtxz1vv/image/upload/v1678097467/A-Alamy-BXWK5E_vvmkuf_zzxojz.webp")
walking2.photo.attach(io: walking2_pic, filename: "walking2.jpg", content_type: "image/jpeg")

walking3 = Walking.create(name: "Mountain 3.0",
                          time: 19_443,
                          distance: 23.58,
                          avg_speed: 4.37,
                          avg_pace: 824,
                          max_speed: 11,
                          avg_heart_rate: 134,
                          max_heart_rate: 198,
                          friends: "Lisa",
                          date: Date.today - 2,
                          elevation_gain: 6789,
                          activity_list: activity_lists_user1)
walking3_pic = URI.open("https://res.cloudinary.com/dlvtxz1vv/image/upload/v1678220417/somalaya-mountain-range-title_ztcxmm.jpg")
walking3.photo.attach(io: walking3_pic, filename: "walking3.jpg", content_type: "image/jpeg")
