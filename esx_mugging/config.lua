Config = {}
Config.Locale = 'en'

Config.GCPhone = true               --  added for GCPhone server that was not getting police alerts.
Config.progressBars = false         --  If your server has progressBars and wants to use vs text for mugging time.
Config.CopsNeeded = 0             --  Number of Police needed to mug locals.
Config.MinMoney = 25                --  Min amount of money received from mugging
Config.MaxMoney = 65               --  Max amount of money received from mugging.
Config.RobWaitTime = 40             --  Current seconds it takes to finish mugging
Config.AddItemsPerctent = 20        --  This is percent the script will add items as well as cash from mugging.
Config.AddItemsMax = 3              --  This is the max number of items you can receive from NPC from mugging - min is 1

Config.PoliceNotify = 100            --  This is percent the police will get notified: example: 40 means 40% chance of notification.
Config.AlwaysNotifyonDeath = true   --  This will set to 100% notify if NPC dies while someone is mugging them.

Config.giveableItems = {
      'water',
      'bread',
	  'gold',
  }
