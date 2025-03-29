# Makefile for mac_test simulation with cocotb
# See https://docs.cocotb.org/en/stable/quickstart.html for more info

# defaults
SIM ?= icarus                # Specify the simulator you want to use (icarus, modelsim, etc.)
TOPLEVEL_LANG ?= verilog     # Language for your top-level module
SRC_DIR = $(PWD)/../src       # Directory where your RTL files are located

# Name of the top-level Verilog source file for your design
PROJECT_SOURCES = tt_um_mac_test.v   # Change this to your actual top-level Verilog module

# Check if GATE simulation is enabled (for gate-level simulations)
ifneq ($(GATES),yes)

# RTL simulation settings:
SIM_BUILD = sim_build/rtl
VERILOG_SOURCES += $(addprefix $(SRC_DIR)/,$(PROJECT_SOURCES))
COMPILE_ARGS += -I$(SRC_DIR)

else

# Gate-level simulation settings:
SIM_BUILD = sim_build/gl
COMPILE_ARGS += -DGL_TEST
COMPILE_ARGS += -DFUNCTIONAL
COMPILE_ARGS += -DUSE_POWER_PINS
COMPILE_ARGS += -DSIM
COMPILE_ARGS += -DUNIT_DELAY=\#1

# Gate-level simulation library files (only needed if you are simulating the gate-level netlist)
VERILOG_SOURCES += $(PDK_ROOT)/sky130A/libs.ref/sky130_fd_sc_hd/verilog/primitives.v
VERILOG_SOURCES += $(PDK_ROOT)/sky130A/libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v

# Gate-level netlist file (this is generated in the GDS action workflow)
VERILOG_SOURCES += $(PWD)/gate_level_netlist.v

endif

# Include the testbench sources (your Verilog testbench file)
VERILOG_SOURCES += $(PWD)/tb.v   # Make sure tb.v is your testbench file, modify if necessary
TOPLEVEL = tb  # Top-level module for simulation (your testbench)

# MODULE is the basename of the Python test file (without the .py extension)
MODULE = test # Your Python test file should be named test_mac_test.py

# Include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim
