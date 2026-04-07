package FullAdder;
	// Define the structure
	typedef struct {
		Bit#(1) sum;
		Bit#(1) cout;
	}AdderResult deriving(Bits);
	
	// Interface declaration
	interface FullAdder_Ifc;
		method AdderResult get_output(Bit#(1) a, Bit#(1) b, Bit#(1) cin);
	endinterface
	
	// Module declaration
	module mkFullAdder(FullAdder_Ifc);
		method AdderResult get_output(Bit#(1) a, Bit#(1) b, Bit#(1) cin);
			Bit#(1) s = a ^ b ^ cin;
			Bit#(1) c = (a & b) | (b & cin) | (a & cin);
			
			return AdderResult {sum: s, cout: c};	
		endmethod
	endmodule
endpackage
