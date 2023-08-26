#Using puppet to kill a process killmenow
exec { 'kill_killmenow_process':
  command => 'pkill killmenow',
  onlyif  => 'pgrep killmenow',
  path    => '/usr/bin:/bin:/usr/sbin:/sbin'
}
