class devenv::powerline {
    # define global exec path
    Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/', '/usr/local/bin', '/usr/local/sbin' ] }

    # install powerline-status
    class { 'python':
        version     => 'system',
        pip         => 'present',
        dev         => 'absent',
        virtualenv  => 'absent',
        gunicorn    => 'absent',
        require     => Class['ohmyzsh'],
    }

    python::pip { 'powerline-status':
        pkgname       => 'powerline-status',
        ensure        => 'present',
    }

    exec { 'git clone powerline fonts':
      command => "git clone https://github.com/powerline/fonts.git /opt/fonts",
      require => Class['python'],
    }

    exec { 'install powerline fonts':
        command => '/opt/fonts/install.sh',
        require => Exec['git clone powerline fonts'],
    }

    # apply powerline to zsh
    exec { 'install powerline into .zshrc':
      command => 'echo "source /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh" >> /home/vagrant/.zshrc',
      require => Class['python'],
    }

    # apply powerline to tmux

    # apply powerline to vim
}
