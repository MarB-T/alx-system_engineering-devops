# Solve failing requests by increasing traffic an Nginx server can handle

exec { 'fix--for-nginx':
  command => 'sed -ie "s/15/4096/" /etc/default/nginx',
  path    => '/usr/local/bin/:/bin/'
}

exec { 'nginx-restart':
  command => 'service nginx restart',
  path    => '/etc/init.d/'
}
