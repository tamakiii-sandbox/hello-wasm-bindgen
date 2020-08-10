extern crate console_error_panic_hook;
// use std::panic;
use wasm_bindgen::prelude::*;
use wasm_bindgen::JsValue;
use web_sys::console;
// use web_sys;

// When the `wee_alloc` feature is enabled, this uses `wee_alloc` as the global
// allocator.
//
// If you don't want to use `wee_alloc`, you can safely delete this.
#[cfg(feature = "wee_alloc")]
#[global_allocator]
static ALLOC: wee_alloc::WeeAlloc = wee_alloc::WeeAlloc::INIT;

// #[wasm_bindgen]
// pub fn run() -> Result<(), JsValue> {
//     panic::set_hook(Box::new(console_error_panic_hook::hook));
//
//     let document = web_sys::window().unwrap().document().unwrap();
//
//     let p: web_sys::Node = document.create_element("p")?.into();
//
//     p.set_text_context(Some("Hello from Rust, WebAssembly and Webpack!"));
//
//     Ok(())
// }

// This is like the `main` function, except for JavaScript.
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
