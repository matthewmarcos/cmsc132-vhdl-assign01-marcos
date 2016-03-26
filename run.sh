ghdl -a t_5l_marcos.vhdl && ghdl -e t_5l_marcos && ghdl -a t_5l_marcos_tb.vhdl && ghdl -e t_5l_marcos_tb && ghdl -r t_5l_marcos_tb --vcd=t_5l_marcos.vcd && gtkwave t_5l_marcos.vcd
