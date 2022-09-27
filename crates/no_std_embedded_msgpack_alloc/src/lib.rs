#![cfg_attr(not(test), no_std)]
#![feature(default_alloc_error_handler)]

#[cfg(not(test))]
use core::panic::PanicInfo;
#[cfg(not(test))]
extern crate alloc;
#[cfg(not(test))]
use alloc::string::String;

// This heap allocator is research thing, can use the std detached one instead
#[global_allocator]
#[cfg(not(test))]
static ALLOCATOR: lol_alloc::FreeListAllocator = lol_alloc::FreeListAllocator::new();

#[panic_handler]
#[cfg(not(test))]
fn foo(_: &PanicInfo) -> ! {
    loop {}
}

#[derive(Default, serde::Serialize, serde::Deserialize)]
struct TestStruct {
    s: String,
}

#[no_mangle]
pub fn run(input: String) -> usize {
    let value = TestStruct { s: input };
    
    let mut buf = [0u8; 1000];
    
    let written = embedded_msgpack::encode::serde::to_array(&value, &mut buf).unwrap();

    written
}

#[cfg(test)]
mod test {

    use super::*;

    #[test]
    fn t_run() {
        assert_eq!(run("This is a String".to_string()), 20); // serialized is 20 bytes ?
    }

}
