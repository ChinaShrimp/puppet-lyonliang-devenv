class devenv::basepackages(Optional[String] $proxy=undef){
    # define global exec path
    Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/', '/usr/local/bin', '/usr/local/sbin' ] }

    # install basic packages
    $packages = [ 'vim', 'git', 'tmux', 'tree' ]
    package { $packages: ensure => present }

    if $proxy != undef {
        exec { 'set git http proxy':
            command => 'git config --global http.proxy ${proxy}',
            require => Package[$packages],
        } ->
        exec { 'set git https proxy':
            command => 'git config --global https.proxy ${proxy}',
        }
    }
}
