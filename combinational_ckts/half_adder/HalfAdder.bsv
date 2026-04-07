package HalfAdder;
	// Define a structure to hold the outputs
	typedef struct{
		Bit#(1) sum;
		Bit#(1) cout;
	}AdderResult deriving(Bits);
	
	// Define the interface
	interface HalfAdder_Ifc;
		method AdderResult get_output(Bit#(1) a, Bit#(1) b);
	endinterface
	
	// Define the module
	module mkHalfAdder(HalfAdder_Ifc);
		method AdderResult get_output(Bit#(1) a, Bit#(1) b);
			Bit#(1) s = a | b;
			Bit#(1) c = a & b;
			
			return AdderResult {sum: s, cout: c};
		endmethod
	endmodule
endpackage
