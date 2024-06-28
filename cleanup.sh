echo "Cleanup..."

sudo docker system prune -a
sudo rm -rf $HOME/.dymension
cd $HOME/validators
git stash
git stash drop
git pull
chmod +x build.sh run.sh
./build.sh && ./run.sh
