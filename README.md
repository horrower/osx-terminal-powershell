# osx-terminal-powershell


## Installation:
1) Install font (double click `Monaco%20for%20Powerline.otf`)
2) Setup terminal for use this font (iTerm or Terminal settings - set as default. [Helpfull info for iTerm2](https://github.com/horrower/osx-terminal-powershell/issues/2) )
3) Copy .git-completion.bash in your ~

     `# cp .git-completion.bash ~/.git-completion.bash`
4) Copy and paste lines from powerfull.bash to your ~/.bash_profile

    `# cat ./powerfull.bash  >> ~/.bash_profile`
5) [ Optional ] You can uncomment some usage git aliases in your ~/.bash_profile file
6) [ Optional ] If you faced issues with Midnight Commander not working highlight :
  
   - If file `.bashrc` exists in your home folder you should copy powerfull.bash content in it: 
     `# cat ./powerfull.bash  >> ~/.bashrc` 
   - If not, create symlink: 
     `# ln -s .bash_profile .bashrc`
   - Restart Midnight Commander
## Options

* **SHOW_UNTRACKED_AS_DIRTY**
    * **1**: Will mark powershell as red(dirty) when branch have untracked file
    * **0**: Will mark powershell as clean(blue) when branch have untracked files



## Screenshots

![Image 1](https://raw.githubusercontent.com/horrower/osx-terminal-powershell/master/images/1.png)

![Image 2](https://raw.githubusercontent.com/horrower/osx-terminal-powershell/master/images/2.png)

![Image 3](https://raw.githubusercontent.com/horrower/osx-terminal-powershell/master/images/3.png)