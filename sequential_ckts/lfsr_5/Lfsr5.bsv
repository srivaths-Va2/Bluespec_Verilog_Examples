/* Code can be found on https://hdlbits.01xz.net/wiki/Lfsr5 */

package Lfsr5;
	/*----------- DFF -----------*/
	// Define the interface
	interface DFF_Ifc;
		method Action update(Bit#(1) d, Bit#(1) rst, Bit#(1) rst_val);
		method Bit#(1) q();
	endinterface
	
	// Define the module
	module mkDFF(DFF_Ifc);	
		Reg#(Bit#(1)) out <- mkReg(0);
		method Action update(Bit#(1) d, Bit#(1) rst, Bit#(1) rst_val);
			if(rst == 1) begin
				out <= rst_val;
			end
			else if(rst == 0) begin
				out <= d;
			end
		endmethod
		
		method Bit#(1) q();
			return out;
		endmethod
	endmodule
	
	/*----------- LFSR-5 -----------*/
	// Defime the interface
	interface Lfsr_Ifc;
		method Action step(Bit#(1) reset_signal);
		method Bit#(5) lfsr_out();
	endinterface
	
	// Define the module
	module mkLfsr5(Lfsr_Ifc);
		DFF_Ifc dff0 <- mkDFF;
		DFF_Ifc dff1 <- mkDFF;
		DFF_Ifc dff2 <- mkDFF;
		DFF_Ifc dff3 <- mkDFF;
		DFF_Ifc dff4 <- mkDFF;
		
		method Action step(Bit#(1) reset_signal);
			Bit#(1) fb = dff0.q();
			
			dff4.update(0 ^ fb, reset_signal, 0);
			dff3.update(dff4.q(), reset_signal, 0);
			dff2.update(dff3.q() ^ fb, reset_signal, 0);
			dff1.update(dff2.q(), reset_signal, 0);
			dff0.update(dff1.q(), reset_signal, 1);
		endmethod
		
		method Bit#(5) lfsr_out();
			return {dff4.q(), dff3.q(), dff2.q(), dff1.q(), dff0.q()};
		endmethod
	endmodule
	
endpackage
