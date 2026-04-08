/* Decade Counter */

package DecadeCounter;
	interface DecadeCounter_Ifc;
		method Bit#(4) q();
	endinterface
	
	module mkDecadeCounter(DecadeCounter_Ifc);
		Reg#(Bit#(4)) count_reg <- mkReg(0);
		
		rule increment;
			Bit#(4) next_val = (count_reg == 9) ? 0 : count_reg + 1;
			count_reg <= next_val;
		endrule
		
		method Bit#(4) q();
			return count_reg;
		endmethod
	endmodule
endpackage
