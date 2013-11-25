# == Class puppet::master::fileserver
# Parameters
#
# [*mount_points*]
#   list of hash: name, path, allow
#   Example:
#  puppet::master::fileserver {
#    mount_points => [
#     {  name     => 'files',
#        path     => '/etc/puppet/files',
#        allow    => '*',
#     }
#   ],
# }
class puppet::master::fileserver ($mount_points=undef) {
  file { '/etc/puppet/fileserver.conf':
    ensure  => file,
    owner   => 'puppet',
    group   => 'puppet',
    mode    => '0664',
    content => template('puppet/fileserver.conf.erb'),
  }
}
