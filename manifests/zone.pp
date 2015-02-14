# == Define: bind::zone
#
# Creates a bind zone
#
define bind::zone {

  file { "/var/lib/bind/zones/db.${name}":
    ensure  => file,
    owner   => 'bind',
    group   => 'bind',
    mode    => '0644',
    content => template('bind/zone.erb'),
    replace => false,
  }

  concat::fragment { $name:
    target  => '/etc/bind/named.conf.local',
    content => template('bind/named.conf.local.erb'),
  }

}
