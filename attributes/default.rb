default['ebs_snapshots']['aws_account']     = "delphic"
default['ebs_snapshots']['retention_days']  = "7"

default['ebs_snapshots']['back_up_schedule']['force_run']   = false
default['ebs_snapshots']['back_up_schedule']['daily']       = true
default['ebs_snapshots']['back_up_schedule']['weekly']      = false
default['ebs_snapshots']['back_up_schedule']['monthly']     = false

## Cron Entries - Defaults are midnight, first day of the month, and sundays. 
default['ebs_snapshots']['cron']['minute']  = "32"
default['ebs_snapshots']['cron']['hour']    = "17"
default['ebs_snapshots']['cron']['day']     = "1"
default['ebs_snapshots']['cron']['week_day'] = "7"

