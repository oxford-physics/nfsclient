# Class: nfsclient
#
# This module manages nfsclient
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class nfsclient inherits nfsclient::params {
  ensure_packages ( ['nfs-utils'])
  
  service { 'rpcbind':
    name       => 'rpcbind',
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    subscribe => Package['nfs-utils'],
  }

    
  $dir_default = {
    'ensure' => 'directory',
  }
  $mount_default = {    
    'ensure' => 'mounted',
    'atboot' => true
  }
  create_resources (file, $mount_dir, $dir_default)
  create_resources (mount,$mount_point, $mount_default)
  File <| |> -> Mount <| |>
}
