class nfsclient::params {
  $mount_dir = hiera_hash ('nfsclient::params::mount_dir', {})
  $mount_point = hiera_hash ('nfsclient::params::mount_point', {})
}