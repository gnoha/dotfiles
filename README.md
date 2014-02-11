```
$ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
$ git clone https://github.com/BrentWheeldon/dotfiles
$ ln -s {`pwd`/dotfiles/,~/.}bash_profile
$ ln -s {`pwd`/dotfiles/,~/.}ackrc
$ ln -s {`pwd`/dotfiles/,~/.}gitconfig
$ ln -s {`pwd`/dotfiles/,~/.}inputrc
$ ln -s {`pwd`/dotfiles/,~/.}vimrc
```

Add your git user details to `~/.gitconfig.local`:

```
[user]
  email = brent.wheeldon@gmail.com
  name = Brent Wheeldon
```
