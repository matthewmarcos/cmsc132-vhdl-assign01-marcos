ghdl -a alarm.vhdl && ghdl -e alarm && ghdl -a tb_alarm.vhdl && ghdl -e tb_alarm && ghdl -r tb_alarm --vcd=alarm.vcd && gtkwave alarm.vcd
