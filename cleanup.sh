echo "Cleanup..."

sudo docker system prune -a
sudo rm -rf $HOME/.dymension
cd $HOME/validators && git stash
cd $HOME/validators && git stash drop
cd $HOME/validators && git stash pull
chmod +x build.sh run.sh
./build.sh && ./run.sh
