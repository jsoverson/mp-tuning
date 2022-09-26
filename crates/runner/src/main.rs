use anyhow::Result;
use wasmtime::*;

fn main() -> Result<()> {
  let engine = Engine::default();
  let file = std::env::args().nth(1).unwrap();
  let module = Module::from_file(&engine, file)?;

  let mut store = Store::new(&engine, ());

  let imports = [];
  let instance = Instance::new(&mut store, &module, &imports)?;

  let run = instance.get_typed_func::<i32, i32, _>(&mut store, "run")?;

  let result = run.call(&mut store, 42)?;
  println!("Result: {}", result);
  Ok(())
}
