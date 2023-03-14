
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name practica3 -dir "/home/student/Desktop/UPC_ISE_Q3_P3-main/practica3/planAhead_run_1" -part xc3s200ft256-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property top P3_codec $srcset
set_param project.paUcfFile  "P3_codec.ucf"
set hdlfile [add_files [list {../D_basc_VHDL.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../Rising_edge_VHDL.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../P3_S2P_Buffer.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../P3_S2P.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../Falling_edge_VHDL.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../P3_uc.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../P3_S2P_all.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../P3_p2s_core.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../P3_codec.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
add_files "P3_codec.ucf" -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s200ft256-4
