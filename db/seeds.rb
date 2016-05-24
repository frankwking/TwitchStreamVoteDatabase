# ruby encoding: utf-8
notQueue =    GameQueue.create(name: 'Not in Game Queue', display: false)
shortQueue =  GameQueue.create(name: 'Shorter than 30 Hours', display: true)
longQueue =   GameQueue.create(name: 'Longer than 30 Hours', display: true)
snesConsole = GameConsole.create(name: 'SNES')
n64Console =  GameConsole.create(name: 'Nintendo 64')
x360Console = GameConsole.create(name: 'Xbox 360')
jrpgGenre =   GameGenre.create(name: 'JRPG')
rtsGenre =    GameGenre.create(name: 'RTS')
walkGenre =   GameGenre.create(name: 'Walking Simulator')
platGenre =   GameGenre.create(name: 'Platformer')

chronoTrigger = Game.create(name: 'Chrono Trigger')
chronoTrigger.game_consoles << GameConsole.find(snesConsole.id)
chronoTrigger.game_genres << GameGenre.find(jrpgGenre.id)
chronoTrigger.game_queue = GameQueue.find(shortQueue.id)
chronoTrigger.current_votes = 5
chronoTrigger.save

secretOfMana = Game.create(name: 'Secret of Mana')
secretOfMana.game_consoles << GameConsole.find(snesConsole.id)
secretOfMana.game_genres << GameGenre.find(jrpgGenre.id)
secretOfMana.game_queue = GameQueue.find(shortQueue.id)
secretOfMana.current_votes = 1
secretOfMana.save

superMarioWorld = Game.create(name: 'Super Mario World')
superMarioWorld.game_consoles << GameConsole.find(snesConsole.id)
superMarioWorld.game_genres << GameGenre.find(platGenre.id)
superMarioWorld.game_queue = GameQueue.find(shortQueue.id)
superMarioWorld.current_votes = 3
superMarioWorld.save
