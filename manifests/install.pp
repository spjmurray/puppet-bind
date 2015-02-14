# == Class: bind::install
#
class bind::install {

  package { 'bind9':
    ensure => installed,
  }

}
