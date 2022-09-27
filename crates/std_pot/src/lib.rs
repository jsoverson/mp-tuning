use std::collections::HashMap;

#[derive(Default, serde::Serialize, serde::Deserialize)]
struct TestStruct {
    u8: u8,
    u64: u64,
    i8: i8,
    i64: i64,
    string: String,
    strings: Vec<String>,
    map: HashMap<u8, String>,
    optional: Option<String>,
}

#[no_mangle]
pub fn run(_input: usize) -> usize {
    let value = TestStruct::default();
    let bytes = pot::to_vec(&value).unwrap();

    bytes.len()
}
