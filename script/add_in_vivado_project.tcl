# get current file directory
set current_file_dir [ file dirname [ file normalize [ info script ] ] ]

# add source and lib of UVVM into project
set obj [get_filesets sim_1]
set files [list \
    [file normalize "${current_file_dir}/../src_util/adaptations_pkg.vhd"] \
    [file normalize "${current_file_dir}/../src_util/alert_hierarchy_pkg.vhd"] \
    [file normalize "${current_file_dir}/../src_util/bfm_common_pkg.vhd"] \
    [file normalize "${current_file_dir}/../src_util/data_fifo_pkg.vhd"] \
    [file normalize "${current_file_dir}/../src_util/data_queue_pkg.vhd"] \
    [file normalize "${current_file_dir}/../src_util/data_stack_pkg.vhd"] \
    [file normalize "${current_file_dir}/../src_util/func_cov_pkg.vhd"] \
    [file normalize "${current_file_dir}/../src_util/generic_queue_pkg.vhd"] \
    [file normalize "${current_file_dir}/../src_util/global_signals_and_shared_variables_pkg.vhd"] \
    [file normalize "${current_file_dir}/../src_util/hierarchy_linked_list_pkg.vhd"] \
    [file normalize "${current_file_dir}/../src_util/license_pkg.vhd"] \
    [file normalize "${current_file_dir}/../src_util/methods_pkg.vhd"] \
    [file normalize "${current_file_dir}/../src_util/protected_types_pkg.vhd"] \
    [file normalize "${current_file_dir}/../src_util/rand_pkg.vhd"] \
    [file normalize "${current_file_dir}/../src_util/string_methods_pkg.vhd"] \
    [file normalize "${current_file_dir}/../src_util/types_pkg.vhd"] \
    [file normalize "${current_file_dir}/../src_util/uvvm_util_context.vhd"] \
    [file normalize "${current_file_dir}/../src_bfm/avalon_mm_bfm_pkg.vhd"] \
    [file normalize "${current_file_dir}/../src_bfm/avalon_st_bfm_pkg.vhd"] \
    [file normalize "${current_file_dir}/../src_bfm/axi_bfm_pkg.vhd"] \
    [file normalize "${current_file_dir}/../src_bfm/axilite_bfm_pkg.vhd"] \
    [file normalize "${current_file_dir}/../src_bfm/axistream_bfm_pkg.vhd"] \
    [file normalize "${current_file_dir}/../src_bfm/gmii_bfm_pkg.vhd"] \
    [file normalize "${current_file_dir}/../src_bfm/gpio_bfm_pkg.vhd"] \
    [file normalize "${current_file_dir}/../src_bfm/i2c_bfm_pkg.vhd"] \
    [file normalize "${current_file_dir}/../src_bfm/rgmii_bfm_pkg.vhd"] \
    [file normalize "${current_file_dir}/../src_bfm/sbi_bfm_pkg.vhd"] \
    [file normalize "${current_file_dir}/../src_bfm/spi_bfm_pkg.vhd"] \
    [file normalize "${current_file_dir}/../src_bfm/uart_bfm_pkg.vhd"] \
    [file normalize "${current_file_dir}/../src_bfm/wishbone_bfm_pkg.vhd"] \
]
add_files -norecurse -fileset $obj $files
foreach file [split $files " "] {
    # Set 'sim_1' fileset file properties for remote files
    set file_obj [get_files -of_objects [get_filesets sim_1] [list "*$file"]]
    set_property -name "file_type" -value "VHDL 2008" -objects $file_obj
    set_property -name "is_enabled" -value "1" -objects $file_obj
    set_property -name "is_global_include" -value "0" -objects $file_obj
    set_property -name "library" -value "uvvm_util" -objects $file_obj
    set_property -name "path_mode" -value "RelativeFirst" -objects $file_obj
    set_property -name "used_in" -value "synthesis simulation" -objects $file_obj
    set_property -name "used_in_simulation" -value "1" -objects $file_obj
    set_property -name "used_in_synthesis" -value "1" -objects $file_obj
}

