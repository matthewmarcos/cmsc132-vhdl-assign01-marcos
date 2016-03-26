ghdl -a myAlarm.vhdl && ghdl -e myAlarm && ghdl -a tb_myAlarm.vhdl && ghdl -e tb_myAlarm && ghdl -r tb_myAlarm --vcd=myAlarm.vcd && gtkwave myAlarm.vcd
