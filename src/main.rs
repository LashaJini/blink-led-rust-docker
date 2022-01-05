use std::error::Error;
use std::thread;
use std::time::Duration;

use rppal::gpio::{Gpio, OutputPin};
use rppal::system::DeviceInfo;

// Gpio uses BCM pin numbering. BCM GPIO 23 is tied to physical pin 16.
const GPIO_LED: u8 = 23;

fn blink(pin: &mut OutputPin, ms: Option<u64>) {
    pin.set_high();
    thread::sleep(Duration::from_millis(ms.unwrap_or(500)));
    pin.set_low();
}

fn main() -> Result<(), Box<dyn Error>> {
    println!("Blinking an LED on a {}.", DeviceInfo::new()?.model());

    let mut pin = Gpio::new()?.get(GPIO_LED)?.into_output();

    blink(&mut pin, None);

    Ok(())
}
