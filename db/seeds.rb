# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#
stages = JSON.parse("[{\"text\":\"Spiral Mountain\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/spiral-mountain.jpg\"},{\"text\":\"Battlefield\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/battlefield.jpg\"},{\"text\":\"Big Battlefield\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/big-battlefield.jpg\"},{\"text\":\"Dracula's Castle\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/draculas-castle.jpg\"},{\"text\":\"Yggdrasil's Altar\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/erdrea.jpg\"},{\"text\":\"Final Destination\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/final-destination.jpg\"},{\"text\":\"Mementos\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/mementos.jpg\"},{\"text\":\"Moray Towers\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/moray-towers.jpg\"},{\"text\":\"New Donk City Hall\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/new-donk-city.jpg\"},{\"image_url\":null},{\"text\":\"Stadium\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/stadium.jpg\"},{\"text\":\"Great Plateau Tower\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/great-plateau-tower.jpg\"},{\"text\":\"Town and City\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/town-and-city.jpg\"},{\"text\":\"Umbra Clock Tower\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/umbra-clock-tower.jpg\"},{\"text\":\"Duck Hunt\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/duck-hunt.jpg\"},{\"text\":\"Midgar\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/midgar.jpg\"},{\"text\":\"Coliseum\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/coliseum.jpg\"},{\"text\":\"Flat Zone X\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/flat-zone-x.jpg\"},{\"text\":\"Gamer\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/gamer.jpg\"},{\"text\":\"Palutena's Temple\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/palutena-temple.jpg\"},{\"text\":\"The Great Cave Offensive\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/great-cave-offensive.jpg\"},{\"text\":\"Mario Circuit\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/mario-circuit-wiiu.jpg\"},{\"text\":\"Wily Castle\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/dr-wily-castle.jpg\"},{\"text\":\"PAC-LAND\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/pac-land.jpg\"},{\"text\":\"Garden of Hope\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/garden-of-hope.jpg\"},{\"text\":\"Pilotwings\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/pilot-wings.jpg\"},{\"text\":\"Kalos Pokémon League\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/kalos-pokemon-league.jpg\"},{\"text\":\"Boxing Ring\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/boxing-ring.jpg\"},{\"text\":\"Windy Hill Zone\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/windy-hill.jpg\"},{\"text\":\"Suzaku Castle\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/suzaku-castle.jpg\"},{\"text\":\"Mario Galaxy\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/mario-galaxy.jpg\"},{\"text\":\"Mushroom Kingdom U\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/mushroom-kingdom-u.jpg\"},{\"text\":\"Super Mario Maker\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/super-mario-maker.jpg\"},{\"text\":\"Skyloft\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/skyloft.jpg\"},{\"text\":\"Wii Fit Studio\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/wii-fit-studio.jpg\"},{\"text\":\"Wrecking Crew\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/wrecking-crew.jpg\"},{\"image_url\":null},{\"text\":\"Wuhu Island\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/wuhu-island.jpg\"},{\"text\":\"Gaur Plain\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/gaur-plain.jpg\"},{\"text\":\"Tortimer Island\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/tortimer-island.jpg\"},{\"text\":\"Balloon Fight\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/balloon-fight.jpg\"},{\"text\":\"Magicant\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/magicant.jpg\"},{\"text\":\"Mute City SNES\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/mute-city.jpg\"},{\"text\":\"Arena Ferox\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/arena-ferox.jpg\"},{\"text\":\"Reset Bomb Forest\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/reset-bomb-forest.jpg\"},{\"text\":\"Dream Land GB\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/game-boy.jpg\"},{\"text\":\"Living Room\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/living-room.jpg\"},{\"text\":\"Paper Mario\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/paper-mario.jpg\"},{\"text\":\"PictoChat 2\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/pictochat-2.jpg\"},{\"text\":\"Prism Tower\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/prism-tower.jpg\"},{\"text\":\"Unova Pokémon League\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/unova-pokemon-league.jpg\"},{\"text\":\"StreetPass Quest\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/find-mii.jpg\"},{\"text\":\"3D Land\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/3d-land.jpg\"},{\"text\":\"Golden Plains\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/golden-plains.jpg\"},{\"text\":\"Gerudo Valley\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/gerudo-valley.jpg\"},{\"image_url\":null},{\"text\":\"Spirit Train\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/spirit-train.jpg\"},{\"text\":\"Tomodachi Life\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/tomodachi-collection.jpg\"},{\"text\":\"Smashville\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/smashville.jpg\"},{\"text\":\"75 m\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/75-m.jpg\"},{\"text\":\"New Pork City\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/new-pork-city.jpg\"},{\"text\":\"Hanenbow\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/hanenbow.jpg\"},{\"text\":\"Port Town Aero Dive\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/port-town-aero-dive.jpg\"},{\"text\":\"Castle Siege\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/castle-siege.jpg\"},{\"text\":\"Summit\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/summit.jpg\"},{\"text\":\"Skyworld\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/skyworld.jpg\"},{\"text\":\"Halberd\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/halberd.jpg\"},{\"text\":\"Luigi's Mansion\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/luigis-mansion.jpg\"},{\"text\":\"Figure-8 Circuit\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/mario-circuit-brawl.jpg\"},{\"text\":\"Shadow Moses Island\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/shadow-moses-island.jpg\"},{\"text\":\"Frigate Orpheon\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/frigate-orpheon.jpg\"},{\"text\":\"Norfair\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/norfair.jpg\"},{\"text\":\"Distant Planet\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/distant-planet.jpg\"},{\"text\":\"Pokémon Stadium 2\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/pokemon-stadium-2.jpg\"},{\"text\":\"Spear Pillar\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/spear-pillar.jpg\"},{\"text\":\"Green Hill Zone\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/green-hill-zone.jpg\"},{\"text\":\"Lylat Cruise\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/lylat-cruise.jpg\"},{\"text\":\"Delfino Plaza\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/delfino-plaza.jpg\"},{\"text\":\"Mario Bros.\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/mario-bros.jpg\"},{\"text\":\"Mushroomy Kingdom\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/mushroomy-kingdom.jpg\"},{\"text\":\"Bridge of Eldin\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/bridge-of-eldin.jpg\"},{\"text\":\"Pirate Ship\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/pirate-ship.jpg\"},{\"image_url\":null},{\"text\":\"WarioWare, Inc.\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/warioware.jpg\"},{\"text\":\"Yoshi's Island\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/yoshis-island-brawl.jpg\"},{\"text\":\"Jungle Japes\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/jungle-japes.jpg\"},{\"text\":\"Kongo Falls\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/kongo-jungle-melee.jpg\"},{\"text\":\"Fourside\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/fourside.jpg\"},{\"text\":\"Onett\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/onett.jpg\"},{\"text\":\"Big Blue\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/big-blue.jpg\"},{\"text\":\"Fountain of Dreams\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/fountain-of-dreams.jpg\"},{\"text\":\"Green Greens\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/green-greens.jpg\"},{\"text\":\"Brinstar Depths\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/brinstar-depths.jpg\"},{\"text\":\"Brinstar\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/brinstar.jpg\"},{\"text\":\"Pokémon Stadium\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/pokemon-stadium.jpg\"},{\"text\":\"Corneria\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/corneria.jpg\"},{\"text\":\"Venom\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/venom.jpg\"},{\"text\":\"Mushroom Kingdom II\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/mushroom-kingdom-2.jpg\"},{\"text\":\"Princess Peach's Castle\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/princess-peachs-castle.jpg\"},{\"text\":\"Rainbow Cruise\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/rainbow-cruise.jpg\"},{\"text\":\"Great Bay\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/great-bay.jpg\"},{\"image_url\":null},{\"text\":\"Temple\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/temple.jpg\"},{\"text\":\"Yoshi's Island (Melee)\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/yoshis-island-melee.jpg\"},{\"text\":\"Yoshi's Story\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/yoshis-story.jpg\"},{\"text\":\"Kongo Jungle\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/kongo-jungle-64.jpg\"},{\"text\":\"Dream Land\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/dream-land.jpg\"},{\"text\":\"Saffron City\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/saffron-city.jpg\"},{\"text\":\"Mushroom Kingdom\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/mushroom-kingdom-64.jpg\"},{\"image_url\":null},{\"text\":\"Peach's Castle\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/peachs-castle.jpg\"},{\"text\":\"Hyrule Castle\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/hyrule-castle.jpg\"},{\"text\":\"Super Happy Tree\",\"image_url\":\"http://smashbros-ultimate.com/images/stages/front/h160/yoshis-island-64.jpg\"}]")
stages.each do |stage|
  name = stage["text"]
  url = stage["image_url"]
  next unless name && url
  count = Stage.where(name: name).count

  if count == 0
  puts "Making #{stage}"
    Stage.create!(name: name, image_url: url)
  else
    puts "#{name} already exists"
  end
end

Stage.where(
  name: [
    "Battlefield",
    "Final Destination",
    "Yoshi's Story",
    "Pokémon Stadium",
    "WarioWare, Inc.",
    "Yoshi's Island",
    "Lylat Cruise",
    "Pokémon Stadium 2",
    "Smashville",
    "Unova Pokémon League",
    "Skyloft",
    "Kalos Pokémon League",
    "Town and City",
    "Yggdrasil's Altar"
  ]
).update_all(:is_competitive => true)


