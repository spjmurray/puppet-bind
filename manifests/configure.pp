# == Class: bind::configure
#
class bind::configure {

  include ::bind

  $forwarders = $bind::forwarders
  $zones = $bind::zones
  $rndc_key = $bind::rndc_key

  # bind::zone implicitly requires this directory for anchoring
  file { '/var/lib/bind/zones':
    ensure => directory,
    owner  => 'root',
    group  => 'bind',
    mode   => '0775',
  }

  bind::zone { $zones: }

  file { '/etc/bind/named.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'bind',
    mode    => '0644',
    content => template('bind/named.conf.erb'),
  }

  file { '/etc/bind/named.conf.controls':
    ensure  => file,
    owner   => 'root',
    group   => 'bind',
    mode    => '0666',
    content => template('bind/named.conf.controls.erb'),
  }

  file { '/etc/bind/named.conf.options':
    ensure  => file,
    owner   => 'root',
    group   => 'bind',
    mode    => '0644',
    content => template('bind/named.conf.options.erb'),
  }

  # bind::zone implicitly befores this file for anchoring
  concat { '/etc/bind/named.conf.local':
    ensure => present,
    owner  => 'root',
    group  => 'bind',
    mode   => '0644',
  }

  file { '/etc/bind/rndc.key':
    ensure  => file,
    owner   => 'root',
    group   => 'bind',
    mode    => '0640',
    content => template('bind/rndc.key.erb'),
  }

}
