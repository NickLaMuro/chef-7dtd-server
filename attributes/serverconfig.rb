default["sdtd"]["serverconfig"]["ServerPort"]                         = "26900"               # Port you want the server to listen on.
default["sdtd"]["serverconfig"]["ServerIsPublic"]                     = "false"               # Should this server register to master server
default["sdtd"]["serverconfig"]["ServerName"]                         = "My Game Host"        # Whatever you want the name to be.
default["sdtd"]["serverconfig"]["ServerPassword"]                     = ""                    # Password to gain entry to the server
default["sdtd"]["serverconfig"]["ServerMaxPlayerCount"]               = "8"                   # Maximum Concurrent Players
default["sdtd"]["serverconfig"]["ServerDescription"]                  = "A 7DTD server"       # Whatever you want the description to be.
default["sdtd"]["serverconfig"]["ServerWebsiteURL"]                   = ""                    # Website URL for the server

default["sdtd"]["serverconfig"]["GameWorld"]                          = "Random Gen"          # Navezgane, MP Wasteland Horde, MP Wasteland Skirmish, MP Wasteland War, Random Gen
default["sdtd"]["serverconfig"]["GameName"]                           = "My Game"             # Whatever you want the game name to be THIS CONTROLS THE RANDOM GENERATION SEED
default["sdtd"]["serverconfig"]["GameDifficulty"]                     = "2"                   # 0 - 4, 0=easiest, 4=hardest
default["sdtd"]["serverconfig"]["GameMode"]                           = "GameModeSurvivalMP"  # GameModeSurvivalMP, GameModeSurvivalSP (MP has land protection)

default["sdtd"]["serverconfig"]["ZombiesRun"]                         = "0"                   # 0 = default day/night walk/run, 1 = never run, 2 = always run
default["sdtd"]["serverconfig"]["BuildCreate"]                        = "false"               # cheat mode on/off
default["sdtd"]["serverconfig"]["DayNightLength"]                     = "40"                  # 40 minutes
default["sdtd"]["serverconfig"]["FriendlyFire"]                       = "false"               # Can friendly players damage each other (PvP)
default["sdtd"]["serverconfig"]["PersistentPlayerProfiles"]           = "true"                # If disabled a player can join with any selected profile. If true they will join with the last profile they joined with

default["sdtd"]["serverconfig"]["ControlPanelEnabled"]                = "false"               # Enable/Disable the control panel
default["sdtd"]["serverconfig"]["ControlPanelPort"]                   = "8080"                # Port of the control panel webpage
default["sdtd"]["serverconfig"]["ControlPanelPassword"]               = "CHANGEME"            # Password to gain entry to the control panel

default["sdtd"]["serverconfig"]["TelnetEnabled"]                      = "true"                # Enable/Disable the telnet
default["sdtd"]["serverconfig"]["TelnetPort"]                         = "8081"                # Port of the telnet server
default["sdtd"]["serverconfig"]["TelnetPassword"]                     = "CHANGEME"            # Password to gain entry to telnet interface

default["sdtd"]["serverconfig"]["DisableNAT"]                         = "true"                # set this to true if your router doesn't support NAT
default["sdtd"]["serverconfig"]["AdminFileName"]                      = "admins.xml"          # Server admin file name

default["sdtd"]["serverconfig"]["DropOnDeath"]                        = "0"                   # 0 = everything, 1 = toolbelt only, 2 = backpack only, 3 = delete all
default["sdtd"]["serverconfig"]["DropOnQuit"]                         = "0"                   # 0 = nothing, 1 = everything, 2 = toolbelt only, 3 = backpack only

default["sdtd"]["serverconfig"]["CraftTimer"]                         = "1"                   # 0 = None (instant), 1 = Normal, 2 = Fast (double speed)
default["sdtd"]["serverconfig"]["LootTimer"]                          = "1"                   # 0 = None (instant), 1 = Normal, 2 = Fast (double speed)

default["sdtd"]["serverconfig"]["EnemySenseMemory"]                   = "60"                  # Time, in seconds, that a zombie will pursue something that has been sensed.
default["sdtd"]["serverconfig"]["EnemySpawnMode"]                     = "3"                   # 0 = Disabled 0%, 1 = Very Low 50%, 2 = Low 75%, 3 = Medium 100%, 4 = High 125%, 5 = Very High 150%
default["sdtd"]["serverconfig"]["EnemyDifficulty"]                    = "0"                   # 0 = Normal, 1 = Feral

default["sdtd"]["serverconfig"]["NightPercentage"]                    = "35"                  # percentage in whole numbers
default["sdtd"]["serverconfig"]["BlockDurabilityModifier"]            = "100"                 # percentage in whole numbers

default["sdtd"]["serverconfig"]["LootAbundance"]                      = "100"                 # percentage in whole numbers
default["sdtd"]["serverconfig"]["LootRespawnDays"]                    = "7"                   # days in whole numbers

default["sdtd"]["serverconfig"]["LandClaimSize"]                      = "7"                   # Size in blocks that is protected by a keystone
default["sdtd"]["serverconfig"]["LandClaimDeadZone"]                  = "30"                  # Keystones must be this many blocks apart (unless you are friends with the other player)
default["sdtd"]["serverconfig"]["LandClaimExpiryTime"]                = "3"                   # The number of days a player can be offline before their claims expire and are no longer protected
default["sdtd"]["serverconfig"]["LandClaimDecayMode"]                 = "0"                   # Controls how offline players land claims decay. All claims have full protection for the first 24hrs. 0=Linear, 1=Exponential, 2=Full protection until claim is expired.
default["sdtd"]["serverconfig"]["LandClaimOnlineDurabilityModifier"]  = "4"                   # How much protected claim area block hardness is increased when a player is online. 0 means infinite (no damage will ever be taken). Default is 32x
default["sdtd"]["serverconfig"]["LandClaimOfflineDurabilityModifier"] = "4"                   # How much protected claim area block hardness is increased when a player is offline. 0 means infinite (no damage will ever be taken). Default is 32x
default["sdtd"]["serverconfig"]["AirDropFrequency"]                   = "72"                  # How often airdrop occur in game-hours, 0 == never

default["sdtd"]["serverconfig"]["MaxSpawnedZombies"]                  = "60"                  # Making this number too large (more than about 80) may cause servers to run at poor framerates which will effect lag and play quality for clients.
default["sdtd"]["serverconfig"]["EACEnabled"]                         = "true"                # Enables/Disables EasyAntiCheat

default["sdtd"]["serverconfig"]["SaveGameFolder"]                     = nil                   # use this to override the default save game path
