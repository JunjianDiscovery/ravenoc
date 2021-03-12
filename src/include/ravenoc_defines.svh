`ifndef _ravenoc_defines_
  `define _ravenoc_defines_

  `ifndef FLIT_DATA
    `define  FLIT_DATA            32        // Flit width data in bits
  `endif

  `ifndef FLIT_TP_WIDTH
    `define FLIT_TP_WIDTH         2         // Flit Width type
  `endif

  `ifndef FLIT_BUFF
    `define  FLIT_BUFF            4         // Number of flits buffered in the virtual channel fifo, MUST BE POWER OF 2 0..2..4..8
  `endif

  `ifndef N_VIRT_CHN
    `define N_VIRT_CHN            3         // Number of virtual channels
  `endif

  `ifndef H_PRIORITY
    `define H_PRIORITY            1         // Priority descending on Virtual channel - low priority VC_ID (0)
  `endif

  `ifndef NOC_CFG_SZ_X
    `define NOC_CFG_SZ_X          2         // NoC size X
  `endif

  `ifndef NOC_CFG_SZ_Y
    `define NOC_CFG_SZ_Y          2         // NoC size Y
  `endif

  `ifndef ROUTING_ALG
    `define ROUTING_ALG           X_Y_ALG   // Routing algorithm
  `endif

  `ifndef MAX_SZ_PKT
    `define MAX_SZ_PKT            256       // Max number of flits per packet
  `endif

  `ifndef MIN_SIZE_FLIT
    `define MIN_SIZE_FLIT         1         // The smallest flit size
  `endif

  `ifndef N_CSR_REGS
    `define N_CSR_REGS            5         // Total number of CSR regs
  `endif

  `define MIN_CLOG(X)             $clog2(X>1?X:2)

  //*********************
  //
  // AXI Definitions
  //
  // ********************
  `ifndef AXI_ADDR_WIDTH
    `define AXI_ADDR_WIDTH        32
  `endif

  `ifndef AXI_DATA_WIDTH
    `define AXI_DATA_WIDTH        `FLIT_DATA
  `endif

  `ifndef AXI_ALEN_WIDTH
    `define AXI_ALEN_WIDTH        8
  `endif

  `ifndef AXI_ASIZE_WIDTH
    `define AXI_ASIZE_WIDTH       3
  `endif

  `ifndef AXI_MAX_OUTSTD_RD
    `define AXI_MAX_OUTSTD_RD     4
  `endif

  `ifndef AXI_MAX_OUTSTD_WR
    `define AXI_MAX_OUTSTD_WR     4
  `endif

  // Not used these signals in the logic for now
  `ifndef AXI_USER_REQ_WIDTH
      `define AXI_USER_REQ_WIDTH  2
  `endif

  `ifndef AXI_USER_DATA_WIDTH
      `define AXI_USER_DATA_WIDTH 2
  `endif

  `ifndef AXI_USER_RESP_WIDTH
      `define AXI_USER_RESP_WIDTH 2
  `endif

  // Number of flits that each read buffer
  // in the AXI slave can hold it (per VC)
  `ifndef AXI_RD_BUFF_SZ
      `define AXI_RD_BUFF_SZ      1
      localparam int AXI_RD_SZ_ARR [`N_VIRT_CHN-1:0] = '{
        'd2, 'd4, 'd16
      };
  `endif

  // MM regions
  // Region 0 - Send flit buffers
  // Region 1 - Receive flit buffer
  // Region 3 - NoC CSR
  `ifndef AXI_MM_REG
    `define AXI_MM_REG    1
  `endif

  `ifndef AXI_WR_BFF_FLIT_REG
    `define AXI_WR_BFF_FLIT_REG 1
    localparam int AXI_WR_BFF_FLIT [`N_VIRT_CHN-1:0] = '{
      'h100c, // Virtual Channel 2
      'h1008, // Virtual Channel 1
      'h1000  // Virtual Channel 0
    };
  `endif

  `ifndef AXI_RD_BFF_FLIT_REG
    `define AXI_RD_BFF_FLIT_REG 1
    localparam int AXI_RD_BFF_FLIT [`N_VIRT_CHN-1:0] = '{
      'h200c, // Virtual Channel 2
      'h2008, // Virtual Channel 1
      'h2000  // Virtual Channel 0
    };
  `endif

  `ifndef AXI_CSR_REG
    `define AXI_CSR_REG 1
    localparam int AXI_CSR [`N_CSR_REGS-1:0] = '{
      'h3000, // IRQ_ID, IRQ_ACTIVE, IRQ_STATUS
      'h3008, // IRQ_CFG
      'h300C, // NOC_VERSION
      'h3010, // SPARE_1
      'h3018  // SPARE_2
    };
  `endif
`endif
