# == Class: bind::service
#
class bind::service {

  service { 'bind9':
    ensure => running,
  }

}
