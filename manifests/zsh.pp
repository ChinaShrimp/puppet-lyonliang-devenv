class devenv::zsh {
    # define global exec path
    Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/', '/usr/local/bin', '/usr/local/sbin' ] }

    # install zsh&oh-my-zsh
    class { 'ohmyzsh': }
    ohmyzsh::install { 'vagrant': }
    ohmyzsh::plugins { 'vagrant': plugins => 'git extract tmux z vi-mode' }

    exec { 'add puppet path into .zshrc':
        command => 'echo "PATH=/opt/puppetlabs/bin:$PATH" >> /home/vagrant/.zshrc',
        require => Class['ohmyzsh'],
    }
}
