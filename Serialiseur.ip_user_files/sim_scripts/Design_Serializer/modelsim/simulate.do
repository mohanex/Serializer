onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -L microblaze_v11_0_4 -L xil_defaultlib -L lmb_v10_v3_0_11 -L lmb_bram_if_cntlr_v4_0_19 -L axi_lite_ipif_v3_0_4 -L mdm_v3_2_19 -L lib_cdc_v1_0_2 -L proc_sys_reset_v5_0_13 -L interrupt_control_v3_1_4 -L axi_gpio_v2_0_24 -L secureip -lib xil_defaultlib xil_defaultlib.Design_Serializer

do {wave.do}

view wave
view structure
view signals

do {Design_Serializer.udo}

run -all

quit -force
