#!/bin/sh
# tauri development environment shell set up

sudo apt update -y

# install some compile tools
sudo apt install libwebkit2gtk-4.0-dev \
    build-essential \
    curl \
    wget \
    libssl-dev \
    libgtk-3-dev \
    libayatana-appindicator3-dev \
    librsvg2-dev -y

# install rust env
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf -o rustup.sh
sh rustup.sh -y
case ":${PATH}:" in
    *:"$HOME/.cargo/bin":*)
        ;;
    *)
        # Prepending path in case a system-installed nodejs needs to be overridden
        echo "export PATH=$HOME/.cargo/bin:$PATH" >> $HOME/.bashrc
        ;;
esac

rm -r rustup.sh

# install node env
wget https://nodejs.org/dist/v18.17.1/node-v18.17.1-linux-x64.tar.xz -O node-v18.17.1-linux-x64.tar.xz
sudo mkdir /usr/local/lib/nodejs

sudo tar -xvJf node-v18.17.1-linux-x64.tar.xz -C /usr/local/lib/nodejs

rm -r node-v18.17.1-linux-x64.tar.xz

case ":${PATH}:" in
    *:"/usr/local/lib/nodejs/node-v18.17.1-linux-x64/bin":*)
        ;;
    *)
        # Prepending path in case a system-installed nodejs needs to be overridden
        echo "export PATH=/usr/local/lib/nodejs/node-v18.17.1-linux-x64/bin:$PATH" >> $HOME/.bashrc
        ;;
esac


