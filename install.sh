cp -avr ./.config/nvim/init.vim $HOME/ --parents
cp -avr ./.oh-my-zsh/custom/themes $HOME/ --parents
cp -avr ./.ssh $HOME/ --parents
cp -avr ./.zshrc $HOME/ --parents
cp -avr ./.tmux.conf $HOME/ --parents

# Install service on lock
sudo cp -avr ./.synergy.conf /etc/synergy.conf
sudo cp -avr ./service/daiz-lock /etc
sudo cp -avr ./service/*.service /etc/systemd/system
sudo systemctl daemon-reload && sudo systemctl restart synergy_on_lock.service

