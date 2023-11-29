# Use AdaWebPack to send HTTP(s) requests from inside WASM

## Instructions for this devcontainer

Tested with AdaWebPack 22.1.0. This sample is based on [AdaWebPack's own examples](https://github.com/godunko/adawebpack/tree/22.1.0/examples).

### Preparation

1. Open this repo in devcontainer, e.g. using Github Codespaces.
   Type or copy/paste following commands to devcontainer's terminal.

### Building

1. `cd` into the folder of this example:

```sh
cd browser
```

2. Compile the example:

```sh
gprbuild $(GPRBUILD_FLAGS) -p -P httpget.gpr
```

3. Copy the glue JS from AdaWebPack distribution to example's folder:

```sh
cp /usr/local/adawebpack/share/adawebpack/adawebpack.mjs ./
```

### Test with browser

1. Run simple HTTP server to temporarily publish project to Web:

```sh
python3 -m http.server
```

Codespace will show you "Open in Browser" button. Just click that button or
obtain web address from "Forwarded Ports" tab.

2. As `index.html` and a 0.5M-sized `main.wasm` are loaded into browser, refer to browser developer console
   to see the results.

### Finish

Perform your own experiments if desired.
