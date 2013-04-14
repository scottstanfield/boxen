class people::scottstanfield {

	notify { 'processing people::scottstanfield': }

	include iterm2::dev
	include chrome::dev
	include zsh
	include osx::recovery_message { 'If found please call 510-220-8825 for reward.': }

	# include notational_velocity::nvalt
	# include sizeup

	$home = "/Users/${::luser}"
	$dotfiles = "${home}/.dotfiles"

	# Change default shell to zsh from Homebrew
	osx_chsh { $::luser:
		shell    => '/opt/boxen/homebrew/bin/zsh',
		require  => Package['zsh'],
	}

	file_line { 'add zsh to /etc/shells':
		path    => '/etc/shells',
		line    => "${boxen::config::homebrewdir}/bin/zsh",
		require => Package['zsh'],
	}


	repository { $dotfiles:
		source => 'scottstanfield/dotfiles',
	}
}
