## WASM MACOS

### 1️⃣ Create the directory
```zsh
sudo mkdir -p /opt/emsdk
sudo chown -R $(whoami) /opt/emsdk
```
This gives you ownership so you don’t need sudo later.

### 2️⃣ Clone emsdk into it
```zsh
git clone https://github.com/emscripten-core/emsdk.git /opt/emsdk
cd /opt/emsdk
```

### 3️⃣ Install + activate
```zsh
./emsdk install latest
./emsdk activate latest
```

### 4️⃣ Verify compiler directly
```zsh
/opt/emsdk/upstream/emscripten/em++ --version
```
