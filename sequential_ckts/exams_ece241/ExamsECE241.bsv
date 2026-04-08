/* Question can be found on https://hdlbits.01xz.net/wiki/Exams/ece241_2014_q4 */

package ExamsECE241;
	/*----------------------- D FLIPFLOPS -----------------------*/
	interface DFF_Ifc;
		method Action step(Bit#(1) d);
		method Bit#(1) q_out();
	endinterface
	
	module mkDFF(DFF_Ifc);
		Reg#(Bit#(1)) q <- mkReg(0);
		method Action step(Bit#(1) d);
			q <= d;
			//return q;
		endmethod
		
		method Bit#(1) q_out();
			return q;
		endmethod
	endmodule
	
	/*----------------------- ExamsECE241 CIRCUIT -----------------------*/
	interface ExamsECE241_Ifc;
		method Action update(Bit#(1) x);
		method Bit#(1) z();
	endinterface
	
	module mkExamsECE241(ExamsECE241_Ifc);
		DFF_Ifc dff0 <- mkDFF;
		DFF_Ifc dff1 <- mkDFF;
		DFF_Ifc dff2 <- mkDFF;
		
		method Action update(Bit#(1) x);
			let xor_val = x ^ dff0.q_out;
			let and_val = x & ~(dff1.q_out);
			let or_val = x | ~ (dff2.q_out);
			
			dff0.step(xor_val);
			dff1.step(and_val);
			dff2.step(or_val);
		endmethod
	
		method Bit#(1) z();
			return ~(dff0.q_out | dff1.q_out | dff2.q_out);
		endmethod
	endmodule

endpackage
