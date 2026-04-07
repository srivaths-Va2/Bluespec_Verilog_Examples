package Mux2x1;
	// Interface declaration
	interface Mux2x1Ifc;
		method Bit#(1) get_mux21_output(Bit#(1) x, Bit#(1) y, Bit#(1) sel);
	endinterface
	
	// Module declaration
	module mkMux2x1(Mux2x1Ifc);
		method Bit#(1) get_mux21_output(Bit#(1) x, Bit#(1) y, Bit#(1) sel);
			Bit#(1) out = (sel == 1) ? y : x;
			return out;
		endmethod
	endmodule
endpackage
