

.PHONY: build
build:
	cargo build -p basic --release --target wasm32-unknown-unknown
	wasm-opt --strip-debug -Oz target/wasm32-unknown-unknown/release/basic.wasm -o basic.wasm
	cargo build -p basic --release --target wasm32-wasi
	wasm-opt --strip-debug -Oz target/wasm32-wasi/release/basic.wasm -o basic-wasi.wasm
#
	cargo build -p std_pot --release --target wasm32-unknown-unknown
	wasm-opt --strip-debug -Oz target/wasm32-unknown-unknown/release/std_pot.wasm -o std_pot.wasm
	cargo build -p std_pot --release --target wasm32-wasi
	wasm-opt --strip-debug -Oz target/wasm32-wasi/release/std_pot.wasm -o std_pot-wasi.wasm
#
	cargo build -p messagepack --release --target wasm32-unknown-unknown
	wasm-opt --strip-debug -Oz target/wasm32-unknown-unknown/release/messagepack.wasm -o messagepack.wasm
	cargo build -p messagepack --release --target wasm32-wasi
	wasm-opt --strip-debug -Oz target/wasm32-wasi/release/messagepack.wasm -o messagepack-wasi.wasm
#
	cargo build -p no_std_bincode --release --target wasm32-unknown-unknown
	wasm-opt --strip-debug -Oz target/wasm32-unknown-unknown/release/no_std_bincode.wasm -o no_std_bincode.wasm
	cargo build -p no_std_bincode --release --target wasm32-wasi
	wasm-opt --strip-debug -Oz target/wasm32-wasi/release/no_std_bincode.wasm -o no_std_bincode-wasi.wasm
#
	cargo build -p no_std_postcard_heapless --release --target wasm32-unknown-unknown
	wasm-opt --strip-debug -Oz target/wasm32-unknown-unknown/release/no_std_postcard_heapless.wasm -o no_std_postcard_heapless.wasm
	cargo build -p no_std_postcard_heapless --release --target wasm32-wasi
	wasm-opt --strip-debug -Oz target/wasm32-wasi/release/no_std_postcard_heapless.wasm -o no_std_postcard_heapless-wasi.wasm
#
## broken atm - w/ cobs
##	cargo +nightly build -p no_std_postcard_alloc --release --target wasm32-unknown-unknown
##	wasm-opt --strip-debug -Oz target/wasm32-unknown-unknown/release/no_std_postcard_alloc.wasm -o no_std_postcard_alloc.wasm
##	cargo +nightly build -p no_std_postcard_alloc --release --target wasm32-wasi
##	wasm-opt --strip-debug -Oz target/wasm32-wasi/release/no_std_postcard_alloc.wasm -o no_std_postcard_alloc-wasi.wasm
#
######
#
# These do not offer no_std support - leaving them here in the hopes they one day might !
##	cargo build -p no_std_pot --release --target wasm32-unknown-unknown
##	wasm-opt --strip-debug -Oz target/wasm32-unknown-unknown/release/no_std_pot.wasm -o no_std_pot.wasm
##	cargo build -p no_std_pot --release --target wasm32-wasi
##	wasm-opt --strip-debug -Oz target/wasm32-wasi/release/no_std_pot.wasm -o no_std_pot-wasi.wasm
#
##	cargo build -p std_bincode --release --target wasm32-unknown-unknown
##	wasm-opt --strip-debug -Oz target/wasm32-unknown-unknown/release/std_bincode.wasm -o std_bincode.wasm
##	cargo build -p std_bincode --release --target wasm32-wasi
##	wasm-opt --strip-debug -Oz target/wasm32-wasi/release/std_bincode.wasm -o std_bincode-wasi.wasm
#
	ls -lh target/wasm32-*/release/*.wasm
	ls -lh *.wasm

