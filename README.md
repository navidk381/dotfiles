
# dotfiles
This rep conatins NavidK's config files so that it becomes easier to set the configurations for zsh when you are using different machines. 

## ROS Package Installer:
Before making any ros packages run the command below in the workspace (e.g, dsl and extras)
```
$ rosdep install --from-paths src --ignore-src --rosdistro melodic -y
```
## zsh:
1. Make sure you are updated: 
```
$ sudo apt-get update
```
2. Make sure you have Git and zsh installed on you machine:
```
$ sudo apt-get install zsh git
```
3. Look up your zsh path: (/usr/bin/zsh)
```
$ which zsh
```
4. Change your shell to zsh (/usr/bin/zsh)
```
$ chsh -s /usr/bin/zsh
``` 
5. Go to [Oh My Zsh](https://ohmyz.sh/):
```
$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
6. Change directory if you want:
```
$ mkdir ~/myrepo & cd ~/myrepo	
```
7. Clone this repo `dotfiles`:
```
$ git clone https://github.com/navidk381/dotfiles.git
```
8. Replace the .zashrc file you have under ```$HOME/.zshrc``` simply by my .zashrc 
```
$ cp zsh/.zshrc ~
```
Features:
 - [ ] A nice theme
 - [ ] Git plugin is available
 - [ ] `zshconfig` opens ~/.zshrc
 - [ ] `execbash` switches to bash
 - [ ] ROS *melodic* is sourced

9. Install the font `Inconsolata for Powerline.otf`
		Just open it and click Install.  

10. Change the font to `Inconsolata for Powerline` (`bold`) in the Terminal preferences
		Open up a terminal:`Edit` -> `Preferences` -> `Profiles` -> `Custom Font`

11. Log out and log in. 



