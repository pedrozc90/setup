
#!/bin/bash

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.0

echo -e "\n# asdf configuration" >> ~/.bashrc
echo ". $HOME/.asdf/asdf.sh" >> ~/.bashrc
echo ". $HOME/.asdf/completions/asdf.bash" >> ~/.bashrc

asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs 18.12.1

asdf plugin add lua https://github.com/Stratus3D/asdf-lua.git
asdf install lua 5.4.4
