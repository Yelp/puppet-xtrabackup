# == Class: xtrabackup
#
# Configures xtrabackup to take MySQL database backups
#
# === Parameters
#
# [*workdir*]
#   Working directory.  The volume it is on needs at least as much free space as
#   total database size on disk.  Must already exist.
#   (Optional, uses /tmp by default)
# [*outputdir*]
#   Directory to write backups to.  If sshdest is also specified, will be the remote 
#   database host.  Must already exist.
#   (Required)
# [*sshdest*]
#   Destination host to send to via SSH.  Assumes keys already set up.
#   Prefix with username if not root.
#   (Optional, writes to local machine if not set)
# [*sshkey*]
#   SSH private key to use, if not default /root/.ssh/id_rsa or similar
#   (Optional if sshdest is specified)
# [*keeydays*]
#   Delete backups older than this age in days.  THIS WILL CLEAR ALL FILES IN
#   outputdir!!
#   (Optional, disabled by default)
# [*gzip*]
#   Whether to compress backups using gzip
#   (Optional, enabled by default)
# [*parallel*]
#   Speed up backup by using this many theads.
#   (Optional, defaults to 1)
# [*slaveinfo*]
#   Record master info so that a slave can be created from this backup.
#   (Optional, disabled by default)
# [*safeslave*]
#   Stop slaving and connections to it whilst taking the backup, re-starting when
#   finished.  Off by default, strongly recommended for slaves.
#   (Optional, disabled by default)
# [*scriptdir*]
#   Specify the actual directory to put the script on the filesystem
#
# === Examples
#
#  Create a backup and set the retention policy to 2 weeks
#
#  class { "xtrabackup":
#    keepdays  => 14,
#    workdir   => "/root/backupworkdir",
#    outputdir => "/mnt/nfs/mysqlbackups",
#  }
#
# === Authors
#
# Sam Bashton <sam@bashton.com>
#
# === Copyright
#
# Copyright 2013 Bashton Ltd
#
class xtrabackup (
  $workdir   = '/tmp',            # Working directory
  $outputdir,                     # Directory to output to
  $sshdest   = undef,             # SSH destination
  $sshkey    = undef,             # SSH private key to use
  $keepdays  = undef,             # Keep the last x days of backups
  $gzip      = true,              # Compress using gzip
  $parallel  = 1,                 # Threads to use
  $slaveinfo = undef,             # Record master log pos if true
  $safeslave = undef,             # Disconnect clients from slave
  $scriptdir  = '/usr/local/bin/' # The default script dir
) {
  class{'xtrabackup::install': } ->
  class{'xtrabackup::config': } ->
  Class['xtrabackup']
}
