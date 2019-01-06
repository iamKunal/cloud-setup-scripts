![Built with love](http://forthebadge.com/images/badges/built-with-love.svg)
# Cloud Setup Scripts

These are my personal files containing the scripts, I use to setup a fresh Ubuntu 16.04 instance on my AWS.

Everything is managed mostly using [`zplug`](https://github.com/zplug/zplug).


## Installing and Usage


```bash
git clone https://github.com/iamKunal/cloud-setup-scripts.git
cd cloud-setup-scripts
./setup.sh
# Please change shell to zsh using chsh or manually editing the `/etc/passwd` file.
. ~/.zplugrc
zplug install
zplug load --verbose
```



## Configuration and modding

* `apt.packages` - contains one package (per line or separated by space)
  to be installed using `apt`
* `setup.sh` - The installer script
* `scripts/` - Add scripts you wish to execute, should be made executable and `setup.sh` will execute them upon running. Look at sample scripts in `sample/scripts/`
* `dotfiles` - These will be directly copied over to your `$HOME` directory.
