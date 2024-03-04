use mandelbrot_explorer::run;

use wasm_bindgen::prelude::*;
use web_sys::console;

fn main() {
    println!("Hello, world!");
    pollster::block_on(run());
}

#[wasm_bindgen(start)]
pub fn main_js() -> Result<(), JsValue> {
    // This provides better error messages in debug mode.
    // It's disabled in release mode so it doesn't bloat up the file size.
    #[cfg(debug_assertions)]
    console_error_panic_hook::set_once();

    // Your code goes here!
    console::log_1(&JsValue::from_str("Hello world!"));

    Ok(())
}
