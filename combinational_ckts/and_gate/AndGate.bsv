package AndGate;
    // Define the interface
    interface AndIfc;
        method Bit#(1) get_and(Bit#(1) x, Bit#(1) y);
    endinterface
    
    // Module implementation
    module mkAnd(AndIfc);
        method Bit#(1) get_and(Bit#(1) x, Bit#(1) y);
            return x & y;
        endmethod
    endmodule

endpackage
