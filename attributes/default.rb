default['delphic_snapshots']['aws_account']     = "delphic"
default['delphic_snapshots']['retention_days']  = "7"

default['delphic_snapshots']['back_up_schedule']['force_run']   = true
default['delphic_snapshots']['back_up_schedule']['daily']       = true
default['delphic_snapshots']['back_up_schedule']['weekly']      = false
default['delphic_snapshots']['back_up_schedule']['monthly']     = false

## Cron Entries - Defaults are midnight, first day of the month, and sundays. 
default['delphic_snapshots']['cron']['minute']  = "32"
default['delphic_snapshots']['cron']['hour']    = "17"
default['delphic_snapshots']['cron']['day']     = "1"
default['delphic_snapshots']['cron']['week_day'] = "7"

