# == Class: bind::configure
#
class bind::configure {

  include ::bind

  $forwarders = $bind::forwarders
  $rndc_key = $bind::rndc_key

  File {
    owner => 'root',
    group => 'bind',
  }

  # bind::zone implicitly requires this directory for anchoring
  file { '/var/lib/bind/zones':
    ensure => directory,
    group  => 'bind',
    mode   => '0775',
  }

  file { '/etc/bind/named.conf':
    ensure  => file,
    mode    => '0644',
    content => template('bind/named.conf.erb'),
  }

  file { '/etc/bind/named.conf.controls':
    ensure  => file,
    mode    => '0666',
    content => template('bind/named.conf.controls.erb'),
  }

  file { '/etc/bind/named.conf.options':
    ensure  => file,
    mode    => '0644',
    content => template('bind/named.conf.options.erb'),
  }

  # bind::zone implicitly befores this file for anchoring
  concat { '/etc/bind/named.conf.local':
    ensure => present,
    mode   => '0644',
  }

  file { '/etc/bind/rndc.key':
    ensure  => file,
    mode    => '0640',
    content => template('bind/rndc.key.erb'),
  }

}
