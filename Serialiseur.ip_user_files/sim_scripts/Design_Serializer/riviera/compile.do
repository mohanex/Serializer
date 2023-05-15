vlib work
vlib riviera

vlib riviera/microblaze_v11_0_4
vlib riviera/xil_defaultlib
vlib riviera/lmb_v10_v3_0_11
vlib riviera/lmb_bram_if_cntlr_v4_0_19
vlib riviera/axi_lite_ipif_v3_0_4
vlib riviera/mdm_v3_2_19
vlib riviera/lib_cdc_v1_0_2
vlib riviera/proc_sys_reset_v5_0_13
vlib riviera/interrupt_control_v3_1_4
vlib riviera/axi_gpio_v2_0_24

vmap microblaze_v11_0_4 riviera/microblaze_v11_0_4
vmap xil_defaultlib riviera/xil_defaultlib
vmap lmb_v10_v3_0_11 riviera/lmb_v10_v3_0_11
vmap lmb_bram_if_cntlr_v4_0_19 riviera/lmb_bram_if_cntlr_v4_0_19
vmap axi_lite_ipif_v3_0_4 riviera/axi_lite_ipif_v3_0_4
vmap mdm_v3_2_19 riviera/mdm_v3_2_19
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 riviera/proc_sys_reset_v5_0_13
vmap interrupt_control_v3_1_4 riviera/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_24 riviera/axi_gpio_v2_0_24

vcom -work microblaze_v11_0_4 -93 \
"../../../../Serialiseur.srcs/sources_1/bd/Design_Serializer/ipshared/9285/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/Design_Serializer/ip/Design_Serializer_microblaze_0_0/sim/Design_Serializer_microblaze_0_0.vhd" \

vcom -work lmb_v10_v3_0_11 -93 \
"../../../../Serialiseur.srcs/sources_1/bd/Design_Serializer/ipshared/c2ed/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/Design_Serializer/ip/Design_Serializer_dlmb_v10_2/sim/Design_Serializer_dlmb_v10_2.vhd" \
"../../../bd/Design_Serializer/ip/Design_Serializer_ilmb_v10_2/sim/Design_Serializer_ilmb_v10_2.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_19 -93 \
"../../../../Serialiseur.srcs/sources_1/bd/Design_Serializer/ipshared/0b98/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/Design_Serializer/ip/Design_Serializer_dlmb_bram_if_cntlr_2/sim/Design_Serializer_dlmb_bram_if_cntlr_2.vhd" \
"../../../bd/Design_Serializer/ip/Design_Serializer_ilmb_bram_if_cntlr_2/sim/Design_Serializer_ilmb_bram_if_cntlr_2.vhd" \
"c:/Users/mafassi/Downloads/serializer/Serializer/Serialiseur.srcs/sources_1/bd/Design_Serializer/ip/Design_Serializer_lmb_bram_2/Design_Serializer_lmb_bram_2_sim_netlist.vhdl" \

vcom -work axi_lite_ipif_v3_0_4 -93 \
"../../../../Serialiseur.srcs/sources_1/bd/Design_Serializer/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work mdm_v3_2_19 -93 \
"../../../../Serialiseur.srcs/sources_1/bd/Design_Serializer/ipshared/8715/hdl/mdm_v3_2_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/Design_Serializer/ip/Design_Serializer_mdm_1_2/sim/Design_Serializer_mdm_1_2.vhd" \
"c:/Users/mafassi/Downloads/serializer/Serializer/Serialiseur.srcs/sources_1/bd/Design_Serializer/ip/Design_Serializer_clk_wiz_1_2/Design_Serializer_clk_wiz_1_2_sim_netlist.vhdl" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../Serialiseur.srcs/sources_1/bd/Design_Serializer/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../Serialiseur.srcs/sources_1/bd/Design_Serializer/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/Design_Serializer/ip/Design_Serializer_rst_clk_wiz_1_100M_2/sim/Design_Serializer_rst_clk_wiz_1_100M_2.vhd" \

vcom -work interrupt_control_v3_1_4 -93 \
"../../../../Serialiseur.srcs/sources_1/bd/Design_Serializer/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_24 -93 \
"../../../../Serialiseur.srcs/sources_1/bd/Design_Serializer/ipshared/4318/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/Design_Serializer/ip/Design_Serializer_axi_gpio_0_1/sim/Design_Serializer_axi_gpio_0_1.vhd" \
"../../../bd/Design_Serializer/ip/Design_Serializer_axi_gpio_0_2/sim/Design_Serializer_axi_gpio_0_2.vhd" \
"../../../bd/Design_Serializer/ip/Design_Serializer_axi_gpio_0_3/sim/Design_Serializer_axi_gpio_0_3.vhd" \
"c:/Users/mafassi/Downloads/serializer/Serializer/Serialiseur.srcs/sources_1/bd/Design_Serializer/ip/Design_Serializer_xbar_1/Design_Serializer_xbar_1_sim_netlist.vhdl" \
"../../../bd/Design_Serializer/sim/Design_Serializer.vhd" \

