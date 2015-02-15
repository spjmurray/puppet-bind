# == Class: bind
#
# Installs a bind9 server with DDNS support
#
# === Parameters
#
# [*forwarders*]
#   List of DNS nameservers to forward requests to
#
# [*zones*]
#   List of zones to create
#
# [*rndc_key*]
#   DDNS security key
#
class bind (
  $forwarders = [ '8.8.8.8', '8.8.4.4' ],
  $zones = [],
  $rndc_key = 'Tyl2RswI6Kh2if+grlq3Hw==',
) {

  contain ::bind::install
  contain ::bind::configure
  contain ::bind::service

  Class['::bind::install'] ->
  Class['::bind::configure'] ~>
  Class['::bind::service']

}
