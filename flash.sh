#!/usr/bin/env bash

cargo build --release --target thumbv7em-none-eabi && \
arm-none-eabi-readelf -A ./target/thumbv7em-none-eabi/release/teensy && \
arm-none-eabi-objcopy -O ihex ./target/thumbv7em-none-eabi/release/teensy ./target/thumbv7em-none-eabi/release/teensy.hex && \
teensy_loader_cli -w -mmcu=mk20dx256 ./target/thumbv7em-none-eabi/release/teensy.hex -v;
