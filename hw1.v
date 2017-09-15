module demorgan
(
	input A, 	// Single bit inputs
	input B,
	output nA,	// output intermediate complemented inputs
	output nB,
	output nAandnB	// Single bit output, (-A)*(~B)
);

wire nA;
wire nB;
not Ainv(nA, A);	// Top inverter is named Ainv, takes signal A as input and produces signal nA
not Binv(nB, B);	// Top inverter is named Binv, takes signal B as input and produces signal nB
and andgate(nAandnB, nA, nB);	// AND gate produces nAandnB from nA and nB

endmodule

module negateaandb 
(
	input A,
	input B,
	output AandB,
	output nAandB
);

wire AandB;
and andgate(AandB, A, B);	// AND gate produces AandBfrom A and B
not AandBinv(nAandB, AandB);	//inverter is named AandBinv, takes signal AandB as input and produces signal
endmodule


module notaornotb
(
	input A,
	input B,
	output nA,
	output nB,
	output nAornB
);
or orgate(nAornB, nA, nB);
endmodule

module negateaorb
(
        input A,
        input B,
        output AorB,
        output nAorB
);

wire AorB;
or orgate(AorB, A, B);       // OR gate produces AorB from A or B
not AorBinv(nAorB, AorB);    //inverter is named AorBinv, takes signal AorB as input and produces signal
endmodule

