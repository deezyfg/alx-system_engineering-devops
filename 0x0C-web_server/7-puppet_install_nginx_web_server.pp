# Set up a new Ubuntu server with Nginx

# Update system packages
exec { 'update system':
        command => '/usr/bin/apt-get update',
}

# Install Nginx package
package { 'nginx':
	ensure => 'installed',
	require => Exec['update system']
}

# Create an index file with "Hello World!"
file {'/var/www/html/index.html':
	content => 'Hello World!'
}

# Set up redirection to a YouTube video for /redirect_me
exec {'redirect_me':
	command => 'sed -i "24i\	rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;" /etc/nginx/sites-available/default',
	provider => 'shell'
}

# Ensure Nginx service is running
service {'nginx':
	ensure => running,
	require => Package['nginx']
}