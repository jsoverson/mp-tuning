

.PHONY: build
build:
	cargo build -p basic --release --target wasm32-unknown-unknown
	wasm-opt --strip-debug -Oz target/wasm32-unknown-unknown/release/basic.wasm -o basic.wasm
	cargo build -p basic --release --target wasm32-wasi
	wasm-opt --strip-debug -Oz target/wasm32-wasi/release/basic.wasm -o basic-wasi.wasm
	cargo build -p messagepack --release --target wasm32-unknown-unknown
	wasm-opt --strip-debug -Oz target/wasm32-unknown-unknown/release/messagepack.wasm -o messagepack.wasm
	cargo build -p messagepack --release --target wasm32-wasi
	wasm-opt --strip-debug -Oz target/wasm32-wasi/release/messagepack.wasm -o messagepack-wasi.wasm
	ls -lh target/wasm32-*/release/*.wasm
	ls -lh *.wasm

