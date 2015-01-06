7dtd-server
===========

Installs, configures and runs a `7 Days to Die` server.

[7 Days to Die](http://7daystodie.com/) is a PC zombie survial game made by
"[The Fun Pimps](http://thefunpimps.com/)" and is available through
[Steam](http://store.steampowered.com/app/251570/).


Requirements
------------

* To install a copy of the 7 Days to Die server client via chef, it requires
  credentials of a Steam account with SteamGuard (otherwise user input is
  required to install the server with `steamcmd`) disabled and a licensed copy
  of 7 Days to Die purchased for that account.
* Ubuntu 12.04 (this might work on other `apt-get` based distros, but this is
  currently the only supported version at the moment)


Attributes
----------


### Required

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['sdtd']['steam_username']</tt></td>
    <td>String</td>
    <td>Steam username with a `7 Days to Die` license (required)</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['steam_password']</tt></td>
    <td>String</td>
    <td>Password for the above username (required)</td>
    <td><tt>nil</tt></td>
  </tr>
</table>


### Server Config

Settings that determine the difficulty and other settings of the server, as
well as alternative admin settings and controls.

#### Basic Config

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['ServerPort']</tt></td>
    <td>String</td>
    <td>Port you want the server to listen on</td>
    <td><tt>"26900"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['ServerIsPublic']</tt></td>
    <td>String</td>
    <td>Whether or not to register this server with the master server.</td>
    <td><tt>"false"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['ServerName']</tt></td>
    <td>String</td>
    <td>Name of the server</td>
    <td><tt>"My Game Host"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['ServerPassword']</tt></td>
    <td>String</td>
    <td>Password for the server</td>
    <td><tt>""</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['ServerMaxPlayerCount']</tt></td>
    <td>String</td>
    <td>Maximum Concurrent Players</td>
    <td><tt>"8"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['ServerDescription']</tt></td>
    <td>String</td>
    <td>Description for the server</td>
    <td><tt>"A 7DTD server"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['ServerWebsiteURL']</tt></td>
    <td>String</td>
    <td>Website URL for the server</td>
    <td><tt>""</tt></td>
  </tr>
</table>


#### Game settings

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['GameWorld']</tt></td>
    <td>String</td>
    <td>Options:  Navezgane, MP Wasteland Horde, MP Wasteland Skirmish, MP Wasteland War, Random Gen</td>
    <td><tt>"Random Gen"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['GameName']</tt></td>
    <td>String</td>
    <td>Name of the game.  Controls the server SEED.</td>
    <td><tt>"My Game"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['GameDifficulty']</tt></td>
    <td>String</td>
    <td>0 - 4, 0=easiest, 4=hardest</td>
    <td><tt>"2"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['GameMode']</tt></td>
    <td>String</td>
    <td>GameModeSurvivalMP, GameModeSurvivalSP (MP has land protection)</td>
    <td><tt>"GameModeSurvivalMP"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['ZombiesRun']</tt></td>
    <td>String</td>
    <td>0 = default day/night walk/run, 1 = never run, 2 = always run</td>
    <td><tt>"0"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['BuildCreate']</tt></td>
    <td>String</td>
    <td>cheat mode on/off</td>
    <td><tt>"false"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['DayNightLength']</tt></td>
    <td>String</td>
    <td>Time in minutes</td>
    <td><tt>"40"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['FriendlyFire']</tt></td>
    <td>String</td>
    <td>Can friendly players damage each other (PvP)</td>
    <td><tt>"false"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['PersistentPlayerProfiles']</tt></td>
    <td>String</td>
    <td>
      If disabled a player can join with any selected profile. If true they
      will join with the last profile they joined with
    </td>
    <td><tt>"true"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['DropOnDeath']</tt></td>
    <td>String</td>
    <td>0 = everything, 1 = toolbelt only, 2 = backpack only, 3 = delete all</td>
    <td><tt>"0"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['DropOnQuit']</tt></td>
    <td>String</td>
    <td>0 = nothing, 1 = everything, 2 = toolbelt only, 3 = backpack only</td>
    <td><tt>"0"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['CraftTimer']</tt></td>
    <td>String</td>
    <td>0 = None (instant), 1 = Normal, 2 = Fast (double speed)</td>
    <td><tt>"1"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['LootTime']</tt></td>
    <td>String</td>
    <td>0 = None (instant), 1 = Normal, 2 = Fast (double speed)</td>
    <td><tt>"1"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['EnemySenseMemory']</tt></td>
    <td>String</td>
    <td>Time, in seconds, that a zombie will pursue something that has been sensed.</td>
    <td><tt>"60"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['EnemySpawnMode']</tt></td>
    <td>String</td>
    <td>0 = Disabled 0%, 1 = Very Low 50%, 2 = Low 75%, 3 = Medium 100%, 4 = High 125%, 5 = Very High 150%</td>
    <td><tt>"3"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['EnemyDifficulty']</tt></td>
    <td>String</td>
    <td>0 = Normal, 1 = Feral</td>
    <td><tt>"0"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['NightPercentage']</tt></td>
    <td>String</td>
    <td>Percentage in whole numbers.</td>
    <td><tt>"35"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['BlockDurabilityModifier']</tt></td>
    <td>String</td>
    <td>Percentage in whole numbers.</td>
    <td><tt>"100"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['LootAbundance']</tt></td>
    <td>String</td>
    <td>Percentage in whole numbers.</td>
    <td><tt>"100"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['LootRespawnDays']</tt></td>
    <td>String</td>
    <td>Days in whole numbers.</td>
    <td><tt>"7"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['LandClaimSize']</tt></td>
    <td>String</td>
    <td>Size in blocks that is protected by a keystone</td>
    <td><tt>"7"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['LandClaimDeadZone']</tt></td>
    <td>String</td>
    <td>Keystones must be this many blocks apart (unless you are friends with the other player)</td>
    <td><tt>"30"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['LandClaimExpiryTime']</tt></td>
    <td>String</td>
    <td>The number of days a player can be offline before their claims expire and are no longer protected</td>
    <td><tt>"3"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['LandClaimDecayMode']</tt></td>
    <td>String</td>
    <td>Controls how offline players land claims decay. All claims have full protection for the first 24hrs. 0=Linear, 1=Exponential, 2=Full protection until claim is expired.</td>
    <td><tt>"0"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['LandClaimOnlineDurabilityModifier']</tt></td>
    <td>String</td>
    <td>How much protected claim area block hardness is increased when a player is online. 0 means infinite (no damage will ever be taken). Default is 32x</td>
    <td><tt>"4"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['LandClaimOfflineDurabilityModifier']</tt></td>
    <td>String</td>
    <td>How much protected claim area block hardness is increased when a player is offline. 0 means infinite (no damage will ever be taken). Default is 32x</td>
    <td><tt>"4"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['AirDropFrequency']</tt></td>
    <td>String</td>
    <td>How often airdrop occur in game-hours, 0 == never</td>
    <td><tt>"72"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['MaxSpawnedZombies']</tt></td>
    <td>String</td>
    <td>Making this number too large (more than about 80) may cause servers to run at poor framerates which will effect lag and play quality for clients.</td>
    <td><tt>"60"</tt></td>
  </tr>
</table>


#### Control Panel Settings

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['ControlPanelEnabled']</tt></td>
    <td>String</td>
    <td>Enable/Diable the control panel</td>
    <td><tt>"false"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['ControlPanelPort']</tt></td>
    <td>String</td>
    <td>Port of the control panel webpage</td>
    <td><tt>"8080"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['ControlPanelPassword']</tt></td>
    <td>String</td>
    <td>Password to gain entry to the control panel</td>
    <td><tt>"CHANGEME"</tt></td>
  </tr>
</table>


#### Telnet Settings

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['TelnetEnabled']</tt></td>
    <td>String</td>
    <td>Enable/Diable the telnet</td>
    <td><tt>"true"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['TelnetPort']</tt></td>
    <td>String</td>
    <td>Port of the telnet server</td>
    <td><tt>"8081"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['TelnetPassword']</tt></td>
    <td>String</td>
    <td>Password to gain entry to the telnet interface</td>
    <td><tt>"CHANGEME"</tt></td>
  </tr>
</table>


#### NAT Settings

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['DisableNAT']</tt></td>
    <td>String</td>
    <td>Set this to true if your router doesn't support NAT</td>
    <td><tt>"true"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['AdminFileName']</tt></td>
    <td>String</td>
    <td>Server Admin file name</td>
    <td><tt>"admins.xml"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['EACEnabled']</tt></td>
    <td>String</td>
    <td>Enables/Disables EasyAntiCheat</td>
    <td><tt>"true"</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serverconfig']['SaveGameFolder']</tt></td>
    <td>String</td>
    <td>Use this to override the default save game path</td>
    <td><tt>nil</tt></td>
  </tr>
</table>


### Admin Config

This sets up the admin configuration for the default instance.  Admins,
moderators and commands all have permission levels associated with them.  The
commands available to the admins and moderators are determined by the
permissions assigned to each of the commands.

A whitelist can also be set up that only allows those that are a part of the
list.

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['sdtd']['serveradmin']['admins']</tt></td>
    <td>Hash</td>
    <td>
      A hash of Steam IDs and Permission levels as keys and values of the hash
      respectively to be admins of the server.
    </td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serveradmin']['moderators']</tt></td>
    <td>Hash</td>
    <td>
      A hash of Steam IDs and Permission levels as keys and values of the hash
      respectively to be moderators of the server.
    </td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serveradmin']['permissions']</tt></td>
    <td>Hash</td>
    <td>
      A hash of commands and Permission levels as keys and values of the hash
      respectively for permission levels for each command.
    </td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serveradmin']['whitelist']</tt></td>
    <td>Hash</td>
    <td>
      A hash of Steam IDs and Permission levels as keys and values of the hash
      respectively of servers to be allowed to the server.  If there are any
      items in the whitelist, the whitelist only mode is enabled.
    </td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['sdtd']['serveradmin']['blacklist']</tt></td>
    <td>Hash</td>
    <td>
      A hash of Steam IDs and Unban date as keys and values of the hash
      respectively for blacklist of steam users and when the ban is lifted.
    </td>
    <td><tt>nil</tt></td>
  </tr>
</table>


Recipes
-------

* `7dtd-server::default`:  Installs the server, creates an instance, and runs
  the server
* `7dtd-server::install`:  Installs the server
* `7dtd-server::create`:   Creates/configures an instance
* `7dtd-server::backup`:   Setups up backups for the server instance (TODO)
* `7dtd-server::start`:    Starts the server (TODO)
* `7dtd-server::stop`:     Stops the server (TODO)


Usage
-----

### 7dtd-server::default

Include `7dtd-server` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[7dtd-server::default]"
  ]
}
```

Add include the following attributes:

```ruby
override['sdtd']['steam_username'] = "YOUR_STEAM_USERNAME"
override['sdtd']['steam_password'] = "YOUR_STEAM_PASSWORD"
```


### 7dtd-server::backup

After having run the `install` and `instance` recipes (or default, which does
both), add `backup` to the run list:

```json
{
  "run_list": [
    "recipe[7dtd-server::backup]"
  ]
}
```


TODO
----

* Add rsync script from vagrant
* Convert definitions to LWRPs
* Refactor code


Author
------

Author:: Nicholas LaMuro
