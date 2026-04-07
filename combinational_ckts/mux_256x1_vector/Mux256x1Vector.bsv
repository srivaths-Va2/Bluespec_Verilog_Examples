package Mux256x1Vector;
	import Vector::*;
	
	// Interface declaration
	interface Mux256x1Vector_Ifc;
		method Bit#(4) get_out(Vector#(256, Bit#(4)) inputs, Bit#(8) sel);
	endinterface
	
	module mkMux256x1Vector(Mux256x1Vector_Ifc);
		method Bit#(4) get_out(Vector#(256, Bit#(4)) inputs, Bit#(8) sel);
			return inputs[sel];
		endmethod
	endmodule
endpackage
