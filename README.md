# MessagePack tuning library

## Install wasm-opt

- https://github.com/WebAssembly/binaryen

## Build

This command will build the two projects with both wasm32-wasi & wasm32-unknown-unknown targets, run them all through wasm-opt, then do a `ls -lh` to compare sizes.

```shell-session
$ make
[...compiling...]
ls -lh target/wasm32-*/release/*.wasm
219B Sep 26 10:55 target/wasm32-unknown-unknown/release/basic.wasm
171K Sep 26 10:55 target/wasm32-unknown-unknown/release/messagepack.wasm
318B Sep 26 10:55 target/wasm32-wasi/release/basic.wasm
249K Sep 26 10:55 target/wasm32-wasi/release/messagepack.wasm
ls -lh *.wasm
189B Sep 26 10:57 basic-wasi.wasm
176B Sep 26 10:57 basic.wasm
 58K Sep 26 10:57 messagepack-wasi.wasm
 34K Sep 26 10:57 messagepack.wasm
```

## Running

This project includes a basic runner that will run non-wasi wasm:

```shell-session
$ cargo run -p runner -- messagepack.wasm
```
