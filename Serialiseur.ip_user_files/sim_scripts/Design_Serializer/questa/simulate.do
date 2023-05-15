onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib Design_Serializer_opt

do {wave.do}

view wave
view structure
view signals

do {Design_Serializer.udo}

run -all

quit -force
