#![no_std]

use core::panic::PanicInfo;
use heapless::Vec;

#[panic_handler]
fn foo(_: &PanicInfo) -> ! {
    loop {}
}

#[derive(Default, serde::Serialize, serde::Deserialize)]
struct TestStruct<'a> {
    bytes: &'a [u8],
    str_s: &'a str,
}

#[no_mangle]
pub fn run(_input: usize) -> usize {
    let value = TestStruct::default();
    // this is the fun thing no dynamic sizing as we got no heap ;)
    // fixed sized byte buffers - 11 is just size placeholder
    let bytes: Vec<u8, 11> = postcard::to_vec(&value).unwrap();

    bytes.len()
}
