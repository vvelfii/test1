`include "defines.vh"
//regfile可以同时进行两个寄存器的读和1个寄存器的写
module regfile(
    input wire clk,

    input wire [4:0] raddr1,
    output wire [31:0] rdata1, //读第一个寄存器

    input wire [4:0] raddr2,
    output wire [31:0] rdata2,//读第二个寄存器
    
    input wire we,
    input wire [4:0] waddr,
    input wire [31:0] wdata   //写数据到寄存器中
);
    reg [31:0] reg_array [31:0];
    // write
    always @ (posedge clk) begin
        if (we && waddr!=5'b0) begin
            reg_array[waddr] <= wdata;
        end
    end

    // read out 1
    assign rdata1 = (raddr1 == 5'b0) ? 32'b0 : reg_array[raddr1];

    // read out2
    assign rdata2 = (raddr2 == 5'b0) ? 32'b0 : reg_array[raddr2];
endmodule