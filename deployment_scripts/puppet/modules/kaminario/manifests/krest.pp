class  kaminario::krest{
  package { 'python-pip':
  ensure => installed,}
package { 'krest':
  ensure => installed,
  provider => pip,
  require => Package['python-pip'],}
  package { 'git':
  ensure => installed,}
}
