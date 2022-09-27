#![no_std]
#![feature(default_alloc_error_handler)]

use core::panic::PanicInfo;
extern crate alloc;
use alloc::vec::Vec;

// Yes alloc() String but without std :D
use alloc::string::String;

// Vec, hashmap with collections :)

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
    // hoorray alloc :D
    let bytes: Vec<u8> = postcard::to_allocvec(&value).unwrap();

    bytes.len()
}
