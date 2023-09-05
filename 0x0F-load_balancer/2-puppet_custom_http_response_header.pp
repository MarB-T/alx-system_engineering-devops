# Install Nginx
class { 'nginx':
  ensure => 'installed',
}

# Define a custom fact to retrieve the server's hostname
facts['custom_http_header'] = $::hostname

# Define an Nginx server block with a custom HTTP header
file { '/etc/nginx/sites-available/custom_http_header':
  ensure  => 'file',
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  content => template('my_module/custom_http_header.erb'),
}

# Create a symbolic link to enable the custom server block
file { '/etc/nginx/sites-enabled/custom_http_header':
  ensure => 'link',
  target => '/etc/nginx/sites-available/custom_http_header',
  notify => Service['nginx'],
}

# Ensure Nginx service is running and enabled
service { 'nginx':
  ensure  => 'running',
  enable  => true,
  require => [
    File['/etc/nginx/sites-enabled/custom_http_header'],
  ],
}

