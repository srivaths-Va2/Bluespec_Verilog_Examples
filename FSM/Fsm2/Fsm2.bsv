package Fsm2;
	// Define the states
	typedef enum {OFF, ON} State deriving(Bits, Eq);
	
	// interfaces
	interface Fsm2_Ifc;
		method Action step(Bit#(1) areset, Bit#(1) j, Bit#(1) k);
		method Bit#(1) out();
	endinterface
	
	// Module
	module mkFsm2(Fsm2_Ifc);
		Reg#(State) state <- mkReg(OFF);
		
		method Action step(Bit#(1) areset, Bit#(1) j, Bit#(1) k);
			if(areset == 1) begin
				state <= OFF;
			end
			else begin
				case(state)
					OFF: begin
						if(j == 1) state <= ON;
					end
					
					ON: begin
						if(k == 1) state <= OFF;
					end
				endcase
			end
		endmethod
		
		method Bit#(1) out();
			return (state == OFF) ? 0 : 1;
		endmethod	
	endmodule
endpackage
