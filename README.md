# WASM on macOS (C++ Example)

> This guide demonstrates compiling code to WebAssembly. The example uses C++, but the Emscripten setup is the same for other supported languages — only your build commands would differ.
>
> 💡 Note: If you build with `-s MODULARIZE=1`, the JS embedding uses a Promise (`.then`) instead of `Module.onRuntimeInitialized`.

## Installation and Activation of WASM

### Prerequisites

Ensure you have `git`, `zsh`, and `sudo` privileges installed.

### 1️⃣ Create the directory

```zsh
sudo mkdir -p /opt/emsdk
sudo chown -R $(whoami) /opt/emsdk
```

This gives you ownership so you don’t need `sudo` later.

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

> 💡 Note: Your `build_wasm.sh` script handles sourcing the environment, so no need to `source ./emsdk_env.sh` manually here.

### 4️⃣ Verify compiler directly

```zsh
/opt/emsdk/upstream/emscripten/em++ --version
```

## Using the build script

### Make Executable (after each change!!!)

```zsh
chmod +x build_wasm.sh
```

### Build Command

```zsh
./build_wasm.sh
```

> 💡 Tip: Run `chmod +x` whenever you modify `build_wasm.sh` to ensure it remains executable.

## Frontend JS Embedding (Modularized Build)

If your build uses `-s MODULARIZE=1`, include the generated JS in your HTML as a module and use the Promise pattern:

```html
<script type="module">
  import createModule from "../build/hello.js";

  const output = document.getElementById("output");

  createModule().then(Module => {
    document.getElementById("run").onclick = () => {
      const ptr = Module._say_hello();
      const str = Module.UTF8ToString(ptr);
      output.textContent = str;
    };
  });
</script>
```
