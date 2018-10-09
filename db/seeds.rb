# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
animes = Anime.create([
  {
    name: 'Violet Evergarden',
    kind: 'TV',
    producer: 'Lantis, Pony Canyon, Rakuonsha, ABC Animation',
    licensor: '',
    episode: '13',
    premiered: '2018-01-11T00:00:00+00:00',
    studio: 'Kyoto Animation',
    source: 'Light novel',
    duration: '23 min per ep',
    rating: 'PG-13 - Teens 13 or older',
    description: 'The Great War finally came to an end after four long years of conflict; fractured in two, the continent of Telesis slowly began to flourish once again. Caught up in the bloodshed was Violet Evergarden, a young girl raised for the sole purpose of decimating enemy lines. Hospitalized and maimed in a bloody skirmish during the War\'s final leg, she was left with only words from the person she held dearest, but with no understanding of their meaning. Recovering from her wounds, Violet starts a new life working at CH Postal Services after a falling out with her new intended guardian family. There, she witnesses by pure chance the work of an \"Auto Memory Doll,\" amanuenses that transcribe people\'s thoughts and feelings into words on paper. Moved by the notion, Violet begins work as an Auto Memory Doll, a trade that will take her on an adventure, one that will reshape the lives of her clients and hopefully lead to self-discovery. [Written by MAL Rewrite]',
  }
])