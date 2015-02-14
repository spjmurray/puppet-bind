#Bind

####Table Of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Usage](#usage)
4. [Limitations](#limitations)

##Overview

Create a stand-alone BIND 9 instance.

##Module Description

Extremely simple installation and configuration of ISC BIND 9 on Ubuntu.
It is intended to be used for one-shot deployemnts in testing environments.
The server is enabled with DDNS and is the intended way to perform updates.
Any host is allowed to perform updates on any zone.

##Usage

Create a server with forward and reverse DNS zones

```puppet
include ::bind

bind::zone { 'example.com': }
bind::zone { '0.16.172.in-addr.arpa': }
```

##Limitations

1. Ubuntu only
2. Reverse zones are case sensitive i.e. must be '.in-addr.arpa'
