package Mux2x1Vector;
	// Interface declaration
	interface Mux2x1Vector_Ifc;
		method Bit#(100) get_mux2x1_output(Bit#(100) x, Bit#(100) y, Bit#(1) sel);
	endinterface
	
	// Module
	module mkMux2x1Vector(Mux2x1Vector_Ifc);
		method Bit#(100) get_mux2x1_output(Bit#(100) x, Bit#(100) y, Bit#(1) sel);
			Bit#(100) out = (sel == 1) ? y : x;
			return out;
		endmethod
	endmodule
endpackage
