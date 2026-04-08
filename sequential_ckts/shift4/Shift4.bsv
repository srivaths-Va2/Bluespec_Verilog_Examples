/* 4 Bit shift register */

package Shift4;
	interface Shift4_Ifc;
		method Action update(Bit#(1) load, Bit#(1) ena, Bit#(4) data);
		method Bit#(4) q();
	endinterface
	
	module mkShift4(Shift4_Ifc);
		Reg#(Bit#(4)) shift_reg <- mkReg(0);
		
		method Action update(Bit#(1) load, Bit#(1) ena, Bit#(4) data);
			if(load == 1) begin
				shift_reg <= data;
			end	
			else if(ena == 1) begin
				shift_reg <= {1'b0, shift_reg[3 : 1]};
			end
		endmethod
		
		method Bit#(4) q();
			return shift_reg;
		endmethod
	endmodule
endpackage
