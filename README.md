```
$ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
$ git clone https://github.com/BrentWheeldon/dotfiles
$ ln -s {`pwd`/dotfiles/,~/.}bash_profile
$ ln -s {`pwd`/dotfiles/,~/.}ackrc
$ ln -s {`pwd`/dotfiles/,~/.}gitconfig
$ ln -s {`pwd`/dotfiles/,~/.}inputrc
$ ln -s {`pwd`/dotfiles/,~/.}vimrc
$ ln -s {`pwd`/dotfiles/,~/.}gemrc
$ ln -s {`pwd`/dotfiles/,~/.}psqlrc
$ vim -c "BundleInstall" -c "qa"
$ cd ~/.vim/bundle/command-t/ruby/command-t
$ make clean
$ /System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/bin/ruby extconf.rb
$ make
```

Add your git user details to `~/.gitconfig.local`:

```
[user]
  email = <email>
  name = <name>
```
