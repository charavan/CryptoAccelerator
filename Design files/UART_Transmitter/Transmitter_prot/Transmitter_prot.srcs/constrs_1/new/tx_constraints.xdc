##Clock Pin

set_property PACKAGE_PIN E3 [get_ports clock]
set_property IOSTANDARD LVCMOS33 [get_ports clock]

##Reset Pin

set_property PACKAGE_PIN U9 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]


##FPGA Receive_out

set_property PACKAGE_PIN D4 [get_ports Tx_out]
set_property IOSTANDARD LVCMOS33 [get_ports Tx_out]



##User_Input  Push Button

set_property PACKAGE_PIN V10 [get_ports Button]
set_property IOSTANDARD LVCMOS33 [get_ports Button]

##User_Input SW15

set_property PACKAGE_PIN P4 [get_ports {Message_in[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Message_in[7]}]

##User_Input SW14

set_property PACKAGE_PIN P3 [get_ports {Message_in[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Message_in[6]}]

##User_Input SW13

set_property PACKAGE_PIN R3 [get_ports {Message_in[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Message_in[5]}]

##User_Input SW12

set_property PACKAGE_PIN T1 [get_ports {Message_in[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Message_in[4]}]

##User_Input SW11

set_property PACKAGE_PIN T3 [get_ports {Message_in[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Message_in[3]}]

##User_Input SW10

set_property PACKAGE_PIN U2 [get_ports {Message_in[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Message_in[2]}]

##User_Input SW9

set_property PACKAGE_PIN V2 [get_ports {Message_in[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Message_in[1]}]

##User_Input SW8

set_property PACKAGE_PIN U4 [get_ports {Message_in[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Message_in[0]}]

create_clock -period 10.000 -name clock -waveform {0.000 5.000} -add
