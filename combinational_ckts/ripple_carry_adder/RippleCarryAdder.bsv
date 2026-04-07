// Code for the 4-bit Ripple Carry Adder (RCA)

package RippleCarryAdder;
	import Vector::*;
	
	/* --------------- FULL ADDER CODE --------------- */
	// Define the structure
	typedef struct {
		Bit#(1) sum;
		Bit#(1) cout;
	} FA_result deriving(Bits);
	
	// Interface
	interface FA_Ifc;
		method FA_result compute(Bit#(1) a, Bit#(1) b, Bit#(1) cin);
	endinterface
	
	// Module
	module mkFA(FA_Ifc);
		method FA_result compute(Bit#(1) a, Bit#(1) b, Bit#(1) cin);
			Bit#(1) s = a ^ b ^ cin;
			Bit#(1) c = (a & b) | (b & cin) | (a & cin);
			return FA_result {sum: s, cout: c};
		endmethod
	endmodule
	
	/* --------------- RIPPLE CARRY ADDER CODE --------------- */
	// Interface
	interface RCA_Ifc;
		method Bit#(4) get_sum(Bit#(4) a, Bit#(4) b, Bit#(4) cin);
		method Bit#(4) get_cout(Bit#(4) a, Bit#(4) b, Bit#(4) cin);
	endinterface
	
	// Module
	module mkRCA(RCA_Ifc);
		Vector#(4, FA_Ifc) fas <- replicateM(mkFA);
	
		method Bit#(4) get_sum(Bit#(4) a, Bit#(4) b, Bit#(4) cin);
			let res0 = fas[0].compute(a[0], b[0], cin[0]);
        		let res1 = fas[1].compute(a[1], b[1], res0.cout);
        		let res2 = fas[2].compute(a[2], b[2], res1.cout);
        		let res3 = fas[3].compute(a[3], b[3], res2.cout);

        		// Pack the individual sum wires into a 4-bit bus
        		return {res3.sum, res2.sum, res1.sum, res0.sum};
		endmethod
		
		method Bit#(4) get_cout(Bit#(4) a, Bit#(4) b, Bit#(4) cin);
			let res0 = fas[0].compute(a[0], b[0], cin[0]);
        		let res1 = fas[1].compute(a[1], b[1], res0.cout);
        		let res2 = fas[2].compute(a[2], b[2], res1.cout);
        		let res3 = fas[3].compute(a[3], b[3], res2.cout);

        		return {res3.cout, res2.cout, res1.cout, res0.cout};
		endmethod
	endmodule
endpackage
