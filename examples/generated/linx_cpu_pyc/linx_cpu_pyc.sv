`include "pyc_add.sv"
`include "pyc_mux.sv"
`include "pyc_and.sv"
`include "pyc_or.sv"
`include "pyc_xor.sv"
`include "pyc_not.sv"
`include "pyc_reg.sv"
`include "pyc_fifo.sv"

`include "pyc_byte_mem.sv"

module linx_cpu_pyc (
  input logic clk,
  input logic rst,
  input logic [63:0] boot_pc,
  input logic [63:0] boot_sp,
  output logic halted,
  output logic [63:0] pc,
  output logic [2:0] stage,
  output logic [63:0] cycles,
  output logic [63:0] a0,
  output logic [63:0] a1,
  output logic [63:0] ra,
  output logic [63:0] sp,
  output logic [1:0] br_kind,
  output logic [63:0] if_window,
  output logic [5:0] wb_op,
  output logic [5:0] wb_regdst,
  output logic [63:0] wb_value,
  output logic commit_cond,
  output logic [63:0] commit_tgt
);

logic [2:0] v1;
logic [1:0] v2;
logic [1:0] v3;
logic [1:0] v4;
logic [63:0] v5;
logic [5:0] v6;
logic [5:0] v7;
logic [5:0] v8;
logic [5:0] v9;
logic [5:0] v10;
logic [5:0] v11;
logic [2:0] v12;
logic [47:0] v13;
logic [47:0] v14;
logic [5:0] v15;
logic [31:0] v16;
logic [31:0] v17;
logic [5:0] v18;
logic [31:0] v19;
logic [31:0] v20;
logic [31:0] v21;
logic [31:0] v22;
logic [5:0] v23;
logic [31:0] v24;
logic [31:0] v25;
logic [5:0] v26;
logic [31:0] v27;
logic [5:0] v28;
logic [31:0] v29;
logic [5:0] v30;
logic [31:0] v31;
logic [5:0] v32;
logic [31:0] v33;
logic [5:0] v34;
logic [31:0] v35;
logic [31:0] v36;
logic [5:0] v37;
logic [31:0] v38;
logic [5:0] v39;
logic [31:0] v40;
logic [5:0] v41;
logic [31:0] v42;
logic [5:0] v43;
logic [31:0] v44;
logic [5:0] v45;
logic [31:0] v46;
logic [31:0] v47;
logic [5:0] v48;
logic [15:0] v49;
logic [5:0] v50;
logic [15:0] v51;
logic [15:0] v52;
logic [5:0] v53;
logic [15:0] v54;
logic [15:0] v55;
logic [15:0] v56;
logic [5:0] v57;
logic [15:0] v58;
logic [5:0] v59;
logic [15:0] v60;
logic [5:0] v61;
logic [15:0] v62;
logic [5:0] v63;
logic [5:0] v64;
logic [15:0] v65;
logic [5:0] v66;
logic [5:0] v67;
logic [15:0] v68;
logic [15:0] v69;
logic [5:0] v70;
logic [15:0] v71;
logic [15:0] v72;
logic [3:0] v73;
logic [7:0] v74;
logic [7:0] v75;
logic [5:0] v76;
logic [2:0] v77;
logic [2:0] v78;
logic [2:0] v79;
logic [2:0] v80;
logic [5:0] v81;
logic [1:0] v82;
logic [63:0] v83;
logic [63:0] v84;
logic [7:0] v85;
logic [5:0] v86;
logic [2:0] v87;
logic v88;
logic v89;
logic [2:0] v90;
logic [1:0] v91;
logic [1:0] v92;
logic [1:0] v93;
logic [63:0] v94;
logic [5:0] v95;
logic [5:0] v96;
logic [5:0] v97;
logic [5:0] v98;
logic [5:0] v99;
logic [5:0] v100;
logic [2:0] v101;
logic [47:0] v102;
logic [47:0] v103;
logic [5:0] v104;
logic [31:0] v105;
logic [31:0] v106;
logic [5:0] v107;
logic [31:0] v108;
logic [31:0] v109;
logic [31:0] v110;
logic [31:0] v111;
logic [5:0] v112;
logic [31:0] v113;
logic [31:0] v114;
logic [5:0] v115;
logic [31:0] v116;
logic [5:0] v117;
logic [31:0] v118;
logic [5:0] v119;
logic [31:0] v120;
logic [5:0] v121;
logic [31:0] v122;
logic [5:0] v123;
logic [31:0] v124;
logic [31:0] v125;
logic [5:0] v126;
logic [31:0] v127;
logic [5:0] v128;
logic [31:0] v129;
logic [5:0] v130;
logic [31:0] v131;
logic [5:0] v132;
logic [31:0] v133;
logic [5:0] v134;
logic [31:0] v135;
logic [31:0] v136;
logic [5:0] v137;
logic [15:0] v138;
logic [5:0] v139;
logic [15:0] v140;
logic [15:0] v141;
logic [5:0] v142;
logic [15:0] v143;
logic [15:0] v144;
logic [15:0] v145;
logic [5:0] v146;
logic [15:0] v147;
logic [5:0] v148;
logic [15:0] v149;
logic [5:0] v150;
logic [15:0] v151;
logic [5:0] v152;
logic [5:0] v153;
logic [15:0] v154;
logic [5:0] v155;
logic [5:0] v156;
logic [15:0] v157;
logic [15:0] v158;
logic [5:0] v159;
logic [15:0] v160;
logic [15:0] v161;
logic [3:0] v162;
logic [7:0] v163;
logic [7:0] v164;
logic [5:0] v165;
logic [2:0] v166;
logic [2:0] v167;
logic [2:0] v168;
logic [2:0] v169;
logic [5:0] v170;
logic [1:0] v171;
logic [63:0] v172;
logic [63:0] v173;
logic [7:0] v174;
logic [5:0] v175;
logic [2:0] v176;
logic v177;
logic v178;
logic [63:0] boot_pc__linx_cpu_pyc__L25;
logic [63:0] boot_sp__linx_cpu_pyc__L26;
logic [2:0] state__stage__next;
logic [2:0] v179;
logic [2:0] state__stage;
logic [63:0] state__pc__next;
logic [63:0] v180;
logic [63:0] state__pc;
logic [1:0] state__br_kind__next;
logic [1:0] v181;
logic [1:0] state__br_kind;
logic [63:0] state__br_base_pc__next;
logic [63:0] v182;
logic [63:0] state__br_base_pc;
logic [63:0] state__br_off__next;
logic [63:0] v183;
logic [63:0] state__br_off;
logic state__commit_cond__next;
logic v184;
logic state__commit_cond;
logic [63:0] state__commit_tgt__next;
logic [63:0] v185;
logic [63:0] state__commit_tgt;
logic [63:0] state__cycles__next;
logic [63:0] v186;
logic [63:0] state__cycles;
logic state__halted__next;
logic v187;
logic state__halted;
logic [63:0] ifid__window__next;
logic [63:0] v188;
logic [63:0] ifid__window;
logic [5:0] idex__op__next;
logic [5:0] v189;
logic [5:0] idex__op;
logic [2:0] idex__len_bytes__next;
logic [2:0] v190;
logic [2:0] idex__len_bytes;
logic [5:0] idex__regdst__next;
logic [5:0] v191;
logic [5:0] idex__regdst;
logic [5:0] idex__srcl__next;
logic [5:0] v192;
logic [5:0] idex__srcl;
logic [5:0] idex__srcr__next;
logic [5:0] v193;
logic [5:0] idex__srcr;
logic [5:0] idex__srcp__next;
logic [5:0] v194;
logic [5:0] idex__srcp;
logic [63:0] idex__imm__next;
logic [63:0] v195;
logic [63:0] idex__imm;
logic [63:0] idex__srcl_val__next;
logic [63:0] v196;
logic [63:0] idex__srcl_val;
logic [63:0] idex__srcr_val__next;
logic [63:0] v197;
logic [63:0] idex__srcr_val;
logic [63:0] idex__srcp_val__next;
logic [63:0] v198;
logic [63:0] idex__srcp_val;
logic [5:0] exmem__op__next;
logic [5:0] v199;
logic [5:0] exmem__op;
logic [2:0] exmem__len_bytes__next;
logic [2:0] v200;
logic [2:0] exmem__len_bytes;
logic [5:0] exmem__regdst__next;
logic [5:0] v201;
logic [5:0] exmem__regdst;
logic [63:0] exmem__alu__next;
logic [63:0] v202;
logic [63:0] exmem__alu;
logic exmem__is_load__next;
logic v203;
logic exmem__is_load;
logic exmem__is_store__next;
logic v204;
logic exmem__is_store;
logic [2:0] exmem__size__next;
logic [2:0] v205;
logic [2:0] exmem__size;
logic [63:0] exmem__addr__next;
logic [63:0] v206;
logic [63:0] exmem__addr;
logic [63:0] exmem__wdata__next;
logic [63:0] v207;
logic [63:0] exmem__wdata;
logic [5:0] memwb__op__next;
logic [5:0] v208;
logic [5:0] memwb__op;
logic [2:0] memwb__len_bytes__next;
logic [2:0] v209;
logic [2:0] memwb__len_bytes;
logic [5:0] memwb__regdst__next;
logic [5:0] v210;
logic [5:0] memwb__regdst;
logic [63:0] memwb__value__next;
logic [63:0] v211;
logic [63:0] memwb__value;
logic [63:0] gpr__r0__next;
logic [63:0] v212;
logic [63:0] gpr__r1__next;
logic [63:0] v213;
logic [63:0] gpr__r1;
logic [63:0] gpr__r2__next;
logic [63:0] v214;
logic [63:0] gpr__r2;
logic [63:0] gpr__r3__next;
logic [63:0] v215;
logic [63:0] gpr__r3;
logic [63:0] gpr__r4__next;
logic [63:0] v216;
logic [63:0] gpr__r4;
logic [63:0] gpr__r5__next;
logic [63:0] v217;
logic [63:0] gpr__r5;
logic [63:0] gpr__r6__next;
logic [63:0] v218;
logic [63:0] gpr__r6;
logic [63:0] gpr__r7__next;
logic [63:0] v219;
logic [63:0] gpr__r7;
logic [63:0] gpr__r8__next;
logic [63:0] v220;
logic [63:0] gpr__r8;
logic [63:0] gpr__r9__next;
logic [63:0] v221;
logic [63:0] gpr__r9;
logic [63:0] gpr__r10__next;
logic [63:0] v222;
logic [63:0] gpr__r10;
logic [63:0] gpr__r11__next;
logic [63:0] v223;
logic [63:0] gpr__r11;
logic [63:0] gpr__r12__next;
logic [63:0] v224;
logic [63:0] gpr__r12;
logic [63:0] gpr__r13__next;
logic [63:0] v225;
logic [63:0] gpr__r13;
logic [63:0] gpr__r14__next;
logic [63:0] v226;
logic [63:0] gpr__r14;
logic [63:0] gpr__r15__next;
logic [63:0] v227;
logic [63:0] gpr__r15;
logic [63:0] gpr__r16__next;
logic [63:0] v228;
logic [63:0] gpr__r16;
logic [63:0] gpr__r17__next;
logic [63:0] v229;
logic [63:0] gpr__r17;
logic [63:0] gpr__r18__next;
logic [63:0] v230;
logic [63:0] gpr__r18;
logic [63:0] gpr__r19__next;
logic [63:0] v231;
logic [63:0] gpr__r19;
logic [63:0] gpr__r20__next;
logic [63:0] v232;
logic [63:0] gpr__r20;
logic [63:0] gpr__r21__next;
logic [63:0] v233;
logic [63:0] gpr__r21;
logic [63:0] gpr__r22__next;
logic [63:0] v234;
logic [63:0] gpr__r22;
logic [63:0] gpr__r23__next;
logic [63:0] v235;
logic [63:0] gpr__r23;
logic [63:0] t__r0__next;
logic [63:0] v236;
logic [63:0] t__r0;
logic [63:0] t__r1__next;
logic [63:0] v237;
logic [63:0] t__r1;
logic [63:0] t__r2__next;
logic [63:0] v238;
logic [63:0] t__r2;
logic [63:0] t__r3__next;
logic [63:0] v239;
logic [63:0] t__r3;
logic [63:0] u__r0__next;
logic [63:0] v240;
logic [63:0] u__r0;
logic [63:0] u__r1__next;
logic [63:0] v241;
logic [63:0] u__r1;
logic [63:0] u__r2__next;
logic [63:0] v242;
logic [63:0] u__r2;
logic [63:0] u__r3__next;
logic [63:0] v243;
logic [63:0] u__r3;
logic v244;
logic stage_is_if__linx_cpu_pyc__L93;
logic v245;
logic stage_is_id__linx_cpu_pyc__L94;
logic v246;
logic stage_is_ex__linx_cpu_pyc__L95;
logic v247;
logic stage_is_mem__linx_cpu_pyc__L96;
logic v248;
logic stage_is_wb__linx_cpu_pyc__L97;
logic v249;
logic v250;
logic v251;
logic v252;
logic v253;
logic v254;
logic v255;
logic halt_set__linx_cpu_pyc__L99;
logic v256;
logic stop__linx_cpu_pyc__L100;
logic v257;
logic active__linx_cpu_pyc__L101;
logic v258;
logic do_if__linx_cpu_pyc__L103;
logic v259;
logic do_id__linx_cpu_pyc__L104;
logic v260;
logic do_ex__linx_cpu_pyc__L105;
logic v261;
logic do_mem__linx_cpu_pyc__L106;
logic v262;
logic do_wb__linx_cpu_pyc__L107;
logic v263;
logic [63:0] mem_raddr__linx_cpu_pyc__L112;
logic [63:0] v264;
logic [63:0] mem_raddr__linx_cpu_pyc__L111;
logic [63:0] mem_raddr__linx_cpu_pyc__L114;
logic [63:0] v265;
logic [63:0] mem_raddr__linx_cpu_pyc__L113;
logic v266;
logic mem_wvalid__linx_cpu_pyc__L115;
logic [63:0] mem_waddr__linx_cpu_pyc__L116;
logic [63:0] mem_wdata__linx_cpu_pyc__L117;
logic v267;
logic [7:0] v268;
logic [7:0] mem_wstrb__linx_cpu_pyc__L119;
logic v269;
logic [7:0] v270;
logic [7:0] mem_wstrb__linx_cpu_pyc__L121;
logic [63:0] v271;
logic [63:0] mem_rdata__linx_cpu_pyc__L124;
logic [63:0] v272;
logic [63:0] ID__window__id_stage__L15;
logic [2:0] ID__zero3__decode__L55;
logic [63:0] ID__zero64__decode__L56;
logic [5:0] ID__reg_invalid__decode__L57;
logic [15:0] v273;
logic [15:0] ID__insn16__decode__L59;
logic [31:0] v274;
logic [31:0] ID__insn32__decode__L60;
logic [47:0] v275;
logic [47:0] ID__insn48__decode__L61;
logic [3:0] v276;
logic [3:0] ID__low4__decode__L63;
logic v277;
logic ID__is_hl__decode__L64;
logic v278;
logic ID__is32__decode__L66;
logic v279;
logic v280;
logic v281;
logic v282;
logic ID__in32__decode__L67;
logic v283;
logic v284;
logic v285;
logic ID__in16__decode__L68;
logic [4:0] v286;
logic [4:0] ID__rd32__decode__L70;
logic [4:0] v287;
logic [4:0] ID__rs1_32__decode__L71;
logic [4:0] v288;
logic [4:0] ID__rs2_32__decode__L72;
logic [4:0] v289;
logic [4:0] ID__srcp_32__decode__L73;
logic [11:0] v290;
logic [11:0] ID__imm12_u64__decode__L75;
logic [63:0] v291;
logic [63:0] ID__imm12_s64__decode__L76;
logic [19:0] v292;
logic [63:0] v293;
logic [63:0] v294;
logic [63:0] ID__imm20_s64__decode__L78;
logic [4:0] ID__swi_lo5__decode__L81;
logic [6:0] v295;
logic [6:0] ID__swi_hi7__decode__L82;
logic [11:0] v296;
logic [11:0] v297;
logic [11:0] v298;
logic [11:0] v299;
logic [11:0] v300;
logic [11:0] ID__simm12_raw__decode__L83;
logic [63:0] v301;
logic [63:0] ID__simm12_s64__decode__L84;
logic [16:0] v302;
logic [63:0] v303;
logic [63:0] v304;
logic [63:0] ID__simm17_s64__decode__L85;
logic [15:0] v305;
logic [15:0] ID__pfx16__decode__L89;
logic [31:0] v306;
logic [31:0] ID__main32__decode__L90;
logic [11:0] v307;
logic [11:0] ID__imm_hi12__decode__L91;
logic [19:0] v308;
logic [19:0] ID__imm_lo20__decode__L92;
logic [31:0] v309;
logic [31:0] v310;
logic [31:0] v311;
logic [31:0] v312;
logic [31:0] v313;
logic [31:0] ID__imm32__decode__L93;
logic [63:0] v314;
logic [63:0] ID__imm_hl_lui__decode__L94;
logic [4:0] v315;
logic [4:0] ID__rd_hl__decode__L96;
logic [4:0] v316;
logic [4:0] ID__rd16__decode__L99;
logic [4:0] v317;
logic [4:0] ID__rs16__decode__L100;
logic [63:0] v318;
logic [63:0] ID__simm5_11_s64__decode__L104;
logic [63:0] v319;
logic [63:0] ID__simm5_6_s64__decode__L105;
logic [11:0] v320;
logic [63:0] v321;
logic [63:0] v322;
logic [63:0] ID__simm12_s64_c__decode__L106;
logic [4:0] ID__uimm5__decode__L107;
logic [2:0] v323;
logic [2:0] ID__brtype__decode__L108;
logic [5:0] ID__op__decode__L110;
logic [2:0] ID__len_bytes__decode__L111;
logic [5:0] ID__regdst__decode__L112;
logic [5:0] ID__srcl__decode__L113;
logic [5:0] ID__srcr__decode__L114;
logic [5:0] ID__srcp__decode__L115;
logic [63:0] ID__imm__decode__L116;
logic [15:0] v324;
logic v325;
logic v326;
logic [15:0] v327;
logic v328;
logic ID__cond__decode__L119;
logic [2:0] v329;
logic [5:0] v330;
logic [4:0] ID__regdst__decode__L123;
logic [63:0] ID__imm__decode__L124;
logic [5:0] v331;
logic [63:0] v332;
logic [5:0] v333;
logic [63:0] v334;
logic [5:0] v335;
logic [63:0] ID__imm__decode__L120;
logic [2:0] ID__len_bytes__decode__L120;
logic [5:0] ID__op__decode__L120;
logic [5:0] ID__regdst__decode__L120;
logic [15:0] v336;
logic v337;
logic v338;
logic [15:0] v339;
logic v340;
logic ID__cond__decode__L126;
logic [2:0] v341;
logic [5:0] v342;
logic [5:0] v343;
logic [5:0] v344;
logic [5:0] v345;
logic [5:0] v346;
logic [5:0] ID__imm__decode__L131;
logic [63:0] v347;
logic [63:0] v348;
logic [63:0] v349;
logic [63:0] ID__imm__decode__L127;
logic [2:0] ID__len_bytes__decode__L127;
logic [5:0] ID__op__decode__L127;
logic [5:0] ID__regdst__decode__L127;
logic v350;
logic v351;
logic v352;
logic ID__cond__decode__L133;
logic [2:0] v353;
logic [5:0] v354;
logic [5:0] v355;
logic [4:0] ID__srcl__decode__L137;
logic [63:0] ID__imm__decode__L139;
logic [5:0] v356;
logic [63:0] v357;
logic [5:0] v358;
logic [63:0] v359;
logic [5:0] v360;
logic [63:0] ID__imm__decode__L134;
logic [2:0] ID__len_bytes__decode__L134;
logic [5:0] ID__op__decode__L134;
logic [5:0] ID__srcl__decode__L134;
logic [5:0] ID__srcr__decode__L134;
logic v361;
logic v362;
logic v363;
logic ID__cond__decode__L141;
logic [2:0] v364;
logic [5:0] v365;
logic [4:0] ID__srcl__decode__L145;
logic [63:0] ID__imm__decode__L146;
logic [5:0] v366;
logic [63:0] v367;
logic [5:0] v368;
logic [63:0] v369;
logic [5:0] v370;
logic [63:0] ID__imm__decode__L142;
logic [2:0] ID__len_bytes__decode__L142;
logic [5:0] ID__op__decode__L142;
logic [5:0] ID__srcl__decode__L142;
logic v371;
logic v372;
logic v373;
logic ID__cond__decode__L148;
logic [2:0] v374;
logic [5:0] v375;
logic [4:0] ID__regdst__decode__L152;
logic [4:0] ID__srcl__decode__L153;
logic [5:0] v376;
logic [5:0] v377;
logic [5:0] v378;
logic [5:0] v379;
logic [5:0] v380;
logic [5:0] v381;
logic [2:0] ID__len_bytes__decode__L149;
logic [5:0] ID__op__decode__L149;
logic [5:0] ID__regdst__decode__L149;
logic [5:0] ID__srcl__decode__L149;
logic v382;
logic v383;
logic v384;
logic ID__cond__decode__L155;
logic [2:0] v385;
logic [5:0] v386;
logic [4:0] ID__srcl__decode__L159;
logic [4:0] ID__srcr__decode__L160;
logic [5:0] v387;
logic [5:0] v388;
logic [5:0] v389;
logic [5:0] v390;
logic [5:0] v391;
logic [5:0] v392;
logic [2:0] ID__len_bytes__decode__L156;
logic [5:0] ID__op__decode__L156;
logic [5:0] ID__srcl__decode__L156;
logic [5:0] ID__srcr__decode__L156;
logic v393;
logic v394;
logic v395;
logic ID__cond__decode__L162;
logic [2:0] v396;
logic [5:0] v397;
logic [4:0] ID__srcl__decode__L166;
logic [5:0] v398;
logic [5:0] v399;
logic [5:0] v400;
logic [2:0] ID__len_bytes__decode__L163;
logic [5:0] ID__op__decode__L163;
logic [5:0] ID__srcl__decode__L163;
logic [15:0] v401;
logic v402;
logic v403;
logic v404;
logic ID__cond__decode__L168;
logic [2:0] v405;
logic [5:0] v406;
logic [63:0] v407;
logic [63:0] ID__imm__decode__L172;
logic [63:0] v408;
logic [63:0] ID__imm__decode__L169;
logic [2:0] ID__len_bytes__decode__L169;
logic [5:0] ID__op__decode__L169;
logic [15:0] v409;
logic v410;
logic v411;
logic v412;
logic ID__cond__decode__L174;
logic [2:0] v413;
logic [5:0] v414;
logic [2:0] ID__imm__decode__L178;
logic [63:0] v415;
logic [63:0] v416;
logic [63:0] v417;
logic [63:0] ID__imm__decode__L175;
logic [2:0] ID__len_bytes__decode__L175;
logic [5:0] ID__op__decode__L175;
logic [15:0] v418;
logic v419;
logic v420;
logic v421;
logic ID__cond__decode__L180;
logic [2:0] v422;
logic [5:0] v423;
logic [2:0] ID__len_bytes__decode__L181;
logic [5:0] ID__op__decode__L181;
logic [31:0] v424;
logic v425;
logic v426;
logic [31:0] v427;
logic v428;
logic ID__cond__decode__L186;
logic [2:0] v429;
logic [5:0] v430;
logic [4:0] ID__regdst__decode__L190;
logic [4:0] ID__srcl__decode__L191;
logic [4:0] ID__srcr__decode__L192;
logic [5:0] v431;
logic [5:0] v432;
logic [5:0] v433;
logic [5:0] v434;
logic [5:0] v435;
logic [5:0] v436;
logic [5:0] v437;
logic [5:0] v438;
logic [5:0] v439;
logic [2:0] ID__len_bytes__decode__L187;
logic [5:0] ID__op__decode__L187;
logic [5:0] ID__regdst__decode__L187;
logic [5:0] ID__srcl__decode__L187;
logic [5:0] ID__srcr__decode__L187;
logic v440;
logic v441;
logic v442;
logic ID__cond__decode__L194;
logic [2:0] v443;
logic [5:0] v444;
logic [4:0] ID__regdst__decode__L198;
logic [4:0] ID__srcl__decode__L199;
logic [4:0] ID__srcr__decode__L200;
logic [5:0] v445;
logic [5:0] v446;
logic [5:0] v447;
logic [5:0] v448;
logic [5:0] v449;
logic [5:0] v450;
logic [5:0] v451;
logic [5:0] v452;
logic [5:0] v453;
logic [2:0] ID__len_bytes__decode__L195;
logic [5:0] ID__op__decode__L195;
logic [5:0] ID__regdst__decode__L195;
logic [5:0] ID__srcl__decode__L195;
logic [5:0] ID__srcr__decode__L195;
logic v454;
logic v455;
logic v456;
logic ID__cond__decode__L202;
logic [2:0] v457;
logic [5:0] v458;
logic [4:0] ID__regdst__decode__L206;
logic [4:0] ID__srcl__decode__L207;
logic [4:0] ID__srcr__decode__L208;
logic [5:0] v459;
logic [5:0] v460;
logic [5:0] v461;
logic [5:0] v462;
logic [5:0] v463;
logic [5:0] v464;
logic [5:0] v465;
logic [5:0] v466;
logic [5:0] v467;
logic [2:0] ID__len_bytes__decode__L203;
logic [5:0] ID__op__decode__L203;
logic [5:0] ID__regdst__decode__L203;
logic [5:0] ID__srcl__decode__L203;
logic [5:0] ID__srcr__decode__L203;
logic v468;
logic v469;
logic v470;
logic ID__cond__decode__L210;
logic [2:0] v471;
logic [5:0] v472;
logic [4:0] ID__regdst__decode__L214;
logic [4:0] ID__srcl__decode__L215;
logic [4:0] ID__srcr__decode__L216;
logic [5:0] v473;
logic [5:0] v474;
logic [5:0] v475;
logic [5:0] v476;
logic [5:0] v477;
logic [5:0] v478;
logic [5:0] v479;
logic [5:0] v480;
logic [5:0] v481;
logic [2:0] ID__len_bytes__decode__L211;
logic [5:0] ID__op__decode__L211;
logic [5:0] ID__regdst__decode__L211;
logic [5:0] ID__srcl__decode__L211;
logic [5:0] ID__srcr__decode__L211;
logic v482;
logic v483;
logic v484;
logic ID__cond__decode__L218;
logic [2:0] v485;
logic [5:0] v486;
logic [4:0] ID__regdst__decode__L222;
logic [4:0] ID__srcl__decode__L223;
logic [4:0] ID__srcr__decode__L224;
logic [4:0] ID__srcp__decode__L225;
logic [5:0] v487;
logic [5:0] v488;
logic [5:0] v489;
logic [5:0] v490;
logic [5:0] v491;
logic [5:0] v492;
logic [5:0] v493;
logic [5:0] v494;
logic [5:0] v495;
logic [5:0] v496;
logic [5:0] v497;
logic [5:0] v498;
logic [2:0] ID__len_bytes__decode__L219;
logic [5:0] ID__op__decode__L219;
logic [5:0] ID__regdst__decode__L219;
logic [5:0] ID__srcl__decode__L219;
logic [5:0] ID__srcp__decode__L219;
logic [5:0] ID__srcr__decode__L219;
logic v499;
logic v500;
logic v501;
logic ID__cond__decode__L227;
logic [2:0] v502;
logic [5:0] v503;
logic [4:0] ID__srcl__decode__L231;
logic [4:0] ID__srcr__decode__L232;
logic [63:0] ID__imm__decode__L233;
logic [5:0] v504;
logic [5:0] v505;
logic [63:0] v506;
logic [5:0] v507;
logic [5:0] v508;
logic [63:0] v509;
logic [5:0] v510;
logic [5:0] v511;
logic [63:0] ID__imm__decode__L228;
logic [2:0] ID__len_bytes__decode__L228;
logic [5:0] ID__op__decode__L228;
logic [5:0] ID__srcl__decode__L228;
logic [5:0] ID__srcr__decode__L228;
logic v512;
logic v513;
logic v514;
logic ID__cond__decode__L235;
logic [2:0] v515;
logic [5:0] v516;
logic [4:0] ID__srcl__decode__L239;
logic [4:0] ID__srcr__decode__L240;
logic [63:0] ID__imm__decode__L241;
logic [5:0] v517;
logic [5:0] v518;
logic [63:0] v519;
logic [5:0] v520;
logic [5:0] v521;
logic [63:0] v522;
logic [5:0] v523;
logic [5:0] v524;
logic [63:0] ID__imm__decode__L236;
logic [2:0] ID__len_bytes__decode__L236;
logic [5:0] ID__op__decode__L236;
logic [5:0] ID__srcl__decode__L236;
logic [5:0] ID__srcr__decode__L236;
logic v525;
logic v526;
logic v527;
logic ID__cond__decode__L243;
logic [2:0] v528;
logic [5:0] v529;
logic [4:0] ID__regdst__decode__L247;
logic [4:0] ID__srcl__decode__L248;
logic [63:0] ID__imm__decode__L249;
logic [5:0] v530;
logic [5:0] v531;
logic [63:0] v532;
logic [5:0] v533;
logic [5:0] v534;
logic [63:0] v535;
logic [5:0] v536;
logic [5:0] v537;
logic [63:0] ID__imm__decode__L244;
logic [2:0] ID__len_bytes__decode__L244;
logic [5:0] ID__op__decode__L244;
logic [5:0] ID__regdst__decode__L244;
logic [5:0] ID__srcl__decode__L244;
logic v538;
logic v539;
logic v540;
logic ID__cond__decode__L251;
logic [2:0] v541;
logic [5:0] v542;
logic [4:0] ID__regdst__decode__L255;
logic [4:0] ID__srcl__decode__L256;
logic [11:0] ID__imm__decode__L257;
logic [63:0] v543;
logic [5:0] v544;
logic [5:0] v545;
logic [63:0] v546;
logic [5:0] v547;
logic [5:0] v548;
logic [63:0] v549;
logic [5:0] v550;
logic [5:0] v551;
logic [63:0] ID__imm__decode__L252;
logic [2:0] ID__len_bytes__decode__L252;
logic [5:0] ID__op__decode__L252;
logic [5:0] ID__regdst__decode__L252;
logic [5:0] ID__srcl__decode__L252;
logic v552;
logic v553;
logic v554;
logic ID__cond__decode__L259;
logic [2:0] v555;
logic [5:0] v556;
logic [4:0] ID__regdst__decode__L263;
logic [4:0] ID__srcl__decode__L264;
logic [11:0] ID__imm__decode__L265;
logic [63:0] v557;
logic [5:0] v558;
logic [5:0] v559;
logic [63:0] v560;
logic [5:0] v561;
logic [5:0] v562;
logic [63:0] v563;
logic [5:0] v564;
logic [5:0] v565;
logic [63:0] ID__imm__decode__L260;
logic [2:0] ID__len_bytes__decode__L260;
logic [5:0] ID__op__decode__L260;
logic [5:0] ID__regdst__decode__L260;
logic [5:0] ID__srcl__decode__L260;
logic v566;
logic v567;
logic v568;
logic ID__cond__decode__L267;
logic [2:0] v569;
logic [5:0] v570;
logic [4:0] ID__regdst__decode__L271;
logic [4:0] ID__srcl__decode__L272;
logic [11:0] ID__imm__decode__L273;
logic [63:0] v571;
logic [5:0] v572;
logic [5:0] v573;
logic [63:0] v574;
logic [5:0] v575;
logic [5:0] v576;
logic [63:0] v577;
logic [5:0] v578;
logic [5:0] v579;
logic [63:0] ID__imm__decode__L268;
logic [2:0] ID__len_bytes__decode__L268;
logic [5:0] ID__op__decode__L268;
logic [5:0] ID__regdst__decode__L268;
logic [5:0] ID__srcl__decode__L268;
logic [31:0] v580;
logic v581;
logic v582;
logic v583;
logic ID__cond__decode__L275;
logic [2:0] v584;
logic [5:0] v585;
logic [4:0] ID__regdst__decode__L279;
logic [4:0] ID__srcl__decode__L280;
logic [4:0] ID__srcr__decode__L281;
logic [5:0] v586;
logic [5:0] v587;
logic [5:0] v588;
logic [5:0] v589;
logic [5:0] v590;
logic [5:0] v591;
logic [5:0] v592;
logic [5:0] v593;
logic [5:0] v594;
logic [2:0] ID__len_bytes__decode__L276;
logic [5:0] ID__op__decode__L276;
logic [5:0] ID__regdst__decode__L276;
logic [5:0] ID__srcl__decode__L276;
logic [5:0] ID__srcr__decode__L276;
logic [31:0] v595;
logic v596;
logic v597;
logic v598;
logic ID__cond__decode__L283;
logic [2:0] v599;
logic [5:0] v600;
logic [2:0] ID__len_bytes__decode__L284;
logic [5:0] ID__op__decode__L284;
logic [31:0] v601;
logic v602;
logic v603;
logic v604;
logic ID__cond__decode__L288;
logic [2:0] v605;
logic [5:0] v606;
logic [4:0] ID__regdst__decode__L292;
logic [63:0] v607;
logic [63:0] ID__imm__decode__L293;
logic [5:0] v608;
logic [63:0] v609;
logic [5:0] v610;
logic [63:0] v611;
logic [5:0] v612;
logic [63:0] ID__imm__decode__L289;
logic [2:0] ID__len_bytes__decode__L289;
logic [5:0] ID__op__decode__L289;
logic [5:0] ID__regdst__decode__L289;
logic [31:0] v613;
logic v614;
logic v615;
logic v616;
logic ID__cond__decode__L295;
logic [2:0] v617;
logic [5:0] v618;
logic [63:0] v619;
logic [63:0] ID__imm__decode__L299;
logic [63:0] v620;
logic [63:0] ID__imm__decode__L296;
logic [2:0] ID__len_bytes__decode__L296;
logic [5:0] ID__op__decode__L296;
logic [47:0] v621;
logic v622;
logic v623;
logic v624;
logic ID__cond__decode__L302;
logic [2:0] v625;
logic [5:0] v626;
logic [4:0] ID__regdst__decode__L306;
logic [63:0] ID__imm__decode__L307;
logic [5:0] v627;
logic [63:0] v628;
logic [5:0] v629;
logic [63:0] v630;
logic [5:0] v631;
logic [63:0] ID__imm__decode__L303;
logic [2:0] ID__len_bytes__decode__L303;
logic [5:0] ID__op__decode__L303;
logic [5:0] ID__regdst__decode__L303;
logic [5:0] ID__op__id_stage__L21;
logic [2:0] ID__len_bytes__id_stage__L22;
logic [5:0] ID__regdst__id_stage__L23;
logic [5:0] ID__srcl__id_stage__L24;
logic [5:0] ID__srcr__id_stage__L25;
logic [5:0] ID__srcp__id_stage__L26;
logic [63:0] ID__imm__id_stage__L27;
logic [5:0] v632;
logic [2:0] v633;
logic [5:0] v634;
logic [5:0] v635;
logic [5:0] v636;
logic [5:0] v637;
logic [63:0] v638;
logic v639;
logic [63:0] v640;
logic v641;
logic [63:0] v642;
logic v643;
logic [63:0] v644;
logic v645;
logic [63:0] v646;
logic v647;
logic [63:0] v648;
logic v649;
logic [63:0] v650;
logic v651;
logic [63:0] v652;
logic v653;
logic [63:0] v654;
logic v655;
logic [63:0] v656;
logic v657;
logic [63:0] v658;
logic v659;
logic [63:0] v660;
logic v661;
logic [63:0] v662;
logic v663;
logic [63:0] v664;
logic v665;
logic [63:0] v666;
logic v667;
logic [63:0] v668;
logic v669;
logic [63:0] v670;
logic v671;
logic [63:0] v672;
logic v673;
logic [63:0] v674;
logic v675;
logic [63:0] v676;
logic v677;
logic [63:0] v678;
logic v679;
logic [63:0] v680;
logic v681;
logic [63:0] v682;
logic v683;
logic [63:0] v684;
logic v685;
logic [63:0] v686;
logic v687;
logic [63:0] v688;
logic v689;
logic [63:0] v690;
logic v691;
logic [63:0] v692;
logic v693;
logic [63:0] v694;
logic v695;
logic [63:0] v696;
logic v697;
logic [63:0] v698;
logic v699;
logic [63:0] v700;
logic v701;
logic [63:0] v702;
logic [63:0] v703;
logic [63:0] ID__srcl_val__id_stage__L38;
logic v704;
logic [63:0] v705;
logic v706;
logic [63:0] v707;
logic v708;
logic [63:0] v709;
logic v710;
logic [63:0] v711;
logic v712;
logic [63:0] v713;
logic v714;
logic [63:0] v715;
logic v716;
logic [63:0] v717;
logic v718;
logic [63:0] v719;
logic v720;
logic [63:0] v721;
logic v722;
logic [63:0] v723;
logic v724;
logic [63:0] v725;
logic v726;
logic [63:0] v727;
logic v728;
logic [63:0] v729;
logic v730;
logic [63:0] v731;
logic v732;
logic [63:0] v733;
logic v734;
logic [63:0] v735;
logic v736;
logic [63:0] v737;
logic v738;
logic [63:0] v739;
logic v740;
logic [63:0] v741;
logic v742;
logic [63:0] v743;
logic v744;
logic [63:0] v745;
logic v746;
logic [63:0] v747;
logic v748;
logic [63:0] v749;
logic v750;
logic [63:0] v751;
logic v752;
logic [63:0] v753;
logic v754;
logic [63:0] v755;
logic v756;
logic [63:0] v757;
logic v758;
logic [63:0] v759;
logic v760;
logic [63:0] v761;
logic v762;
logic [63:0] v763;
logic v764;
logic [63:0] v765;
logic v766;
logic [63:0] v767;
logic [63:0] v768;
logic [63:0] ID__srcr_val__id_stage__L39;
logic v769;
logic [63:0] v770;
logic v771;
logic [63:0] v772;
logic v773;
logic [63:0] v774;
logic v775;
logic [63:0] v776;
logic v777;
logic [63:0] v778;
logic v779;
logic [63:0] v780;
logic v781;
logic [63:0] v782;
logic v783;
logic [63:0] v784;
logic v785;
logic [63:0] v786;
logic v787;
logic [63:0] v788;
logic v789;
logic [63:0] v790;
logic v791;
logic [63:0] v792;
logic v793;
logic [63:0] v794;
logic v795;
logic [63:0] v796;
logic v797;
logic [63:0] v798;
logic v799;
logic [63:0] v800;
logic v801;
logic [63:0] v802;
logic v803;
logic [63:0] v804;
logic v805;
logic [63:0] v806;
logic v807;
logic [63:0] v808;
logic v809;
logic [63:0] v810;
logic v811;
logic [63:0] v812;
logic v813;
logic [63:0] v814;
logic v815;
logic [63:0] v816;
logic v817;
logic [63:0] v818;
logic v819;
logic [63:0] v820;
logic v821;
logic [63:0] v822;
logic v823;
logic [63:0] v824;
logic v825;
logic [63:0] v826;
logic v827;
logic [63:0] v828;
logic v829;
logic [63:0] v830;
logic v831;
logic [63:0] v832;
logic [63:0] v833;
logic [63:0] ID__srcp_val__id_stage__L40;
logic [63:0] v834;
logic [63:0] v835;
logic [63:0] v836;
logic EX__z1__ex_stage__L38;
logic [2:0] EX__z3__ex_stage__L39;
logic [63:0] EX__z64__ex_stage__L40;
logic [63:0] EX__pc__ex_stage__L43;
logic [5:0] EX__op__ex_stage__L44;
logic [2:0] EX__len_bytes__ex_stage__L45;
logic [5:0] EX__regdst__ex_stage__L46;
logic [63:0] EX__srcl_val__ex_stage__L47;
logic [63:0] EX__srcr_val__ex_stage__L48;
logic [63:0] EX__srcp_val__ex_stage__L49;
logic [63:0] EX__imm__ex_stage__L50;
logic v837;
logic EX__op_c_bstart_std__ex_stage__L52;
logic v838;
logic EX__op_c_bstart_cond__ex_stage__L53;
logic v839;
logic EX__op_bstart_std_call__ex_stage__L54;
logic v840;
logic EX__op_c_movr__ex_stage__L55;
logic v841;
logic EX__op_c_movi__ex_stage__L56;
logic v842;
logic EX__op_c_setret__ex_stage__L57;
logic v843;
logic EX__op_c_setc_eq__ex_stage__L58;
logic v844;
logic EX__op_c_setc_tgt__ex_stage__L59;
logic v845;
logic EX__op_addtpc__ex_stage__L60;
logic v846;
logic EX__op_addi__ex_stage__L61;
logic v847;
logic EX__op_subi__ex_stage__L62;
logic v848;
logic EX__op_addiw__ex_stage__L63;
logic v849;
logic EX__op_addw__ex_stage__L64;
logic v850;
logic EX__op_orw__ex_stage__L65;
logic v851;
logic EX__op_andw__ex_stage__L66;
logic v852;
logic EX__op_xorw__ex_stage__L67;
logic v853;
logic EX__op_cmp_eq__ex_stage__L68;
logic v854;
logic EX__op_csel__ex_stage__L69;
logic v855;
logic EX__op_hl_lui__ex_stage__L70;
logic v856;
logic EX__op_lwi__ex_stage__L71;
logic v857;
logic EX__op_c_lwi__ex_stage__L72;
logic v858;
logic EX__op_swi__ex_stage__L73;
logic v859;
logic EX__op_c_swi__ex_stage__L74;
logic v860;
logic EX__op_sdi__ex_stage__L75;
logic [63:0] v861;
logic [63:0] EX__off__ex_stage__L77;
logic [63:0] EX__alu__ex_stage__L79;
logic EX__is_load__ex_stage__L80;
logic EX__is_store__ex_stage__L81;
logic [2:0] EX__size__ex_stage__L82;
logic [63:0] EX__addr__ex_stage__L83;
logic [63:0] EX__wdata__ex_stage__L84;
logic v862;
logic v863;
logic v864;
logic [63:0] EX__alu__ex_stage__L88;
logic EX__is_load__ex_stage__L89;
logic EX__is_store__ex_stage__L90;
logic [2:0] EX__size__ex_stage__L91;
logic [63:0] EX__addr__ex_stage__L92;
logic [63:0] EX__wdata__ex_stage__L93;
logic [63:0] v865;
logic [63:0] v866;
logic v867;
logic v868;
logic [2:0] v869;
logic [63:0] v870;
logic [63:0] v871;
logic [63:0] v872;
logic v873;
logic v874;
logic [2:0] v875;
logic [63:0] v876;
logic [63:0] EX__addr__ex_stage__L87;
logic [63:0] EX__alu__ex_stage__L87;
logic EX__is_load__ex_stage__L87;
logic EX__is_store__ex_stage__L87;
logic [2:0] EX__size__ex_stage__L87;
logic [63:0] EX__wdata__ex_stage__L87;
logic [63:0] EX__alu__ex_stage__L97;
logic EX__is_load__ex_stage__L98;
logic EX__is_store__ex_stage__L99;
logic [2:0] EX__size__ex_stage__L100;
logic [63:0] EX__addr__ex_stage__L101;
logic [63:0] EX__wdata__ex_stage__L102;
logic [63:0] v877;
logic [63:0] v878;
logic v879;
logic v880;
logic [2:0] v881;
logic [63:0] v882;
logic [63:0] v883;
logic [63:0] v884;
logic v885;
logic v886;
logic [2:0] v887;
logic [63:0] v888;
logic [63:0] EX__addr__ex_stage__L96;
logic [63:0] EX__alu__ex_stage__L96;
logic EX__is_load__ex_stage__L96;
logic EX__is_store__ex_stage__L96;
logic [2:0] EX__size__ex_stage__L96;
logic [63:0] EX__wdata__ex_stage__L96;
logic [63:0] EX__alu__ex_stage__L106;
logic EX__is_load__ex_stage__L107;
logic EX__is_store__ex_stage__L108;
logic [2:0] EX__size__ex_stage__L109;
logic [63:0] EX__addr__ex_stage__L110;
logic [63:0] EX__wdata__ex_stage__L111;
logic [63:0] v889;
logic [63:0] v890;
logic v891;
logic v892;
logic [2:0] v893;
logic [63:0] v894;
logic [63:0] v895;
logic [63:0] v896;
logic v897;
logic v898;
logic [2:0] v899;
logic [63:0] v900;
logic [63:0] EX__addr__ex_stage__L105;
logic [63:0] EX__alu__ex_stage__L105;
logic EX__is_load__ex_stage__L105;
logic EX__is_store__ex_stage__L105;
logic [2:0] EX__size__ex_stage__L105;
logic [63:0] EX__wdata__ex_stage__L105;
logic [63:0] v901;
logic [63:0] EX__alu__ex_stage__L115;
logic EX__is_load__ex_stage__L116;
logic EX__is_store__ex_stage__L117;
logic [2:0] EX__size__ex_stage__L118;
logic [63:0] EX__addr__ex_stage__L119;
logic [63:0] EX__wdata__ex_stage__L120;
logic [63:0] v902;
logic [63:0] v903;
logic v904;
logic v905;
logic [2:0] v906;
logic [63:0] v907;
logic [63:0] v908;
logic [63:0] v909;
logic v910;
logic v911;
logic [2:0] v912;
logic [63:0] v913;
logic [63:0] EX__addr__ex_stage__L114;
logic [63:0] EX__alu__ex_stage__L114;
logic EX__is_load__ex_stage__L114;
logic EX__is_store__ex_stage__L114;
logic [2:0] EX__size__ex_stage__L114;
logic [63:0] EX__wdata__ex_stage__L114;
logic [63:0] EX__setc_eq__ex_stage__L123;
logic v914;
logic [63:0] v915;
logic [63:0] EX__setc_eq__ex_stage__L124;
logic [63:0] EX__alu__ex_stage__L127;
logic EX__is_load__ex_stage__L128;
logic EX__is_store__ex_stage__L129;
logic [2:0] EX__size__ex_stage__L130;
logic [63:0] EX__addr__ex_stage__L131;
logic [63:0] EX__wdata__ex_stage__L132;
logic [63:0] v916;
logic [63:0] v917;
logic v918;
logic v919;
logic [2:0] v920;
logic [63:0] v921;
logic [63:0] v922;
logic [63:0] v923;
logic v924;
logic v925;
logic [2:0] v926;
logic [63:0] v927;
logic [63:0] EX__addr__ex_stage__L126;
logic [63:0] EX__alu__ex_stage__L126;
logic EX__is_load__ex_stage__L126;
logic EX__is_store__ex_stage__L126;
logic [2:0] EX__size__ex_stage__L126;
logic [63:0] EX__wdata__ex_stage__L126;
logic [63:0] EX__alu__ex_stage__L134;
logic EX__is_load__ex_stage__L135;
logic EX__is_store__ex_stage__L136;
logic [2:0] EX__size__ex_stage__L137;
logic [63:0] EX__addr__ex_stage__L138;
logic [63:0] EX__wdata__ex_stage__L139;
logic [63:0] v928;
logic [63:0] v929;
logic v930;
logic v931;
logic [2:0] v932;
logic [63:0] v933;
logic [63:0] v934;
logic [63:0] v935;
logic v936;
logic v937;
logic [2:0] v938;
logic [63:0] v939;
logic [63:0] EX__addr__ex_stage__L133;
logic [63:0] EX__alu__ex_stage__L133;
logic EX__is_load__ex_stage__L133;
logic EX__is_store__ex_stage__L133;
logic [2:0] EX__size__ex_stage__L133;
logic [63:0] EX__wdata__ex_stage__L133;
logic [63:0] v940;
logic [63:0] EX__pc_page__ex_stage__L142;
logic [63:0] v941;
logic [63:0] EX__alu__ex_stage__L144;
logic EX__is_load__ex_stage__L145;
logic EX__is_store__ex_stage__L146;
logic [2:0] EX__size__ex_stage__L147;
logic [63:0] EX__addr__ex_stage__L148;
logic [63:0] EX__wdata__ex_stage__L149;
logic [63:0] v942;
logic [63:0] v943;
logic v944;
logic v945;
logic [2:0] v946;
logic [63:0] v947;
logic [63:0] v948;
logic [63:0] v949;
logic v950;
logic v951;
logic [2:0] v952;
logic [63:0] v953;
logic [63:0] EX__addr__ex_stage__L143;
logic [63:0] EX__alu__ex_stage__L143;
logic EX__is_load__ex_stage__L143;
logic EX__is_store__ex_stage__L143;
logic [2:0] EX__size__ex_stage__L143;
logic [63:0] EX__wdata__ex_stage__L143;
logic [63:0] v954;
logic [63:0] EX__alu__ex_stage__L153;
logic EX__is_load__ex_stage__L154;
logic EX__is_store__ex_stage__L155;
logic [2:0] EX__size__ex_stage__L156;
logic [63:0] EX__addr__ex_stage__L157;
logic [63:0] EX__wdata__ex_stage__L158;
logic [63:0] v955;
logic [63:0] v956;
logic v957;
logic v958;
logic [2:0] v959;
logic [63:0] v960;
logic [63:0] v961;
logic [63:0] v962;
logic v963;
logic v964;
logic [2:0] v965;
logic [63:0] v966;
logic [63:0] EX__addr__ex_stage__L152;
logic [63:0] EX__alu__ex_stage__L152;
logic EX__is_load__ex_stage__L152;
logic EX__is_store__ex_stage__L152;
logic [2:0] EX__size__ex_stage__L152;
logic [63:0] EX__wdata__ex_stage__L152;
logic [63:0] v967;
logic [63:0] v968;
logic [63:0] v969;
logic [63:0] v970;
logic [63:0] EX__subi__ex_stage__L159;
logic [63:0] EX__alu__ex_stage__L161;
logic EX__is_load__ex_stage__L162;
logic EX__is_store__ex_stage__L163;
logic [2:0] EX__size__ex_stage__L164;
logic [63:0] EX__addr__ex_stage__L165;
logic [63:0] EX__wdata__ex_stage__L166;
logic [63:0] v971;
logic [63:0] v972;
logic v973;
logic v974;
logic [2:0] v975;
logic [63:0] v976;
logic [63:0] v977;
logic [63:0] v978;
logic v979;
logic v980;
logic [2:0] v981;
logic [63:0] v982;
logic [63:0] EX__addr__ex_stage__L160;
logic [63:0] EX__alu__ex_stage__L160;
logic EX__is_load__ex_stage__L160;
logic EX__is_store__ex_stage__L160;
logic [2:0] EX__size__ex_stage__L160;
logic [63:0] EX__wdata__ex_stage__L160;
logic [31:0] v983;
logic [31:0] v984;
logic [31:0] v985;
logic [63:0] v986;
logic [31:0] v987;
logic [63:0] v988;
logic [63:0] EX__addiw__ex_stage__L167;
logic [63:0] EX__alu__ex_stage__L169;
logic EX__is_load__ex_stage__L170;
logic EX__is_store__ex_stage__L171;
logic [2:0] EX__size__ex_stage__L172;
logic [63:0] EX__addr__ex_stage__L173;
logic [63:0] EX__wdata__ex_stage__L174;
logic [63:0] v989;
logic [63:0] v990;
logic v991;
logic v992;
logic [2:0] v993;
logic [63:0] v994;
logic [63:0] v995;
logic [63:0] v996;
logic v997;
logic v998;
logic [2:0] v999;
logic [63:0] v1000;
logic [63:0] EX__addr__ex_stage__L168;
logic [63:0] EX__alu__ex_stage__L168;
logic EX__is_load__ex_stage__L168;
logic EX__is_store__ex_stage__L168;
logic [2:0] EX__size__ex_stage__L168;
logic [63:0] EX__wdata__ex_stage__L168;
logic [31:0] v1001;
logic [31:0] v1002;
logic [63:0] v1003;
logic [31:0] v1004;
logic [63:0] v1005;
logic [63:0] EX__addw__ex_stage__L177;
logic [31:0] v1006;
logic [63:0] v1007;
logic [63:0] v1008;
logic [63:0] EX__orw__ex_stage__L178;
logic [31:0] v1009;
logic [63:0] v1010;
logic [63:0] v1011;
logic [63:0] EX__andw__ex_stage__L179;
logic [31:0] v1012;
logic [63:0] v1013;
logic [63:0] v1014;
logic [63:0] EX__xorw__ex_stage__L180;
logic [63:0] EX__alu__ex_stage__L182;
logic EX__is_load__ex_stage__L183;
logic EX__is_store__ex_stage__L184;
logic [2:0] EX__size__ex_stage__L185;
logic [63:0] EX__addr__ex_stage__L186;
logic [63:0] EX__wdata__ex_stage__L187;
logic [63:0] v1015;
logic [63:0] v1016;
logic v1017;
logic v1018;
logic [2:0] v1019;
logic [63:0] v1020;
logic [63:0] v1021;
logic [63:0] v1022;
logic v1023;
logic v1024;
logic [2:0] v1025;
logic [63:0] v1026;
logic [63:0] EX__addr__ex_stage__L181;
logic [63:0] EX__alu__ex_stage__L181;
logic EX__is_load__ex_stage__L181;
logic EX__is_store__ex_stage__L181;
logic [2:0] EX__size__ex_stage__L181;
logic [63:0] EX__wdata__ex_stage__L181;
logic [63:0] EX__alu__ex_stage__L189;
logic EX__is_load__ex_stage__L190;
logic EX__is_store__ex_stage__L191;
logic [2:0] EX__size__ex_stage__L192;
logic [63:0] EX__addr__ex_stage__L193;
logic [63:0] EX__wdata__ex_stage__L194;
logic [63:0] v1027;
logic [63:0] v1028;
logic v1029;
logic v1030;
logic [2:0] v1031;
logic [63:0] v1032;
logic [63:0] v1033;
logic [63:0] v1034;
logic v1035;
logic v1036;
logic [2:0] v1037;
logic [63:0] v1038;
logic [63:0] EX__addr__ex_stage__L188;
logic [63:0] EX__alu__ex_stage__L188;
logic EX__is_load__ex_stage__L188;
logic EX__is_store__ex_stage__L188;
logic [2:0] EX__size__ex_stage__L188;
logic [63:0] EX__wdata__ex_stage__L188;
logic [63:0] EX__alu__ex_stage__L196;
logic EX__is_load__ex_stage__L197;
logic EX__is_store__ex_stage__L198;
logic [2:0] EX__size__ex_stage__L199;
logic [63:0] EX__addr__ex_stage__L200;
logic [63:0] EX__wdata__ex_stage__L201;
logic [63:0] v1039;
logic [63:0] v1040;
logic v1041;
logic v1042;
logic [2:0] v1043;
logic [63:0] v1044;
logic [63:0] v1045;
logic [63:0] v1046;
logic v1047;
logic v1048;
logic [2:0] v1049;
logic [63:0] v1050;
logic [63:0] EX__addr__ex_stage__L195;
logic [63:0] EX__alu__ex_stage__L195;
logic EX__is_load__ex_stage__L195;
logic EX__is_store__ex_stage__L195;
logic [2:0] EX__size__ex_stage__L195;
logic [63:0] EX__wdata__ex_stage__L195;
logic [63:0] EX__alu__ex_stage__L203;
logic EX__is_load__ex_stage__L204;
logic EX__is_store__ex_stage__L205;
logic [2:0] EX__size__ex_stage__L206;
logic [63:0] EX__addr__ex_stage__L207;
logic [63:0] EX__wdata__ex_stage__L208;
logic [63:0] v1051;
logic [63:0] v1052;
logic v1053;
logic v1054;
logic [2:0] v1055;
logic [63:0] v1056;
logic [63:0] v1057;
logic [63:0] v1058;
logic v1059;
logic v1060;
logic [2:0] v1061;
logic [63:0] v1062;
logic [63:0] EX__addr__ex_stage__L202;
logic [63:0] EX__alu__ex_stage__L202;
logic EX__is_load__ex_stage__L202;
logic EX__is_store__ex_stage__L202;
logic [2:0] EX__size__ex_stage__L202;
logic [63:0] EX__wdata__ex_stage__L202;
logic [63:0] EX__cmp__ex_stage__L211;
logic [63:0] v1063;
logic [63:0] EX__cmp__ex_stage__L212;
logic [63:0] EX__alu__ex_stage__L215;
logic EX__is_load__ex_stage__L216;
logic EX__is_store__ex_stage__L217;
logic [2:0] EX__size__ex_stage__L218;
logic [63:0] EX__addr__ex_stage__L219;
logic [63:0] EX__wdata__ex_stage__L220;
logic [63:0] v1064;
logic [63:0] v1065;
logic v1066;
logic v1067;
logic [2:0] v1068;
logic [63:0] v1069;
logic [63:0] v1070;
logic [63:0] v1071;
logic v1072;
logic v1073;
logic [2:0] v1074;
logic [63:0] v1075;
logic [63:0] EX__addr__ex_stage__L214;
logic [63:0] EX__alu__ex_stage__L214;
logic EX__is_load__ex_stage__L214;
logic EX__is_store__ex_stage__L214;
logic [2:0] EX__size__ex_stage__L214;
logic [63:0] EX__wdata__ex_stage__L214;
logic [63:0] EX__alu__ex_stage__L224;
logic EX__is_load__ex_stage__L225;
logic EX__is_store__ex_stage__L226;
logic [2:0] EX__size__ex_stage__L227;
logic [63:0] EX__addr__ex_stage__L228;
logic [63:0] EX__wdata__ex_stage__L229;
logic [63:0] v1076;
logic [63:0] v1077;
logic v1078;
logic v1079;
logic [2:0] v1080;
logic [63:0] v1081;
logic [63:0] v1082;
logic [63:0] v1083;
logic v1084;
logic v1085;
logic [2:0] v1086;
logic [63:0] v1087;
logic [63:0] EX__addr__ex_stage__L223;
logic [63:0] EX__alu__ex_stage__L223;
logic EX__is_load__ex_stage__L223;
logic EX__is_store__ex_stage__L223;
logic [2:0] EX__size__ex_stage__L223;
logic [63:0] EX__wdata__ex_stage__L223;
logic [63:0] EX__csel_val__ex_stage__L232;
logic v1088;
logic v1089;
logic v1090;
logic [63:0] EX__csel_val__ex_stage__L234;
logic [63:0] v1091;
logic [63:0] EX__csel_val__ex_stage__L233;
logic [63:0] EX__alu__ex_stage__L236;
logic EX__is_load__ex_stage__L237;
logic EX__is_store__ex_stage__L238;
logic [2:0] EX__size__ex_stage__L239;
logic [63:0] EX__addr__ex_stage__L240;
logic [63:0] EX__wdata__ex_stage__L241;
logic [63:0] v1092;
logic [63:0] v1093;
logic v1094;
logic v1095;
logic [2:0] v1096;
logic [63:0] v1097;
logic [63:0] v1098;
logic [63:0] v1099;
logic v1100;
logic v1101;
logic [2:0] v1102;
logic [63:0] v1103;
logic [63:0] EX__addr__ex_stage__L235;
logic [63:0] EX__alu__ex_stage__L235;
logic EX__is_load__ex_stage__L235;
logic EX__is_store__ex_stage__L235;
logic [2:0] EX__size__ex_stage__L235;
logic [63:0] EX__wdata__ex_stage__L235;
logic v1104;
logic EX__is_lwi__ex_stage__L244;
logic [63:0] v1105;
logic [63:0] EX__lwi_addr__ex_stage__L245;
logic v1106;
logic [2:0] v1107;
logic [63:0] EX__alu__ex_stage__L247;
logic EX__is_store__ex_stage__L249;
logic [63:0] EX__addr__ex_stage__L251;
logic [63:0] EX__wdata__ex_stage__L252;
logic [63:0] v1108;
logic [63:0] v1109;
logic v1110;
logic [63:0] v1111;
logic [63:0] v1112;
logic [63:0] v1113;
logic v1114;
logic [63:0] v1115;
logic [63:0] EX__addr__ex_stage__L246;
logic [63:0] EX__alu__ex_stage__L246;
logic EX__is_load__ex_stage__L246;
logic EX__is_store__ex_stage__L246;
logic [2:0] EX__size__ex_stage__L246;
logic [63:0] EX__wdata__ex_stage__L246;
logic [63:0] EX__store_addr__ex_stage__L255;
logic [63:0] EX__store_data__ex_stage__L256;
logic [63:0] v1116;
logic [63:0] EX__store_addr__ex_stage__L258;
logic [63:0] EX__store_data__ex_stage__L259;
logic [63:0] v1117;
logic [63:0] v1118;
logic [63:0] v1119;
logic [63:0] v1120;
logic [63:0] EX__store_addr__ex_stage__L257;
logic [63:0] EX__store_data__ex_stage__L257;
logic v1121;
logic v1122;
logic [2:0] v1123;
logic [63:0] EX__alu__ex_stage__L261;
logic EX__is_load__ex_stage__L262;
logic [63:0] EX__addr__ex_stage__L265;
logic [63:0] EX__wdata__ex_stage__L266;
logic [63:0] v1124;
logic [63:0] v1125;
logic v1126;
logic [63:0] v1127;
logic [63:0] v1128;
logic [63:0] v1129;
logic v1130;
logic [63:0] v1131;
logic [63:0] EX__addr__ex_stage__L260;
logic [63:0] EX__alu__ex_stage__L260;
logic EX__is_load__ex_stage__L260;
logic EX__is_store__ex_stage__L260;
logic [2:0] EX__size__ex_stage__L260;
logic [63:0] EX__wdata__ex_stage__L260;
logic [63:0] v1132;
logic [63:0] EX__sdi_off__ex_stage__L269;
logic [63:0] v1133;
logic [63:0] EX__sdi_addr__ex_stage__L270;
logic v1134;
logic [2:0] v1135;
logic [63:0] EX__alu__ex_stage__L272;
logic EX__is_load__ex_stage__L273;
logic [63:0] EX__addr__ex_stage__L276;
logic [63:0] EX__wdata__ex_stage__L277;
logic [63:0] v1136;
logic [63:0] v1137;
logic v1138;
logic [63:0] v1139;
logic [63:0] v1140;
logic [63:0] v1141;
logic v1142;
logic [63:0] v1143;
logic [63:0] EX__addr__ex_stage__L271;
logic [63:0] EX__alu__ex_stage__L271;
logic EX__is_load__ex_stage__L271;
logic EX__is_store__ex_stage__L271;
logic [2:0] EX__size__ex_stage__L271;
logic [63:0] EX__wdata__ex_stage__L271;
logic [5:0] v1144;
logic [2:0] v1145;
logic [5:0] v1146;
logic [63:0] v1147;
logic v1148;
logic v1149;
logic [2:0] v1150;
logic [63:0] v1151;
logic [63:0] v1152;
logic [5:0] MEM__op__mem_stage__L12;
logic [2:0] MEM__len_bytes__mem_stage__L13;
logic [5:0] MEM__regdst__mem_stage__L14;
logic [63:0] MEM__alu__mem_stage__L15;
logic MEM__is_load__mem_stage__L16;
logic MEM__is_store__mem_stage__L17;
logic [31:0] v1153;
logic [31:0] MEM__load32__mem_stage__L20;
logic [63:0] v1154;
logic [63:0] MEM__load64__mem_stage__L21;
logic [63:0] MEM__mem_val__mem_stage__L22;
logic [63:0] MEM__mem_val__mem_stage__L24;
logic [63:0] v1155;
logic [63:0] MEM__mem_val__mem_stage__L23;
logic [63:0] v1156;
logic [63:0] MEM__mem_val__mem_stage__L25;
logic [5:0] v1157;
logic [2:0] v1158;
logic [5:0] v1159;
logic [63:0] v1160;
logic [2:0] WB__stage__wb_stage__L48;
logic [63:0] WB__pc__wb_stage__L49;
logic [1:0] WB__br_kind__wb_stage__L50;
logic [63:0] WB__br_base_pc__wb_stage__L51;
logic [63:0] WB__br_off__wb_stage__L52;
logic WB__commit_cond__wb_stage__L53;
logic [63:0] WB__commit_tgt__wb_stage__L54;
logic [5:0] WB__op__wb_stage__L56;
logic [2:0] WB__len_bytes__wb_stage__L57;
logic [5:0] WB__regdst__wb_stage__L58;
logic [63:0] WB__value__wb_stage__L59;
logic v1161;
logic v1162;
logic WB__op_c_bstart_std__wb_stage__L65;
logic v1163;
logic WB__op_c_bstart_cond__wb_stage__L66;
logic v1164;
logic WB__op_bstart_call__wb_stage__L67;
logic v1165;
logic WB__op_c_bstop__wb_stage__L68;
logic v1166;
logic v1167;
logic v1168;
logic WB__op_is_start_marker__wb_stage__L70;
logic v1169;
logic WB__op_is_boundary__wb_stage__L71;
logic v1170;
logic WB__br_is_cond__wb_stage__L73;
logic v1171;
logic WB__br_is_call__wb_stage__L74;
logic v1172;
logic WB__br_is_ret__wb_stage__L75;
logic [63:0] v1173;
logic [63:0] WB__br_target_pc__wb_stage__L77;
logic [63:0] WB__br_target_pc__wb_stage__L79;
logic [63:0] v1174;
logic [63:0] WB__br_target_pc__wb_stage__L78;
logic v1175;
logic v1176;
logic v1177;
logic v1178;
logic WB__br_take__wb_stage__L81;
logic [63:0] v1179;
logic [63:0] v1180;
logic [63:0] v1181;
logic [63:0] WB__pc_inc__wb_stage__L83;
logic [63:0] WB__pc_next__wb_stage__L84;
logic v1182;
logic [63:0] WB__pc_next__wb_stage__L86;
logic [63:0] v1183;
logic [63:0] WB__pc_next__wb_stage__L85;
logic [63:0] v1184;
logic [2:0] WB__stage_seq__wb_stage__L90;
logic [2:0] v1185;
logic [2:0] WB__stage_seq__wb_stage__L91;
logic [2:0] v1186;
logic [2:0] WB__stage_seq__wb_stage__L93;
logic [2:0] v1187;
logic [2:0] WB__stage_seq__wb_stage__L95;
logic [2:0] v1188;
logic [2:0] WB__stage_seq__wb_stage__L97;
logic [2:0] v1189;
logic [2:0] WB__stage_seq__wb_stage__L99;
logic [2:0] v1190;
logic [63:0] v1191;
logic v1192;
logic WB__op_c_setc_eq__wb_stage__L108;
logic v1193;
logic WB__op_c_setc_tgt__wb_stage__L109;
logic WB__commit_cond_next__wb_stage__L111;
logic [63:0] WB__commit_tgt_next__wb_stage__L112;
logic v1194;
logic v1195;
logic [63:0] v1196;
logic WB__commit_cond_next__wb_stage__L114;
logic [63:0] WB__commit_tgt_next__wb_stage__L114;
logic v1197;
logic v1198;
logic v1199;
logic v1200;
logic WB__commit_cond_next__wb_stage__L118;
logic v1201;
logic WB__commit_cond_next__wb_stage__L117;
logic v1202;
logic [63:0] WB__commit_tgt_next__wb_stage__L120;
logic [63:0] v1203;
logic [63:0] WB__commit_tgt_next__wb_stage__L119;
logic [1:0] WB__br_kind_next__wb_stage__L127;
logic [63:0] WB__br_base_next__wb_stage__L128;
logic [63:0] WB__br_off_next__wb_stage__L129;
logic v1204;
logic [1:0] v1205;
logic [63:0] v1206;
logic [63:0] WB__br_base_next__wb_stage__L134;
logic [63:0] v1207;
logic [63:0] WB__br_base_next__wb_stage__L132;
logic [1:0] WB__br_kind_next__wb_stage__L132;
logic [63:0] WB__br_off_next__wb_stage__L132;
logic v1208;
logic v1209;
logic v1210;
logic v1211;
logic v1212;
logic WB__enter_new_block__wb_stage__L137;
logic v1213;
logic [1:0] v1214;
logic [63:0] WB__br_base_next__wb_stage__L142;
logic [63:0] WB__br_off_next__wb_stage__L143;
logic [63:0] v1215;
logic [63:0] v1216;
logic [63:0] v1217;
logic [63:0] v1218;
logic [63:0] WB__br_base_next__wb_stage__L140;
logic [1:0] WB__br_kind_next__wb_stage__L140;
logic [63:0] WB__br_off_next__wb_stage__L140;
logic v1219;
logic [1:0] v1220;
logic [63:0] WB__br_base_next__wb_stage__L148;
logic [63:0] WB__br_off_next__wb_stage__L149;
logic [63:0] v1221;
logic [63:0] v1222;
logic [63:0] v1223;
logic [63:0] v1224;
logic [63:0] WB__br_base_next__wb_stage__L146;
logic [1:0] WB__br_kind_next__wb_stage__L146;
logic [63:0] WB__br_off_next__wb_stage__L146;
logic [2:0] v1225;
logic [2:0] WB__brtype__wb_stage__L152;
logic v1226;
logic [1:0] v1227;
logic [1:0] WB__kind_from_brtype__wb_stage__L154;
logic v1228;
logic [63:0] v1229;
logic [1:0] WB__br_kind_next__wb_stage__L157;
logic [63:0] WB__br_base_next__wb_stage__L158;
logic [63:0] v1230;
logic [1:0] v1231;
logic [63:0] v1232;
logic [1:0] v1233;
logic [63:0] WB__br_base_next__wb_stage__L156;
logic [1:0] WB__br_kind_next__wb_stage__L156;
logic [63:0] WB__br_off_next__wb_stage__L156;
logic v1234;
logic [1:0] v1235;
logic [63:0] v1236;
logic [63:0] WB__br_base_next__wb_stage__L164;
logic [63:0] v1237;
logic [63:0] WB__br_base_next__wb_stage__L162;
logic [1:0] WB__br_kind_next__wb_stage__L162;
logic [63:0] WB__br_off_next__wb_stage__L162;
logic v1238;
logic v1239;
logic v1240;
logic v1241;
logic WB__wb_is_store__wb_stage__L172;
logic v1242;
logic v1243;
logic v1244;
logic v1245;
logic v1246;
logic v1247;
logic WB__do_reg_write__wb_stage__L173;
logic WB__do_clear_hands__wb_stage__L175;
logic v1248;
logic v1249;
logic v1250;
logic WB__do_push_t__wb_stage__L176;
logic v1251;
logic v1252;
logic v1253;
logic v1254;
logic WB__do_push_t__wb_stage__L178;
logic v1255;
logic v1256;
logic v1257;
logic WB__do_push_u__wb_stage__L179;
logic v1258;
logic v1259;
logic [63:0] v1260;
logic [63:0] v1261;
logic v1262;
logic v1263;
logic [63:0] v1264;
logic [63:0] v1265;
logic v1266;
logic v1267;
logic [63:0] v1268;
logic [63:0] v1269;
logic v1270;
logic v1271;
logic [63:0] v1272;
logic [63:0] v1273;
logic v1274;
logic v1275;
logic [63:0] v1276;
logic [63:0] v1277;
logic v1278;
logic v1279;
logic [63:0] v1280;
logic [63:0] v1281;
logic v1282;
logic v1283;
logic [63:0] v1284;
logic [63:0] v1285;
logic v1286;
logic v1287;
logic [63:0] v1288;
logic [63:0] v1289;
logic v1290;
logic v1291;
logic [63:0] v1292;
logic [63:0] v1293;
logic v1294;
logic v1295;
logic [63:0] v1296;
logic [63:0] v1297;
logic v1298;
logic v1299;
logic [63:0] v1300;
logic [63:0] v1301;
logic v1302;
logic v1303;
logic [63:0] v1304;
logic [63:0] v1305;
logic v1306;
logic v1307;
logic [63:0] v1308;
logic [63:0] v1309;
logic v1310;
logic v1311;
logic [63:0] v1312;
logic [63:0] v1313;
logic v1314;
logic v1315;
logic [63:0] v1316;
logic [63:0] v1317;
logic v1318;
logic v1319;
logic [63:0] v1320;
logic [63:0] v1321;
logic v1322;
logic v1323;
logic [63:0] v1324;
logic [63:0] v1325;
logic v1326;
logic v1327;
logic [63:0] v1328;
logic [63:0] v1329;
logic v1330;
logic v1331;
logic [63:0] v1332;
logic [63:0] v1333;
logic v1334;
logic v1335;
logic [63:0] v1336;
logic [63:0] v1337;
logic v1338;
logic v1339;
logic [63:0] v1340;
logic [63:0] v1341;
logic v1342;
logic v1343;
logic [63:0] v1344;
logic [63:0] v1345;
logic v1346;
logic v1347;
logic [63:0] v1348;
logic [63:0] v1349;
logic [63:0] WB__n0__regfile__L43;
logic [63:0] WB__n1__regfile__L44;
logic [63:0] WB__n2__regfile__L45;
logic [63:0] WB__n3__regfile__L46;
logic [63:0] WB__n3__regfile__L49;
logic [63:0] WB__n2__regfile__L50;
logic [63:0] WB__n1__regfile__L51;
logic [63:0] WB__n0__regfile__L52;
logic [63:0] v1350;
logic [63:0] v1351;
logic [63:0] v1352;
logic [63:0] v1353;
logic [63:0] v1354;
logic [63:0] v1355;
logic [63:0] v1356;
logic [63:0] v1357;
logic [63:0] WB__n0__regfile__L48;
logic [63:0] WB__n1__regfile__L48;
logic [63:0] WB__n2__regfile__L48;
logic [63:0] WB__n3__regfile__L48;
logic [63:0] v1358;
logic [63:0] v1359;
logic [63:0] v1360;
logic [63:0] v1361;
logic [63:0] WB__n0__regfile__L55;
logic [63:0] WB__n1__regfile__L55;
logic [63:0] WB__n2__regfile__L55;
logic [63:0] WB__n3__regfile__L55;
logic [63:0] WB__n0__regfile__L43_2;
logic [63:0] WB__n1__regfile__L44_2;
logic [63:0] WB__n2__regfile__L45_2;
logic [63:0] WB__n3__regfile__L46_2;
logic [63:0] WB__n3__regfile__L49_2;
logic [63:0] WB__n2__regfile__L50_2;
logic [63:0] WB__n1__regfile__L51_2;
logic [63:0] v1362;
logic [63:0] v1363;
logic [63:0] v1364;
logic [63:0] v1365;
logic [63:0] v1366;
logic [63:0] v1367;
logic [63:0] v1368;
logic [63:0] v1369;
logic [63:0] WB__n0__regfile__L48_2;
logic [63:0] WB__n1__regfile__L48_2;
logic [63:0] WB__n2__regfile__L48_2;
logic [63:0] WB__n3__regfile__L48_2;
logic [63:0] v1370;
logic [63:0] v1371;
logic [63:0] v1372;
logic [63:0] v1373;
logic [63:0] WB__n0__regfile__L55_2;
logic [63:0] WB__n1__regfile__L55_2;
logic [63:0] WB__n2__regfile__L55_2;
logic [63:0] WB__n3__regfile__L55_2;

assign v1 = 3'd7;
assign v2 = 2'd3;
assign v3 = 2'd2;
assign v4 = 2'd1;
assign v5 = 64'd18446744073709547520;
assign v6 = 6'd31;
assign v7 = 6'd30;
assign v8 = 6'd29;
assign v9 = 6'd28;
assign v10 = 6'd27;
assign v11 = 6'd17;
assign v12 = 3'd6;
assign v13 = 48'd1507342;
assign v14 = 48'd8323087;
assign v15 = 6'd20;
assign v16 = 32'd16385;
assign v17 = 32'd32767;
assign v18 = 6'd25;
assign v19 = 32'd7;
assign v20 = 32'd127;
assign v21 = 32'd1052715;
assign v22 = 32'd4043309055;
assign v23 = 6'd15;
assign v24 = 32'd69;
assign v25 = 32'd4160778367;
assign v26 = 6'd6;
assign v27 = 32'd4117;
assign v28 = 6'd7;
assign v29 = 32'd21;
assign v30 = 6'd8;
assign v31 = 32'd53;
assign v32 = 6'd9;
assign v33 = 32'd8217;
assign v34 = 6'd26;
assign v35 = 32'd12377;
assign v36 = 32'd8281;
assign v37 = 6'd16;
assign v38 = 32'd119;
assign v39 = 6'd11;
assign v40 = 32'd37;
assign v41 = 6'd12;
assign v42 = 32'd12325;
assign v43 = 6'd13;
assign v44 = 32'd8229;
assign v45 = 6'd14;
assign v46 = 32'd16421;
assign v47 = 32'd28799;
assign v48 = 6'd2;
assign v49 = 16'd65535;
assign v50 = 6'd1;
assign v51 = 16'd0;
assign v52 = 16'd51199;
assign v53 = 6'd19;
assign v54 = 16'd4;
assign v55 = 16'd15;
assign v56 = 16'd28;
assign v57 = 6'd23;
assign v58 = 16'd38;
assign v59 = 6'd3;
assign v60 = 16'd6;
assign v61 = 6'd4;
assign v62 = 16'd10;
assign v63 = 6'd24;
assign v64 = 6'd5;
assign v65 = 16'd42;
assign v66 = 6'd10;
assign v67 = 6'd22;
assign v68 = 16'd20502;
assign v69 = 16'd63551;
assign v70 = 6'd21;
assign v71 = 16'd22;
assign v72 = 16'd63;
assign v73 = 4'd14;
assign v74 = 8'd15;
assign v75 = 8'd255;
assign v76 = 6'd18;
assign v77 = 3'd4;
assign v78 = 3'd3;
assign v79 = 3'd2;
assign v80 = 3'd1;
assign v81 = 6'd63;
assign v82 = 2'd0;
assign v83 = 64'd1;
assign v84 = 64'd0;
assign v85 = 8'd0;
assign v86 = 6'd0;
assign v87 = 3'd0;
assign v88 = 1'd0;
assign v89 = 1'd1;
assign v90 = v1;
assign v91 = v2;
assign v92 = v3;
assign v93 = v4;
assign v94 = v5;
assign v95 = v6;
assign v96 = v7;
assign v97 = v8;
assign v98 = v9;
assign v99 = v10;
assign v100 = v11;
assign v101 = v12;
assign v102 = v13;
assign v103 = v14;
assign v104 = v15;
assign v105 = v16;
assign v106 = v17;
assign v107 = v18;
assign v108 = v19;
assign v109 = v20;
assign v110 = v21;
assign v111 = v22;
assign v112 = v23;
assign v113 = v24;
assign v114 = v25;
assign v115 = v26;
assign v116 = v27;
assign v117 = v28;
assign v118 = v29;
assign v119 = v30;
assign v120 = v31;
assign v121 = v32;
assign v122 = v33;
assign v123 = v34;
assign v124 = v35;
assign v125 = v36;
assign v126 = v37;
assign v127 = v38;
assign v128 = v39;
assign v129 = v40;
assign v130 = v41;
assign v131 = v42;
assign v132 = v43;
assign v133 = v44;
assign v134 = v45;
assign v135 = v46;
assign v136 = v47;
assign v137 = v48;
assign v138 = v49;
assign v139 = v50;
assign v140 = v51;
assign v141 = v52;
assign v142 = v53;
assign v143 = v54;
assign v144 = v55;
assign v145 = v56;
assign v146 = v57;
assign v147 = v58;
assign v148 = v59;
assign v149 = v60;
assign v150 = v61;
assign v151 = v62;
assign v152 = v63;
assign v153 = v64;
assign v154 = v65;
assign v155 = v66;
assign v156 = v67;
assign v157 = v68;
assign v158 = v69;
assign v159 = v70;
assign v160 = v71;
assign v161 = v72;
assign v162 = v73;
assign v163 = v74;
assign v164 = v75;
assign v165 = v76;
assign v166 = v77;
assign v167 = v78;
assign v168 = v79;
assign v169 = v80;
assign v170 = v81;
assign v171 = v82;
assign v172 = v83;
assign v173 = v84;
assign v174 = v85;
assign v175 = v86;
assign v176 = v87;
assign v177 = v88;
assign v178 = v89;
assign boot_pc__linx_cpu_pyc__L25 = boot_pc;
assign boot_sp__linx_cpu_pyc__L26 = boot_sp;
pyc_reg #(.WIDTH(3)) v179_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(state__stage__next),
  .init(v176),
  .q(v179)
);
assign state__stage = v179;
pyc_reg #(.WIDTH(64)) v180_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(state__pc__next),
  .init(boot_pc__linx_cpu_pyc__L25),
  .q(v180)
);
assign state__pc = v180;
pyc_reg #(.WIDTH(2)) v181_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(state__br_kind__next),
  .init(v171),
  .q(v181)
);
assign state__br_kind = v181;
pyc_reg #(.WIDTH(64)) v182_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(state__br_base_pc__next),
  .init(boot_pc__linx_cpu_pyc__L25),
  .q(v182)
);
assign state__br_base_pc = v182;
pyc_reg #(.WIDTH(64)) v183_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(state__br_off__next),
  .init(v173),
  .q(v183)
);
assign state__br_off = v183;
pyc_reg #(.WIDTH(1)) v184_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(state__commit_cond__next),
  .init(v177),
  .q(v184)
);
assign state__commit_cond = v184;
pyc_reg #(.WIDTH(64)) v185_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(state__commit_tgt__next),
  .init(v173),
  .q(v185)
);
assign state__commit_tgt = v185;
pyc_reg #(.WIDTH(64)) v186_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(state__cycles__next),
  .init(v173),
  .q(v186)
);
assign state__cycles = v186;
pyc_reg #(.WIDTH(1)) v187_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(state__halted__next),
  .init(v177),
  .q(v187)
);
assign state__halted = v187;
pyc_reg #(.WIDTH(64)) v188_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(ifid__window__next),
  .init(v173),
  .q(v188)
);
assign ifid__window = v188;
pyc_reg #(.WIDTH(6)) v189_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(idex__op__next),
  .init(v175),
  .q(v189)
);
assign idex__op = v189;
pyc_reg #(.WIDTH(3)) v190_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(idex__len_bytes__next),
  .init(v176),
  .q(v190)
);
assign idex__len_bytes = v190;
pyc_reg #(.WIDTH(6)) v191_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(idex__regdst__next),
  .init(v170),
  .q(v191)
);
assign idex__regdst = v191;
pyc_reg #(.WIDTH(6)) v192_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(idex__srcl__next),
  .init(v170),
  .q(v192)
);
assign idex__srcl = v192;
pyc_reg #(.WIDTH(6)) v193_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(idex__srcr__next),
  .init(v170),
  .q(v193)
);
assign idex__srcr = v193;
pyc_reg #(.WIDTH(6)) v194_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(idex__srcp__next),
  .init(v170),
  .q(v194)
);
assign idex__srcp = v194;
pyc_reg #(.WIDTH(64)) v195_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(idex__imm__next),
  .init(v173),
  .q(v195)
);
assign idex__imm = v195;
pyc_reg #(.WIDTH(64)) v196_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(idex__srcl_val__next),
  .init(v173),
  .q(v196)
);
assign idex__srcl_val = v196;
pyc_reg #(.WIDTH(64)) v197_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(idex__srcr_val__next),
  .init(v173),
  .q(v197)
);
assign idex__srcr_val = v197;
pyc_reg #(.WIDTH(64)) v198_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(idex__srcp_val__next),
  .init(v173),
  .q(v198)
);
assign idex__srcp_val = v198;
pyc_reg #(.WIDTH(6)) v199_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(exmem__op__next),
  .init(v175),
  .q(v199)
);
assign exmem__op = v199;
pyc_reg #(.WIDTH(3)) v200_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(exmem__len_bytes__next),
  .init(v176),
  .q(v200)
);
assign exmem__len_bytes = v200;
pyc_reg #(.WIDTH(6)) v201_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(exmem__regdst__next),
  .init(v170),
  .q(v201)
);
assign exmem__regdst = v201;
pyc_reg #(.WIDTH(64)) v202_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(exmem__alu__next),
  .init(v173),
  .q(v202)
);
assign exmem__alu = v202;
pyc_reg #(.WIDTH(1)) v203_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(exmem__is_load__next),
  .init(v177),
  .q(v203)
);
assign exmem__is_load = v203;
pyc_reg #(.WIDTH(1)) v204_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(exmem__is_store__next),
  .init(v177),
  .q(v204)
);
assign exmem__is_store = v204;
pyc_reg #(.WIDTH(3)) v205_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(exmem__size__next),
  .init(v176),
  .q(v205)
);
assign exmem__size = v205;
pyc_reg #(.WIDTH(64)) v206_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(exmem__addr__next),
  .init(v173),
  .q(v206)
);
assign exmem__addr = v206;
pyc_reg #(.WIDTH(64)) v207_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(exmem__wdata__next),
  .init(v173),
  .q(v207)
);
assign exmem__wdata = v207;
pyc_reg #(.WIDTH(6)) v208_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(memwb__op__next),
  .init(v175),
  .q(v208)
);
assign memwb__op = v208;
pyc_reg #(.WIDTH(3)) v209_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(memwb__len_bytes__next),
  .init(v176),
  .q(v209)
);
assign memwb__len_bytes = v209;
pyc_reg #(.WIDTH(6)) v210_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(memwb__regdst__next),
  .init(v170),
  .q(v210)
);
assign memwb__regdst = v210;
pyc_reg #(.WIDTH(64)) v211_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(memwb__value__next),
  .init(v173),
  .q(v211)
);
assign memwb__value = v211;
pyc_reg #(.WIDTH(64)) v212_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(gpr__r0__next),
  .init(v173),
  .q(v212)
);
pyc_reg #(.WIDTH(64)) v213_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(gpr__r1__next),
  .init(boot_sp__linx_cpu_pyc__L26),
  .q(v213)
);
assign gpr__r1 = v213;
pyc_reg #(.WIDTH(64)) v214_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(gpr__r2__next),
  .init(v173),
  .q(v214)
);
assign gpr__r2 = v214;
pyc_reg #(.WIDTH(64)) v215_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(gpr__r3__next),
  .init(v173),
  .q(v215)
);
assign gpr__r3 = v215;
pyc_reg #(.WIDTH(64)) v216_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(gpr__r4__next),
  .init(v173),
  .q(v216)
);
assign gpr__r4 = v216;
pyc_reg #(.WIDTH(64)) v217_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(gpr__r5__next),
  .init(v173),
  .q(v217)
);
assign gpr__r5 = v217;
pyc_reg #(.WIDTH(64)) v218_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(gpr__r6__next),
  .init(v173),
  .q(v218)
);
assign gpr__r6 = v218;
pyc_reg #(.WIDTH(64)) v219_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(gpr__r7__next),
  .init(v173),
  .q(v219)
);
assign gpr__r7 = v219;
pyc_reg #(.WIDTH(64)) v220_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(gpr__r8__next),
  .init(v173),
  .q(v220)
);
assign gpr__r8 = v220;
pyc_reg #(.WIDTH(64)) v221_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(gpr__r9__next),
  .init(v173),
  .q(v221)
);
assign gpr__r9 = v221;
pyc_reg #(.WIDTH(64)) v222_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(gpr__r10__next),
  .init(v173),
  .q(v222)
);
assign gpr__r10 = v222;
pyc_reg #(.WIDTH(64)) v223_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(gpr__r11__next),
  .init(v173),
  .q(v223)
);
assign gpr__r11 = v223;
pyc_reg #(.WIDTH(64)) v224_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(gpr__r12__next),
  .init(v173),
  .q(v224)
);
assign gpr__r12 = v224;
pyc_reg #(.WIDTH(64)) v225_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(gpr__r13__next),
  .init(v173),
  .q(v225)
);
assign gpr__r13 = v225;
pyc_reg #(.WIDTH(64)) v226_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(gpr__r14__next),
  .init(v173),
  .q(v226)
);
assign gpr__r14 = v226;
pyc_reg #(.WIDTH(64)) v227_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(gpr__r15__next),
  .init(v173),
  .q(v227)
);
assign gpr__r15 = v227;
pyc_reg #(.WIDTH(64)) v228_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(gpr__r16__next),
  .init(v173),
  .q(v228)
);
assign gpr__r16 = v228;
pyc_reg #(.WIDTH(64)) v229_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(gpr__r17__next),
  .init(v173),
  .q(v229)
);
assign gpr__r17 = v229;
pyc_reg #(.WIDTH(64)) v230_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(gpr__r18__next),
  .init(v173),
  .q(v230)
);
assign gpr__r18 = v230;
pyc_reg #(.WIDTH(64)) v231_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(gpr__r19__next),
  .init(v173),
  .q(v231)
);
assign gpr__r19 = v231;
pyc_reg #(.WIDTH(64)) v232_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(gpr__r20__next),
  .init(v173),
  .q(v232)
);
assign gpr__r20 = v232;
pyc_reg #(.WIDTH(64)) v233_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(gpr__r21__next),
  .init(v173),
  .q(v233)
);
assign gpr__r21 = v233;
pyc_reg #(.WIDTH(64)) v234_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(gpr__r22__next),
  .init(v173),
  .q(v234)
);
assign gpr__r22 = v234;
pyc_reg #(.WIDTH(64)) v235_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(gpr__r23__next),
  .init(v173),
  .q(v235)
);
assign gpr__r23 = v235;
pyc_reg #(.WIDTH(64)) v236_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(t__r0__next),
  .init(v173),
  .q(v236)
);
assign t__r0 = v236;
pyc_reg #(.WIDTH(64)) v237_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(t__r1__next),
  .init(v173),
  .q(v237)
);
assign t__r1 = v237;
pyc_reg #(.WIDTH(64)) v238_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(t__r2__next),
  .init(v173),
  .q(v238)
);
assign t__r2 = v238;
pyc_reg #(.WIDTH(64)) v239_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(t__r3__next),
  .init(v173),
  .q(v239)
);
assign t__r3 = v239;
pyc_reg #(.WIDTH(64)) v240_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(u__r0__next),
  .init(v173),
  .q(v240)
);
assign u__r0 = v240;
pyc_reg #(.WIDTH(64)) v241_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(u__r1__next),
  .init(v173),
  .q(v241)
);
assign u__r1 = v241;
pyc_reg #(.WIDTH(64)) v242_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(u__r2__next),
  .init(v173),
  .q(v242)
);
assign u__r2 = v242;
pyc_reg #(.WIDTH(64)) v243_inst (
  .clk(clk),
  .rst(rst),
  .en(v178),
  .d(u__r3__next),
  .init(v173),
  .q(v243)
);
assign u__r3 = v243;
assign v244 = (state__stage == v176);
assign stage_is_if__linx_cpu_pyc__L93 = v244;
assign v245 = (state__stage == v169);
assign stage_is_id__linx_cpu_pyc__L94 = v245;
assign v246 = (state__stage == v168);
assign stage_is_ex__linx_cpu_pyc__L95 = v246;
assign v247 = (state__stage == v167);
assign stage_is_mem__linx_cpu_pyc__L96 = v247;
assign v248 = (state__stage == v166);
assign stage_is_wb__linx_cpu_pyc__L97 = v248;
assign v249 = (~state__halted);
assign v250 = (stage_is_wb__linx_cpu_pyc__L97 & v249);
assign v251 = (memwb__op == v165);
assign v252 = (memwb__op == v175);
assign v253 = (v251 | v252);
assign v254 = (v250 & v253);
assign v255 = v254;
assign halt_set__linx_cpu_pyc__L99 = v255;
pyc_or #(.WIDTH(1)) v256_inst (
  .a(state__halted),
  .b(halt_set__linx_cpu_pyc__L99),
  .y(v256)
);
assign stop__linx_cpu_pyc__L100 = v256;
pyc_not #(.WIDTH(1)) v257_inst (
  .a(stop__linx_cpu_pyc__L100),
  .y(v257)
);
assign active__linx_cpu_pyc__L101 = v257;
pyc_and #(.WIDTH(1)) v258_inst (
  .a(stage_is_if__linx_cpu_pyc__L93),
  .b(active__linx_cpu_pyc__L101),
  .y(v258)
);
assign do_if__linx_cpu_pyc__L103 = v258;
pyc_and #(.WIDTH(1)) v259_inst (
  .a(stage_is_id__linx_cpu_pyc__L94),
  .b(active__linx_cpu_pyc__L101),
  .y(v259)
);
assign do_id__linx_cpu_pyc__L104 = v259;
pyc_and #(.WIDTH(1)) v260_inst (
  .a(stage_is_ex__linx_cpu_pyc__L95),
  .b(active__linx_cpu_pyc__L101),
  .y(v260)
);
assign do_ex__linx_cpu_pyc__L105 = v260;
pyc_and #(.WIDTH(1)) v261_inst (
  .a(stage_is_mem__linx_cpu_pyc__L96),
  .b(active__linx_cpu_pyc__L101),
  .y(v261)
);
assign do_mem__linx_cpu_pyc__L106 = v261;
pyc_and #(.WIDTH(1)) v262_inst (
  .a(stage_is_wb__linx_cpu_pyc__L97),
  .b(active__linx_cpu_pyc__L101),
  .y(v262)
);
assign do_wb__linx_cpu_pyc__L107 = v262;
pyc_and #(.WIDTH(1)) v263_inst (
  .a(v261),
  .b(exmem__is_load),
  .y(v263)
);
assign mem_raddr__linx_cpu_pyc__L112 = exmem__addr;
pyc_mux #(.WIDTH(64)) v264_inst (
  .sel(v263),
  .a(mem_raddr__linx_cpu_pyc__L112),
  .b(v173),
  .y(v264)
);
assign mem_raddr__linx_cpu_pyc__L111 = v264;
assign mem_raddr__linx_cpu_pyc__L114 = state__pc;
pyc_mux #(.WIDTH(64)) v265_inst (
  .sel(do_if__linx_cpu_pyc__L103),
  .a(mem_raddr__linx_cpu_pyc__L114),
  .b(mem_raddr__linx_cpu_pyc__L111),
  .y(v265)
);
assign mem_raddr__linx_cpu_pyc__L113 = v265;
pyc_and #(.WIDTH(1)) v266_inst (
  .a(v261),
  .b(exmem__is_store),
  .y(v266)
);
assign mem_wvalid__linx_cpu_pyc__L115 = v266;
assign mem_waddr__linx_cpu_pyc__L116 = exmem__addr;
assign mem_wdata__linx_cpu_pyc__L117 = exmem__wdata;
assign v267 = (exmem__size == v176);
assign v268 = (v267 ? v164 : v174);
assign mem_wstrb__linx_cpu_pyc__L119 = v268;
assign v269 = (exmem__size == v166);
assign v270 = (v269 ? v163 : mem_wstrb__linx_cpu_pyc__L119);
assign mem_wstrb__linx_cpu_pyc__L121 = v270;
pyc_byte_mem #(.ADDR_WIDTH(64), .DATA_WIDTH(64), .DEPTH(1048576)) mem (
  .clk(clk),
  .rst(rst),
  .raddr(mem_raddr__linx_cpu_pyc__L113),
  .rdata(v271),
  .wvalid(mem_wvalid__linx_cpu_pyc__L115),
  .waddr(mem_waddr__linx_cpu_pyc__L116),
  .wdata(mem_wdata__linx_cpu_pyc__L117),
  .wstrb(mem_wstrb__linx_cpu_pyc__L121)
);
assign mem_rdata__linx_cpu_pyc__L124 = v271;
pyc_mux #(.WIDTH(64)) v272_inst (
  .sel(do_if__linx_cpu_pyc__L103),
  .a(mem_rdata__linx_cpu_pyc__L124),
  .b(ifid__window),
  .y(v272)
);
assign ifid__window__next = v272;
assign ID__window__id_stage__L15 = ifid__window;
assign ID__zero3__decode__L55 = v176;
assign ID__zero64__decode__L56 = v173;
assign ID__reg_invalid__decode__L57 = v170;
assign v273 = ID__window__id_stage__L15[15:0];
assign ID__insn16__decode__L59 = v273;
assign v274 = ID__window__id_stage__L15[31:0];
assign ID__insn32__decode__L60 = v274;
assign v275 = ID__window__id_stage__L15[47:0];
assign ID__insn48__decode__L61 = v275;
assign v276 = ID__insn16__decode__L59[3:0];
assign ID__low4__decode__L63 = v276;
assign v277 = (ID__low4__decode__L63 == v162);
assign ID__is_hl__decode__L64 = v277;
assign v278 = ID__insn16__decode__L59[0];
assign ID__is32__decode__L66 = v278;
assign v279 = (~ID__is_hl__decode__L64);
assign v280 = (v279 & ID__is32__decode__L66);
assign v281 = v279;
assign v282 = v280;
assign ID__in32__decode__L67 = v282;
assign v283 = (~ID__is32__decode__L66);
assign v284 = (v281 & v283);
assign v285 = v284;
assign ID__in16__decode__L68 = v285;
assign v286 = ID__insn32__decode__L60[11:7];
assign ID__rd32__decode__L70 = v286;
assign v287 = ID__insn32__decode__L60[19:15];
assign ID__rs1_32__decode__L71 = v287;
assign v288 = ID__insn32__decode__L60[24:20];
assign ID__rs2_32__decode__L72 = v288;
assign v289 = ID__insn32__decode__L60[31:27];
assign ID__srcp_32__decode__L73 = v289;
assign v290 = ID__insn32__decode__L60[31:20];
assign ID__imm12_u64__decode__L75 = v290;
assign v291 = {{52{v290[11]}}, v290};
assign ID__imm12_s64__decode__L76 = v291;
assign v292 = ID__insn32__decode__L60[31:12];
assign v293 = {{44{v292[19]}}, v292};
assign v294 = v293;
assign ID__imm20_s64__decode__L78 = v294;
assign ID__swi_lo5__decode__L81 = v286;
assign v295 = ID__insn32__decode__L60[31:25];
assign ID__swi_hi7__decode__L82 = v295;
assign v296 = {{7{1'b0}}, ID__swi_lo5__decode__L81};
assign v297 = (v296 << 7);
assign v298 = {{5{1'b0}}, ID__swi_hi7__decode__L82};
assign v299 = (v297 | v298);
assign v300 = v299;
assign ID__simm12_raw__decode__L83 = v300;
assign v301 = {{52{ID__simm12_raw__decode__L83[11]}}, ID__simm12_raw__decode__L83};
assign ID__simm12_s64__decode__L84 = v301;
assign v302 = ID__insn32__decode__L60[31:15];
assign v303 = {{47{v302[16]}}, v302};
assign v304 = v303;
assign ID__simm17_s64__decode__L85 = v304;
assign v305 = ID__insn48__decode__L61[15:0];
assign ID__pfx16__decode__L89 = v305;
assign v306 = ID__insn48__decode__L61[47:16];
assign ID__main32__decode__L90 = v306;
assign v307 = ID__pfx16__decode__L89[15:4];
assign ID__imm_hi12__decode__L91 = v307;
assign v308 = ID__main32__decode__L90[31:12];
assign ID__imm_lo20__decode__L92 = v308;
assign v309 = {{20{1'b0}}, ID__imm_hi12__decode__L91};
assign v310 = (v309 << 20);
assign v311 = {{12{1'b0}}, ID__imm_lo20__decode__L92};
assign v312 = (v310 | v311);
assign v313 = v312;
assign ID__imm32__decode__L93 = v313;
assign v314 = {{32{ID__imm32__decode__L93[31]}}, ID__imm32__decode__L93};
assign ID__imm_hl_lui__decode__L94 = v314;
assign v315 = ID__main32__decode__L90[11:7];
assign ID__rd_hl__decode__L96 = v315;
assign v316 = ID__insn16__decode__L59[15:11];
assign ID__rd16__decode__L99 = v316;
assign v317 = ID__insn16__decode__L59[10:6];
assign ID__rs16__decode__L100 = v317;
assign v318 = {{59{v316[4]}}, v316};
assign ID__simm5_11_s64__decode__L104 = v318;
assign v319 = {{59{v317[4]}}, v317};
assign ID__simm5_6_s64__decode__L105 = v319;
assign v320 = ID__insn16__decode__L59[15:4];
assign v321 = {{52{v320[11]}}, v320};
assign v322 = v321;
assign ID__simm12_s64_c__decode__L106 = v322;
assign ID__uimm5__decode__L107 = v317;
assign v323 = ID__insn16__decode__L59[13:11];
assign ID__brtype__decode__L108 = v323;
assign ID__op__decode__L110 = v175;
assign ID__len_bytes__decode__L111 = ID__zero3__decode__L55;
assign ID__regdst__decode__L112 = ID__reg_invalid__decode__L57;
assign ID__srcl__decode__L113 = ID__reg_invalid__decode__L57;
assign ID__srcr__decode__L114 = ID__reg_invalid__decode__L57;
assign ID__srcp__decode__L115 = ID__reg_invalid__decode__L57;
assign ID__imm__decode__L116 = ID__zero64__decode__L56;
assign v324 = (ID__insn16__decode__L59 & v161);
assign v325 = (v324 == v160);
assign v326 = (ID__in16__decode__L68 & v325);
assign v327 = v324;
assign v328 = v326;
assign ID__cond__decode__L119 = v328;
assign v329 = (ID__cond__decode__L119 ? v168 : ID__len_bytes__decode__L111);
assign v330 = (ID__cond__decode__L119 ? v159 : ID__op__decode__L110);
assign ID__regdst__decode__L123 = ID__rd16__decode__L99;
assign ID__imm__decode__L124 = ID__simm5_6_s64__decode__L105;
assign v331 = {{1{1'b0}}, ID__regdst__decode__L123};
assign v332 = (ID__cond__decode__L119 ? ID__imm__decode__L124 : ID__imm__decode__L116);
assign v333 = (ID__cond__decode__L119 ? v331 : ID__regdst__decode__L112);
assign v334 = v332;
assign v335 = v333;
assign ID__imm__decode__L120 = v334;
assign ID__len_bytes__decode__L120 = v329;
assign ID__op__decode__L120 = v330;
assign ID__regdst__decode__L120 = v335;
assign v336 = (ID__insn16__decode__L59 & v158);
assign v337 = (v336 == v157);
assign v338 = (ID__in16__decode__L68 & v337);
assign v339 = v336;
assign v340 = v338;
assign ID__cond__decode__L126 = v340;
assign v341 = (ID__cond__decode__L126 ? v168 : ID__len_bytes__decode__L120);
assign v342 = (ID__cond__decode__L126 ? v156 : ID__op__decode__L120);
assign v343 = (ID__cond__decode__L126 ? v155 : ID__regdst__decode__L120);
assign v344 = {{1{1'b0}}, ID__uimm5__decode__L107};
assign v345 = (v344 << 1);
assign v346 = v345;
assign ID__imm__decode__L131 = v346;
assign v347 = {{58{1'b0}}, ID__imm__decode__L131};
assign v348 = (ID__cond__decode__L126 ? v347 : ID__imm__decode__L120);
assign v349 = v348;
assign ID__imm__decode__L127 = v349;
assign ID__len_bytes__decode__L127 = v341;
assign ID__op__decode__L127 = v342;
assign ID__regdst__decode__L127 = v343;
assign v350 = (v327 == v154);
assign v351 = (ID__in16__decode__L68 & v350);
assign v352 = v351;
assign ID__cond__decode__L133 = v352;
assign v353 = (ID__cond__decode__L133 ? v168 : ID__len_bytes__decode__L127);
assign v354 = (ID__cond__decode__L133 ? v153 : ID__op__decode__L127);
assign v355 = (ID__cond__decode__L133 ? v152 : ID__srcr__decode__L114);
assign ID__srcl__decode__L137 = ID__rs16__decode__L100;
assign ID__imm__decode__L139 = ID__simm5_11_s64__decode__L104;
assign v356 = {{1{1'b0}}, ID__srcl__decode__L137};
assign v357 = (ID__cond__decode__L133 ? ID__imm__decode__L139 : ID__imm__decode__L127);
assign v358 = (ID__cond__decode__L133 ? v356 : ID__srcl__decode__L113);
assign v359 = v357;
assign v360 = v358;
assign ID__imm__decode__L134 = v359;
assign ID__len_bytes__decode__L134 = v353;
assign ID__op__decode__L134 = v354;
assign ID__srcl__decode__L134 = v360;
assign ID__srcr__decode__L134 = v355;
assign v361 = (v327 == v151);
assign v362 = (ID__in16__decode__L68 & v361);
assign v363 = v362;
assign ID__cond__decode__L141 = v363;
assign v364 = (ID__cond__decode__L141 ? v168 : ID__len_bytes__decode__L134);
assign v365 = (ID__cond__decode__L141 ? v150 : ID__op__decode__L134);
assign ID__srcl__decode__L145 = ID__rs16__decode__L100;
assign ID__imm__decode__L146 = ID__simm5_11_s64__decode__L104;
assign v366 = {{1{1'b0}}, ID__srcl__decode__L145};
assign v367 = (ID__cond__decode__L141 ? ID__imm__decode__L146 : ID__imm__decode__L134);
assign v368 = (ID__cond__decode__L141 ? v366 : ID__srcl__decode__L134);
assign v369 = v367;
assign v370 = v368;
assign ID__imm__decode__L142 = v369;
assign ID__len_bytes__decode__L142 = v364;
assign ID__op__decode__L142 = v365;
assign ID__srcl__decode__L142 = v370;
assign v371 = (v327 == v149);
assign v372 = (ID__in16__decode__L68 & v371);
assign v373 = v372;
assign ID__cond__decode__L148 = v373;
assign v374 = (ID__cond__decode__L148 ? v168 : ID__len_bytes__decode__L142);
assign v375 = (ID__cond__decode__L148 ? v148 : ID__op__decode__L142);
assign ID__regdst__decode__L152 = ID__rd16__decode__L99;
assign ID__srcl__decode__L153 = ID__rs16__decode__L100;
assign v376 = {{1{1'b0}}, ID__regdst__decode__L152};
assign v377 = {{1{1'b0}}, ID__srcl__decode__L153};
assign v378 = (ID__cond__decode__L148 ? v376 : ID__regdst__decode__L127);
assign v379 = (ID__cond__decode__L148 ? v377 : ID__srcl__decode__L142);
assign v380 = v378;
assign v381 = v379;
assign ID__len_bytes__decode__L149 = v374;
assign ID__op__decode__L149 = v375;
assign ID__regdst__decode__L149 = v380;
assign ID__srcl__decode__L149 = v381;
assign v382 = (v327 == v147);
assign v383 = (ID__in16__decode__L68 & v382);
assign v384 = v383;
assign ID__cond__decode__L155 = v384;
assign v385 = (ID__cond__decode__L155 ? v168 : ID__len_bytes__decode__L149);
assign v386 = (ID__cond__decode__L155 ? v146 : ID__op__decode__L149);
assign ID__srcl__decode__L159 = ID__rs16__decode__L100;
assign ID__srcr__decode__L160 = ID__rd16__decode__L99;
assign v387 = {{1{1'b0}}, ID__srcl__decode__L159};
assign v388 = {{1{1'b0}}, ID__srcr__decode__L160};
assign v389 = (ID__cond__decode__L155 ? v387 : ID__srcl__decode__L149);
assign v390 = (ID__cond__decode__L155 ? v388 : ID__srcr__decode__L134);
assign v391 = v389;
assign v392 = v390;
assign ID__len_bytes__decode__L156 = v385;
assign ID__op__decode__L156 = v386;
assign ID__srcl__decode__L156 = v391;
assign ID__srcr__decode__L156 = v392;
assign v393 = (v339 == v145);
assign v394 = (ID__in16__decode__L68 & v393);
assign v395 = v394;
assign ID__cond__decode__L162 = v395;
assign v396 = (ID__cond__decode__L162 ? v168 : ID__len_bytes__decode__L156);
assign v397 = (ID__cond__decode__L162 ? v152 : ID__op__decode__L156);
assign ID__srcl__decode__L166 = ID__rs16__decode__L100;
assign v398 = {{1{1'b0}}, ID__srcl__decode__L166};
assign v399 = (ID__cond__decode__L162 ? v398 : ID__srcl__decode__L156);
assign v400 = v399;
assign ID__len_bytes__decode__L163 = v396;
assign ID__op__decode__L163 = v397;
assign ID__srcl__decode__L163 = v400;
assign v401 = (ID__insn16__decode__L59 & v144);
assign v402 = (v401 == v143);
assign v403 = (ID__in16__decode__L68 & v402);
assign v404 = v403;
assign ID__cond__decode__L168 = v404;
assign v405 = (ID__cond__decode__L168 ? v168 : ID__len_bytes__decode__L163);
assign v406 = (ID__cond__decode__L168 ? v142 : ID__op__decode__L163);
assign v407 = (ID__simm12_s64_c__decode__L106 << 1);
assign ID__imm__decode__L172 = v407;
pyc_mux #(.WIDTH(64)) v408_inst (
  .sel(ID__cond__decode__L168),
  .a(ID__imm__decode__L172),
  .b(ID__imm__decode__L142),
  .y(v408)
);
assign ID__imm__decode__L169 = v408;
assign ID__len_bytes__decode__L169 = v405;
assign ID__op__decode__L169 = v406;
assign v409 = (ID__insn16__decode__L59 & v141);
assign v410 = (v409 == v140);
assign v411 = (ID__in16__decode__L68 & v410);
assign v412 = v411;
assign ID__cond__decode__L174 = v412;
assign v413 = (ID__cond__decode__L174 ? v168 : ID__len_bytes__decode__L169);
assign v414 = (ID__cond__decode__L174 ? v139 : ID__op__decode__L169);
assign ID__imm__decode__L178 = ID__brtype__decode__L108;
assign v415 = {{61{1'b0}}, ID__imm__decode__L178};
assign v416 = (ID__cond__decode__L174 ? v415 : ID__imm__decode__L169);
assign v417 = v416;
assign ID__imm__decode__L175 = v417;
assign ID__len_bytes__decode__L175 = v413;
assign ID__op__decode__L175 = v414;
assign v418 = (ID__insn16__decode__L59 & v138);
assign v419 = (v418 == v140);
assign v420 = (ID__in16__decode__L68 & v419);
assign v421 = v420;
assign ID__cond__decode__L180 = v421;
assign v422 = (ID__cond__decode__L180 ? v168 : ID__len_bytes__decode__L175);
assign v423 = (ID__cond__decode__L180 ? v137 : ID__op__decode__L175);
assign ID__len_bytes__decode__L181 = v422;
assign ID__op__decode__L181 = v423;
assign v424 = (ID__insn32__decode__L60 & v136);
assign v425 = (v424 == v135);
assign v426 = (ID__in32__decode__L67 & v425);
assign v427 = v424;
assign v428 = v426;
assign ID__cond__decode__L186 = v428;
assign v429 = (ID__cond__decode__L186 ? v166 : ID__len_bytes__decode__L181);
assign v430 = (ID__cond__decode__L186 ? v134 : ID__op__decode__L181);
assign ID__regdst__decode__L190 = ID__rd32__decode__L70;
assign ID__srcl__decode__L191 = ID__rs1_32__decode__L71;
assign ID__srcr__decode__L192 = ID__rs2_32__decode__L72;
assign v431 = {{1{1'b0}}, ID__regdst__decode__L190};
assign v432 = {{1{1'b0}}, ID__srcl__decode__L191};
assign v433 = {{1{1'b0}}, ID__srcr__decode__L192};
assign v434 = (ID__cond__decode__L186 ? v431 : ID__regdst__decode__L149);
assign v435 = (ID__cond__decode__L186 ? v432 : ID__srcl__decode__L163);
assign v436 = (ID__cond__decode__L186 ? v433 : ID__srcr__decode__L156);
assign v437 = v434;
assign v438 = v435;
assign v439 = v436;
assign ID__len_bytes__decode__L187 = v429;
assign ID__op__decode__L187 = v430;
assign ID__regdst__decode__L187 = v437;
assign ID__srcl__decode__L187 = v438;
assign ID__srcr__decode__L187 = v439;
assign v440 = (v427 == v133);
assign v441 = (ID__in32__decode__L67 & v440);
assign v442 = v441;
assign ID__cond__decode__L194 = v442;
assign v443 = (ID__cond__decode__L194 ? v166 : ID__len_bytes__decode__L187);
assign v444 = (ID__cond__decode__L194 ? v132 : ID__op__decode__L187);
assign ID__regdst__decode__L198 = ID__rd32__decode__L70;
assign ID__srcl__decode__L199 = ID__rs1_32__decode__L71;
assign ID__srcr__decode__L200 = ID__rs2_32__decode__L72;
assign v445 = {{1{1'b0}}, ID__regdst__decode__L198};
assign v446 = {{1{1'b0}}, ID__srcl__decode__L199};
assign v447 = {{1{1'b0}}, ID__srcr__decode__L200};
assign v448 = (ID__cond__decode__L194 ? v445 : ID__regdst__decode__L187);
assign v449 = (ID__cond__decode__L194 ? v446 : ID__srcl__decode__L187);
assign v450 = (ID__cond__decode__L194 ? v447 : ID__srcr__decode__L187);
assign v451 = v448;
assign v452 = v449;
assign v453 = v450;
assign ID__len_bytes__decode__L195 = v443;
assign ID__op__decode__L195 = v444;
assign ID__regdst__decode__L195 = v451;
assign ID__srcl__decode__L195 = v452;
assign ID__srcr__decode__L195 = v453;
assign v454 = (v427 == v131);
assign v455 = (ID__in32__decode__L67 & v454);
assign v456 = v455;
assign ID__cond__decode__L202 = v456;
assign v457 = (ID__cond__decode__L202 ? v166 : ID__len_bytes__decode__L195);
assign v458 = (ID__cond__decode__L202 ? v130 : ID__op__decode__L195);
assign ID__regdst__decode__L206 = ID__rd32__decode__L70;
assign ID__srcl__decode__L207 = ID__rs1_32__decode__L71;
assign ID__srcr__decode__L208 = ID__rs2_32__decode__L72;
assign v459 = {{1{1'b0}}, ID__regdst__decode__L206};
assign v460 = {{1{1'b0}}, ID__srcl__decode__L207};
assign v461 = {{1{1'b0}}, ID__srcr__decode__L208};
assign v462 = (ID__cond__decode__L202 ? v459 : ID__regdst__decode__L195);
assign v463 = (ID__cond__decode__L202 ? v460 : ID__srcl__decode__L195);
assign v464 = (ID__cond__decode__L202 ? v461 : ID__srcr__decode__L195);
assign v465 = v462;
assign v466 = v463;
assign v467 = v464;
assign ID__len_bytes__decode__L203 = v457;
assign ID__op__decode__L203 = v458;
assign ID__regdst__decode__L203 = v465;
assign ID__srcl__decode__L203 = v466;
assign ID__srcr__decode__L203 = v467;
assign v468 = (v427 == v129);
assign v469 = (ID__in32__decode__L67 & v468);
assign v470 = v469;
assign ID__cond__decode__L210 = v470;
assign v471 = (ID__cond__decode__L210 ? v166 : ID__len_bytes__decode__L203);
assign v472 = (ID__cond__decode__L210 ? v128 : ID__op__decode__L203);
assign ID__regdst__decode__L214 = ID__rd32__decode__L70;
assign ID__srcl__decode__L215 = ID__rs1_32__decode__L71;
assign ID__srcr__decode__L216 = ID__rs2_32__decode__L72;
assign v473 = {{1{1'b0}}, ID__regdst__decode__L214};
assign v474 = {{1{1'b0}}, ID__srcl__decode__L215};
assign v475 = {{1{1'b0}}, ID__srcr__decode__L216};
assign v476 = (ID__cond__decode__L210 ? v473 : ID__regdst__decode__L203);
assign v477 = (ID__cond__decode__L210 ? v474 : ID__srcl__decode__L203);
assign v478 = (ID__cond__decode__L210 ? v475 : ID__srcr__decode__L203);
assign v479 = v476;
assign v480 = v477;
assign v481 = v478;
assign ID__len_bytes__decode__L211 = v471;
assign ID__op__decode__L211 = v472;
assign ID__regdst__decode__L211 = v479;
assign ID__srcl__decode__L211 = v480;
assign ID__srcr__decode__L211 = v481;
assign v482 = (v427 == v127);
assign v483 = (ID__in32__decode__L67 & v482);
assign v484 = v483;
assign ID__cond__decode__L218 = v484;
assign v485 = (ID__cond__decode__L218 ? v166 : ID__len_bytes__decode__L211);
assign v486 = (ID__cond__decode__L218 ? v126 : ID__op__decode__L211);
assign ID__regdst__decode__L222 = ID__rd32__decode__L70;
assign ID__srcl__decode__L223 = ID__rs1_32__decode__L71;
assign ID__srcr__decode__L224 = ID__rs2_32__decode__L72;
assign ID__srcp__decode__L225 = ID__srcp_32__decode__L73;
assign v487 = {{1{1'b0}}, ID__regdst__decode__L222};
assign v488 = {{1{1'b0}}, ID__srcl__decode__L223};
assign v489 = {{1{1'b0}}, ID__srcp__decode__L225};
assign v490 = {{1{1'b0}}, ID__srcr__decode__L224};
assign v491 = (ID__cond__decode__L218 ? v487 : ID__regdst__decode__L211);
assign v492 = (ID__cond__decode__L218 ? v488 : ID__srcl__decode__L211);
assign v493 = (ID__cond__decode__L218 ? v489 : ID__srcp__decode__L115);
assign v494 = (ID__cond__decode__L218 ? v490 : ID__srcr__decode__L211);
assign v495 = v491;
assign v496 = v492;
assign v497 = v493;
assign v498 = v494;
assign ID__len_bytes__decode__L219 = v485;
assign ID__op__decode__L219 = v486;
assign ID__regdst__decode__L219 = v495;
assign ID__srcl__decode__L219 = v496;
assign ID__srcp__decode__L219 = v497;
assign ID__srcr__decode__L219 = v498;
assign v499 = (v427 == v125);
assign v500 = (ID__in32__decode__L67 & v499);
assign v501 = v500;
assign ID__cond__decode__L227 = v501;
assign v502 = (ID__cond__decode__L227 ? v166 : ID__len_bytes__decode__L219);
assign v503 = (ID__cond__decode__L227 ? v155 : ID__op__decode__L219);
assign ID__srcl__decode__L231 = ID__rs1_32__decode__L71;
assign ID__srcr__decode__L232 = ID__rs2_32__decode__L72;
assign ID__imm__decode__L233 = ID__simm12_s64__decode__L84;
assign v504 = {{1{1'b0}}, ID__srcl__decode__L231};
assign v505 = {{1{1'b0}}, ID__srcr__decode__L232};
assign v506 = (ID__cond__decode__L227 ? ID__imm__decode__L233 : ID__imm__decode__L175);
assign v507 = (ID__cond__decode__L227 ? v504 : ID__srcl__decode__L219);
assign v508 = (ID__cond__decode__L227 ? v505 : ID__srcr__decode__L219);
assign v509 = v506;
assign v510 = v507;
assign v511 = v508;
assign ID__imm__decode__L228 = v509;
assign ID__len_bytes__decode__L228 = v502;
assign ID__op__decode__L228 = v503;
assign ID__srcl__decode__L228 = v510;
assign ID__srcr__decode__L228 = v511;
assign v512 = (v427 == v124);
assign v513 = (ID__in32__decode__L67 & v512);
assign v514 = v513;
assign ID__cond__decode__L235 = v514;
assign v515 = (ID__cond__decode__L235 ? v166 : ID__len_bytes__decode__L228);
assign v516 = (ID__cond__decode__L235 ? v123 : ID__op__decode__L228);
assign ID__srcl__decode__L239 = ID__rs1_32__decode__L71;
assign ID__srcr__decode__L240 = ID__rs2_32__decode__L72;
assign ID__imm__decode__L241 = ID__simm12_s64__decode__L84;
assign v517 = {{1{1'b0}}, ID__srcl__decode__L239};
assign v518 = {{1{1'b0}}, ID__srcr__decode__L240};
assign v519 = (ID__cond__decode__L235 ? ID__imm__decode__L241 : ID__imm__decode__L228);
assign v520 = (ID__cond__decode__L235 ? v517 : ID__srcl__decode__L228);
assign v521 = (ID__cond__decode__L235 ? v518 : ID__srcr__decode__L228);
assign v522 = v519;
assign v523 = v520;
assign v524 = v521;
assign ID__imm__decode__L236 = v522;
assign ID__len_bytes__decode__L236 = v515;
assign ID__op__decode__L236 = v516;
assign ID__srcl__decode__L236 = v523;
assign ID__srcr__decode__L236 = v524;
assign v525 = (v427 == v122);
assign v526 = (ID__in32__decode__L67 & v525);
assign v527 = v526;
assign ID__cond__decode__L243 = v527;
assign v528 = (ID__cond__decode__L243 ? v166 : ID__len_bytes__decode__L236);
assign v529 = (ID__cond__decode__L243 ? v121 : ID__op__decode__L236);
assign ID__regdst__decode__L247 = ID__rd32__decode__L70;
assign ID__srcl__decode__L248 = ID__rs1_32__decode__L71;
assign ID__imm__decode__L249 = ID__imm12_s64__decode__L76;
assign v530 = {{1{1'b0}}, ID__regdst__decode__L247};
assign v531 = {{1{1'b0}}, ID__srcl__decode__L248};
assign v532 = (ID__cond__decode__L243 ? ID__imm__decode__L249 : ID__imm__decode__L236);
assign v533 = (ID__cond__decode__L243 ? v530 : ID__regdst__decode__L219);
assign v534 = (ID__cond__decode__L243 ? v531 : ID__srcl__decode__L236);
assign v535 = v532;
assign v536 = v533;
assign v537 = v534;
assign ID__imm__decode__L244 = v535;
assign ID__len_bytes__decode__L244 = v528;
assign ID__op__decode__L244 = v529;
assign ID__regdst__decode__L244 = v536;
assign ID__srcl__decode__L244 = v537;
assign v538 = (v427 == v120);
assign v539 = (ID__in32__decode__L67 & v538);
assign v540 = v539;
assign ID__cond__decode__L251 = v540;
assign v541 = (ID__cond__decode__L251 ? v166 : ID__len_bytes__decode__L244);
assign v542 = (ID__cond__decode__L251 ? v119 : ID__op__decode__L244);
assign ID__regdst__decode__L255 = ID__rd32__decode__L70;
assign ID__srcl__decode__L256 = ID__rs1_32__decode__L71;
assign ID__imm__decode__L257 = ID__imm12_u64__decode__L75;
assign v543 = {{52{1'b0}}, ID__imm__decode__L257};
assign v544 = {{1{1'b0}}, ID__regdst__decode__L255};
assign v545 = {{1{1'b0}}, ID__srcl__decode__L256};
assign v546 = (ID__cond__decode__L251 ? v543 : ID__imm__decode__L244);
assign v547 = (ID__cond__decode__L251 ? v544 : ID__regdst__decode__L244);
assign v548 = (ID__cond__decode__L251 ? v545 : ID__srcl__decode__L244);
assign v549 = v546;
assign v550 = v547;
assign v551 = v548;
assign ID__imm__decode__L252 = v549;
assign ID__len_bytes__decode__L252 = v541;
assign ID__op__decode__L252 = v542;
assign ID__regdst__decode__L252 = v550;
assign ID__srcl__decode__L252 = v551;
assign v552 = (v427 == v118);
assign v553 = (ID__in32__decode__L67 & v552);
assign v554 = v553;
assign ID__cond__decode__L259 = v554;
assign v555 = (ID__cond__decode__L259 ? v166 : ID__len_bytes__decode__L252);
assign v556 = (ID__cond__decode__L259 ? v117 : ID__op__decode__L252);
assign ID__regdst__decode__L263 = ID__rd32__decode__L70;
assign ID__srcl__decode__L264 = ID__rs1_32__decode__L71;
assign ID__imm__decode__L265 = ID__imm12_u64__decode__L75;
assign v557 = {{52{1'b0}}, ID__imm__decode__L265};
assign v558 = {{1{1'b0}}, ID__regdst__decode__L263};
assign v559 = {{1{1'b0}}, ID__srcl__decode__L264};
assign v560 = (ID__cond__decode__L259 ? v557 : ID__imm__decode__L252);
assign v561 = (ID__cond__decode__L259 ? v558 : ID__regdst__decode__L252);
assign v562 = (ID__cond__decode__L259 ? v559 : ID__srcl__decode__L252);
assign v563 = v560;
assign v564 = v561;
assign v565 = v562;
assign ID__imm__decode__L260 = v563;
assign ID__len_bytes__decode__L260 = v555;
assign ID__op__decode__L260 = v556;
assign ID__regdst__decode__L260 = v564;
assign ID__srcl__decode__L260 = v565;
assign v566 = (v427 == v116);
assign v567 = (ID__in32__decode__L67 & v566);
assign v568 = v567;
assign ID__cond__decode__L267 = v568;
assign v569 = (ID__cond__decode__L267 ? v166 : ID__len_bytes__decode__L260);
assign v570 = (ID__cond__decode__L267 ? v115 : ID__op__decode__L260);
assign ID__regdst__decode__L271 = ID__rd32__decode__L70;
assign ID__srcl__decode__L272 = ID__rs1_32__decode__L71;
assign ID__imm__decode__L273 = ID__imm12_u64__decode__L75;
assign v571 = {{52{1'b0}}, ID__imm__decode__L273};
assign v572 = {{1{1'b0}}, ID__regdst__decode__L271};
assign v573 = {{1{1'b0}}, ID__srcl__decode__L272};
assign v574 = (ID__cond__decode__L267 ? v571 : ID__imm__decode__L260);
assign v575 = (ID__cond__decode__L267 ? v572 : ID__regdst__decode__L260);
assign v576 = (ID__cond__decode__L267 ? v573 : ID__srcl__decode__L260);
assign v577 = v574;
assign v578 = v575;
assign v579 = v576;
assign ID__imm__decode__L268 = v577;
assign ID__len_bytes__decode__L268 = v569;
assign ID__op__decode__L268 = v570;
assign ID__regdst__decode__L268 = v578;
assign ID__srcl__decode__L268 = v579;
assign v580 = (ID__insn32__decode__L60 & v114);
assign v581 = (v580 == v113);
assign v582 = (ID__in32__decode__L67 & v581);
assign v583 = v582;
assign ID__cond__decode__L275 = v583;
assign v584 = (ID__cond__decode__L275 ? v166 : ID__len_bytes__decode__L268);
assign v585 = (ID__cond__decode__L275 ? v112 : ID__op__decode__L268);
assign ID__regdst__decode__L279 = ID__rd32__decode__L70;
assign ID__srcl__decode__L280 = ID__rs1_32__decode__L71;
assign ID__srcr__decode__L281 = ID__rs2_32__decode__L72;
assign v586 = {{1{1'b0}}, ID__regdst__decode__L279};
assign v587 = {{1{1'b0}}, ID__srcl__decode__L280};
assign v588 = {{1{1'b0}}, ID__srcr__decode__L281};
assign v589 = (ID__cond__decode__L275 ? v586 : ID__regdst__decode__L268);
assign v590 = (ID__cond__decode__L275 ? v587 : ID__srcl__decode__L268);
assign v591 = (ID__cond__decode__L275 ? v588 : ID__srcr__decode__L236);
assign v592 = v589;
assign v593 = v590;
assign v594 = v591;
assign ID__len_bytes__decode__L276 = v584;
assign ID__op__decode__L276 = v585;
assign ID__regdst__decode__L276 = v592;
assign ID__srcl__decode__L276 = v593;
assign ID__srcr__decode__L276 = v594;
assign v595 = (ID__insn32__decode__L60 & v111);
assign v596 = (v595 == v110);
assign v597 = (ID__in32__decode__L67 & v596);
assign v598 = v597;
assign ID__cond__decode__L283 = v598;
assign v599 = (ID__cond__decode__L283 ? v166 : ID__len_bytes__decode__L276);
assign v600 = (ID__cond__decode__L283 ? v165 : ID__op__decode__L276);
assign ID__len_bytes__decode__L284 = v599;
assign ID__op__decode__L284 = v600;
assign v601 = (ID__insn32__decode__L60 & v109);
assign v602 = (v601 == v108);
assign v603 = (ID__in32__decode__L67 & v602);
assign v604 = v603;
assign ID__cond__decode__L288 = v604;
assign v605 = (ID__cond__decode__L288 ? v166 : ID__len_bytes__decode__L284);
assign v606 = (ID__cond__decode__L288 ? v107 : ID__op__decode__L284);
assign ID__regdst__decode__L292 = ID__rd32__decode__L70;
assign v607 = (ID__imm20_s64__decode__L78 << 12);
assign ID__imm__decode__L293 = v607;
assign v608 = {{1{1'b0}}, ID__regdst__decode__L292};
assign v609 = (ID__cond__decode__L288 ? ID__imm__decode__L293 : ID__imm__decode__L268);
assign v610 = (ID__cond__decode__L288 ? v608 : ID__regdst__decode__L276);
assign v611 = v609;
assign v612 = v610;
assign ID__imm__decode__L289 = v611;
assign ID__len_bytes__decode__L289 = v605;
assign ID__op__decode__L289 = v606;
assign ID__regdst__decode__L289 = v612;
assign v613 = (ID__insn32__decode__L60 & v106);
assign v614 = (v613 == v105);
assign v615 = (ID__in32__decode__L67 & v614);
assign v616 = v615;
assign ID__cond__decode__L295 = v616;
assign v617 = (ID__cond__decode__L295 ? v166 : ID__len_bytes__decode__L289);
assign v618 = (ID__cond__decode__L295 ? v104 : ID__op__decode__L289);
assign v619 = (ID__simm17_s64__decode__L85 << 1);
assign ID__imm__decode__L299 = v619;
pyc_mux #(.WIDTH(64)) v620_inst (
  .sel(ID__cond__decode__L295),
  .a(ID__imm__decode__L299),
  .b(ID__imm__decode__L289),
  .y(v620)
);
assign ID__imm__decode__L296 = v620;
assign ID__len_bytes__decode__L296 = v617;
assign ID__op__decode__L296 = v618;
assign v621 = (ID__insn48__decode__L61 & v103);
assign v622 = (v621 == v102);
assign v623 = (ID__is_hl__decode__L64 & v622);
assign v624 = v623;
assign ID__cond__decode__L302 = v624;
assign v625 = (ID__cond__decode__L302 ? v101 : ID__len_bytes__decode__L296);
assign v626 = (ID__cond__decode__L302 ? v100 : ID__op__decode__L296);
assign ID__regdst__decode__L306 = ID__rd_hl__decode__L96;
assign ID__imm__decode__L307 = ID__imm_hl_lui__decode__L94;
assign v627 = {{1{1'b0}}, ID__regdst__decode__L306};
assign v628 = (ID__cond__decode__L302 ? ID__imm__decode__L307 : ID__imm__decode__L296);
assign v629 = (ID__cond__decode__L302 ? v627 : ID__regdst__decode__L289);
assign v630 = v628;
assign v631 = v629;
assign ID__imm__decode__L303 = v630;
assign ID__len_bytes__decode__L303 = v625;
assign ID__op__decode__L303 = v626;
assign ID__regdst__decode__L303 = v631;
assign ID__op__id_stage__L21 = ID__op__decode__L303;
assign ID__len_bytes__id_stage__L22 = ID__len_bytes__decode__L303;
assign ID__regdst__id_stage__L23 = ID__regdst__decode__L303;
assign ID__srcl__id_stage__L24 = ID__srcl__decode__L276;
assign ID__srcr__id_stage__L25 = ID__srcr__decode__L276;
assign ID__srcp__id_stage__L26 = ID__srcp__decode__L219;
assign ID__imm__id_stage__L27 = ID__imm__decode__L303;
pyc_mux #(.WIDTH(6)) v632_inst (
  .sel(do_id__linx_cpu_pyc__L104),
  .a(ID__op__id_stage__L21),
  .b(idex__op),
  .y(v632)
);
assign idex__op__next = v632;
pyc_mux #(.WIDTH(3)) v633_inst (
  .sel(do_id__linx_cpu_pyc__L104),
  .a(ID__len_bytes__id_stage__L22),
  .b(idex__len_bytes),
  .y(v633)
);
assign idex__len_bytes__next = v633;
pyc_mux #(.WIDTH(6)) v634_inst (
  .sel(do_id__linx_cpu_pyc__L104),
  .a(ID__regdst__id_stage__L23),
  .b(idex__regdst),
  .y(v634)
);
assign idex__regdst__next = v634;
pyc_mux #(.WIDTH(6)) v635_inst (
  .sel(do_id__linx_cpu_pyc__L104),
  .a(ID__srcl__id_stage__L24),
  .b(idex__srcl),
  .y(v635)
);
assign idex__srcl__next = v635;
pyc_mux #(.WIDTH(6)) v636_inst (
  .sel(do_id__linx_cpu_pyc__L104),
  .a(ID__srcr__id_stage__L25),
  .b(idex__srcr),
  .y(v636)
);
assign idex__srcr__next = v636;
pyc_mux #(.WIDTH(6)) v637_inst (
  .sel(do_id__linx_cpu_pyc__L104),
  .a(ID__srcp__id_stage__L26),
  .b(idex__srcp),
  .y(v637)
);
assign idex__srcp__next = v637;
pyc_mux #(.WIDTH(64)) v638_inst (
  .sel(do_id__linx_cpu_pyc__L104),
  .a(ID__imm__id_stage__L27),
  .b(idex__imm),
  .y(v638)
);
assign idex__imm__next = v638;
assign v639 = (ID__srcl__id_stage__L24 == v175);
assign v640 = (v639 ? v173 : v173);
assign v641 = (ID__srcl__id_stage__L24 == v139);
assign v642 = (v641 ? gpr__r1 : v640);
assign v643 = (ID__srcl__id_stage__L24 == v137);
assign v644 = (v643 ? gpr__r2 : v642);
assign v645 = (ID__srcl__id_stage__L24 == v148);
assign v646 = (v645 ? gpr__r3 : v644);
assign v647 = (ID__srcl__id_stage__L24 == v150);
assign v648 = (v647 ? gpr__r4 : v646);
assign v649 = (ID__srcl__id_stage__L24 == v153);
assign v650 = (v649 ? gpr__r5 : v648);
assign v651 = (ID__srcl__id_stage__L24 == v115);
assign v652 = (v651 ? gpr__r6 : v650);
assign v653 = (ID__srcl__id_stage__L24 == v117);
assign v654 = (v653 ? gpr__r7 : v652);
assign v655 = (ID__srcl__id_stage__L24 == v119);
assign v656 = (v655 ? gpr__r8 : v654);
assign v657 = (ID__srcl__id_stage__L24 == v121);
assign v658 = (v657 ? gpr__r9 : v656);
assign v659 = (ID__srcl__id_stage__L24 == v155);
assign v660 = (v659 ? gpr__r10 : v658);
assign v661 = (ID__srcl__id_stage__L24 == v128);
assign v662 = (v661 ? gpr__r11 : v660);
assign v663 = (ID__srcl__id_stage__L24 == v130);
assign v664 = (v663 ? gpr__r12 : v662);
assign v665 = (ID__srcl__id_stage__L24 == v132);
assign v666 = (v665 ? gpr__r13 : v664);
assign v667 = (ID__srcl__id_stage__L24 == v134);
assign v668 = (v667 ? gpr__r14 : v666);
assign v669 = (ID__srcl__id_stage__L24 == v112);
assign v670 = (v669 ? gpr__r15 : v668);
assign v671 = (ID__srcl__id_stage__L24 == v126);
assign v672 = (v671 ? gpr__r16 : v670);
assign v673 = (ID__srcl__id_stage__L24 == v100);
assign v674 = (v673 ? gpr__r17 : v672);
assign v675 = (ID__srcl__id_stage__L24 == v165);
assign v676 = (v675 ? gpr__r18 : v674);
assign v677 = (ID__srcl__id_stage__L24 == v142);
assign v678 = (v677 ? gpr__r19 : v676);
assign v679 = (ID__srcl__id_stage__L24 == v104);
assign v680 = (v679 ? gpr__r20 : v678);
assign v681 = (ID__srcl__id_stage__L24 == v159);
assign v682 = (v681 ? gpr__r21 : v680);
assign v683 = (ID__srcl__id_stage__L24 == v156);
assign v684 = (v683 ? gpr__r22 : v682);
assign v685 = (ID__srcl__id_stage__L24 == v146);
assign v686 = (v685 ? gpr__r23 : v684);
assign v687 = (ID__srcl__id_stage__L24 == v152);
assign v688 = (v687 ? t__r0 : v686);
assign v689 = (ID__srcl__id_stage__L24 == v107);
assign v690 = (v689 ? t__r1 : v688);
assign v691 = (ID__srcl__id_stage__L24 == v123);
assign v692 = (v691 ? t__r2 : v690);
assign v693 = (ID__srcl__id_stage__L24 == v99);
assign v694 = (v693 ? t__r3 : v692);
assign v695 = (ID__srcl__id_stage__L24 == v98);
assign v696 = (v695 ? u__r0 : v694);
assign v697 = (ID__srcl__id_stage__L24 == v97);
assign v698 = (v697 ? u__r1 : v696);
assign v699 = (ID__srcl__id_stage__L24 == v96);
assign v700 = (v699 ? u__r2 : v698);
assign v701 = (ID__srcl__id_stage__L24 == v95);
assign v702 = (v701 ? u__r3 : v700);
assign v703 = v702;
assign ID__srcl_val__id_stage__L38 = v703;
assign v704 = (ID__srcr__id_stage__L25 == v175);
assign v705 = (v704 ? v173 : v173);
assign v706 = (ID__srcr__id_stage__L25 == v139);
assign v707 = (v706 ? gpr__r1 : v705);
assign v708 = (ID__srcr__id_stage__L25 == v137);
assign v709 = (v708 ? gpr__r2 : v707);
assign v710 = (ID__srcr__id_stage__L25 == v148);
assign v711 = (v710 ? gpr__r3 : v709);
assign v712 = (ID__srcr__id_stage__L25 == v150);
assign v713 = (v712 ? gpr__r4 : v711);
assign v714 = (ID__srcr__id_stage__L25 == v153);
assign v715 = (v714 ? gpr__r5 : v713);
assign v716 = (ID__srcr__id_stage__L25 == v115);
assign v717 = (v716 ? gpr__r6 : v715);
assign v718 = (ID__srcr__id_stage__L25 == v117);
assign v719 = (v718 ? gpr__r7 : v717);
assign v720 = (ID__srcr__id_stage__L25 == v119);
assign v721 = (v720 ? gpr__r8 : v719);
assign v722 = (ID__srcr__id_stage__L25 == v121);
assign v723 = (v722 ? gpr__r9 : v721);
assign v724 = (ID__srcr__id_stage__L25 == v155);
assign v725 = (v724 ? gpr__r10 : v723);
assign v726 = (ID__srcr__id_stage__L25 == v128);
assign v727 = (v726 ? gpr__r11 : v725);
assign v728 = (ID__srcr__id_stage__L25 == v130);
assign v729 = (v728 ? gpr__r12 : v727);
assign v730 = (ID__srcr__id_stage__L25 == v132);
assign v731 = (v730 ? gpr__r13 : v729);
assign v732 = (ID__srcr__id_stage__L25 == v134);
assign v733 = (v732 ? gpr__r14 : v731);
assign v734 = (ID__srcr__id_stage__L25 == v112);
assign v735 = (v734 ? gpr__r15 : v733);
assign v736 = (ID__srcr__id_stage__L25 == v126);
assign v737 = (v736 ? gpr__r16 : v735);
assign v738 = (ID__srcr__id_stage__L25 == v100);
assign v739 = (v738 ? gpr__r17 : v737);
assign v740 = (ID__srcr__id_stage__L25 == v165);
assign v741 = (v740 ? gpr__r18 : v739);
assign v742 = (ID__srcr__id_stage__L25 == v142);
assign v743 = (v742 ? gpr__r19 : v741);
assign v744 = (ID__srcr__id_stage__L25 == v104);
assign v745 = (v744 ? gpr__r20 : v743);
assign v746 = (ID__srcr__id_stage__L25 == v159);
assign v747 = (v746 ? gpr__r21 : v745);
assign v748 = (ID__srcr__id_stage__L25 == v156);
assign v749 = (v748 ? gpr__r22 : v747);
assign v750 = (ID__srcr__id_stage__L25 == v146);
assign v751 = (v750 ? gpr__r23 : v749);
assign v752 = (ID__srcr__id_stage__L25 == v152);
assign v753 = (v752 ? t__r0 : v751);
assign v754 = (ID__srcr__id_stage__L25 == v107);
assign v755 = (v754 ? t__r1 : v753);
assign v756 = (ID__srcr__id_stage__L25 == v123);
assign v757 = (v756 ? t__r2 : v755);
assign v758 = (ID__srcr__id_stage__L25 == v99);
assign v759 = (v758 ? t__r3 : v757);
assign v760 = (ID__srcr__id_stage__L25 == v98);
assign v761 = (v760 ? u__r0 : v759);
assign v762 = (ID__srcr__id_stage__L25 == v97);
assign v763 = (v762 ? u__r1 : v761);
assign v764 = (ID__srcr__id_stage__L25 == v96);
assign v765 = (v764 ? u__r2 : v763);
assign v766 = (ID__srcr__id_stage__L25 == v95);
assign v767 = (v766 ? u__r3 : v765);
assign v768 = v767;
assign ID__srcr_val__id_stage__L39 = v768;
assign v769 = (ID__srcp__id_stage__L26 == v175);
assign v770 = (v769 ? v173 : v173);
assign v771 = (ID__srcp__id_stage__L26 == v139);
assign v772 = (v771 ? gpr__r1 : v770);
assign v773 = (ID__srcp__id_stage__L26 == v137);
assign v774 = (v773 ? gpr__r2 : v772);
assign v775 = (ID__srcp__id_stage__L26 == v148);
assign v776 = (v775 ? gpr__r3 : v774);
assign v777 = (ID__srcp__id_stage__L26 == v150);
assign v778 = (v777 ? gpr__r4 : v776);
assign v779 = (ID__srcp__id_stage__L26 == v153);
assign v780 = (v779 ? gpr__r5 : v778);
assign v781 = (ID__srcp__id_stage__L26 == v115);
assign v782 = (v781 ? gpr__r6 : v780);
assign v783 = (ID__srcp__id_stage__L26 == v117);
assign v784 = (v783 ? gpr__r7 : v782);
assign v785 = (ID__srcp__id_stage__L26 == v119);
assign v786 = (v785 ? gpr__r8 : v784);
assign v787 = (ID__srcp__id_stage__L26 == v121);
assign v788 = (v787 ? gpr__r9 : v786);
assign v789 = (ID__srcp__id_stage__L26 == v155);
assign v790 = (v789 ? gpr__r10 : v788);
assign v791 = (ID__srcp__id_stage__L26 == v128);
assign v792 = (v791 ? gpr__r11 : v790);
assign v793 = (ID__srcp__id_stage__L26 == v130);
assign v794 = (v793 ? gpr__r12 : v792);
assign v795 = (ID__srcp__id_stage__L26 == v132);
assign v796 = (v795 ? gpr__r13 : v794);
assign v797 = (ID__srcp__id_stage__L26 == v134);
assign v798 = (v797 ? gpr__r14 : v796);
assign v799 = (ID__srcp__id_stage__L26 == v112);
assign v800 = (v799 ? gpr__r15 : v798);
assign v801 = (ID__srcp__id_stage__L26 == v126);
assign v802 = (v801 ? gpr__r16 : v800);
assign v803 = (ID__srcp__id_stage__L26 == v100);
assign v804 = (v803 ? gpr__r17 : v802);
assign v805 = (ID__srcp__id_stage__L26 == v165);
assign v806 = (v805 ? gpr__r18 : v804);
assign v807 = (ID__srcp__id_stage__L26 == v142);
assign v808 = (v807 ? gpr__r19 : v806);
assign v809 = (ID__srcp__id_stage__L26 == v104);
assign v810 = (v809 ? gpr__r20 : v808);
assign v811 = (ID__srcp__id_stage__L26 == v159);
assign v812 = (v811 ? gpr__r21 : v810);
assign v813 = (ID__srcp__id_stage__L26 == v156);
assign v814 = (v813 ? gpr__r22 : v812);
assign v815 = (ID__srcp__id_stage__L26 == v146);
assign v816 = (v815 ? gpr__r23 : v814);
assign v817 = (ID__srcp__id_stage__L26 == v152);
assign v818 = (v817 ? t__r0 : v816);
assign v819 = (ID__srcp__id_stage__L26 == v107);
assign v820 = (v819 ? t__r1 : v818);
assign v821 = (ID__srcp__id_stage__L26 == v123);
assign v822 = (v821 ? t__r2 : v820);
assign v823 = (ID__srcp__id_stage__L26 == v99);
assign v824 = (v823 ? t__r3 : v822);
assign v825 = (ID__srcp__id_stage__L26 == v98);
assign v826 = (v825 ? u__r0 : v824);
assign v827 = (ID__srcp__id_stage__L26 == v97);
assign v828 = (v827 ? u__r1 : v826);
assign v829 = (ID__srcp__id_stage__L26 == v96);
assign v830 = (v829 ? u__r2 : v828);
assign v831 = (ID__srcp__id_stage__L26 == v95);
assign v832 = (v831 ? u__r3 : v830);
assign v833 = v832;
assign ID__srcp_val__id_stage__L40 = v833;
pyc_mux #(.WIDTH(64)) v834_inst (
  .sel(do_id__linx_cpu_pyc__L104),
  .a(ID__srcl_val__id_stage__L38),
  .b(idex__srcl_val),
  .y(v834)
);
assign idex__srcl_val__next = v834;
pyc_mux #(.WIDTH(64)) v835_inst (
  .sel(do_id__linx_cpu_pyc__L104),
  .a(ID__srcr_val__id_stage__L39),
  .b(idex__srcr_val),
  .y(v835)
);
assign idex__srcr_val__next = v835;
pyc_mux #(.WIDTH(64)) v836_inst (
  .sel(do_id__linx_cpu_pyc__L104),
  .a(ID__srcp_val__id_stage__L40),
  .b(idex__srcp_val),
  .y(v836)
);
assign idex__srcp_val__next = v836;
assign EX__z1__ex_stage__L38 = v177;
assign EX__z3__ex_stage__L39 = v176;
assign EX__z64__ex_stage__L40 = v173;
assign EX__pc__ex_stage__L43 = state__pc;
assign EX__op__ex_stage__L44 = idex__op;
assign EX__len_bytes__ex_stage__L45 = idex__len_bytes;
assign EX__regdst__ex_stage__L46 = idex__regdst;
assign EX__srcl_val__ex_stage__L47 = idex__srcl_val;
assign EX__srcr_val__ex_stage__L48 = idex__srcr_val;
assign EX__srcp_val__ex_stage__L49 = idex__srcp_val;
assign EX__imm__ex_stage__L50 = idex__imm;
assign v837 = (EX__op__ex_stage__L44 == v139);
assign EX__op_c_bstart_std__ex_stage__L52 = v837;
assign v838 = (EX__op__ex_stage__L44 == v142);
assign EX__op_c_bstart_cond__ex_stage__L53 = v838;
assign v839 = (EX__op__ex_stage__L44 == v104);
assign EX__op_bstart_std_call__ex_stage__L54 = v839;
assign v840 = (EX__op__ex_stage__L44 == v148);
assign EX__op_c_movr__ex_stage__L55 = v840;
assign v841 = (EX__op__ex_stage__L44 == v159);
assign EX__op_c_movi__ex_stage__L56 = v841;
assign v842 = (EX__op__ex_stage__L44 == v156);
assign EX__op_c_setret__ex_stage__L57 = v842;
assign v843 = (EX__op__ex_stage__L44 == v146);
assign EX__op_c_setc_eq__ex_stage__L58 = v843;
assign v844 = (EX__op__ex_stage__L44 == v152);
assign EX__op_c_setc_tgt__ex_stage__L59 = v844;
assign v845 = (EX__op__ex_stage__L44 == v107);
assign EX__op_addtpc__ex_stage__L60 = v845;
assign v846 = (EX__op__ex_stage__L44 == v117);
assign EX__op_addi__ex_stage__L61 = v846;
assign v847 = (EX__op__ex_stage__L44 == v115);
assign EX__op_subi__ex_stage__L62 = v847;
assign v848 = (EX__op__ex_stage__L44 == v119);
assign EX__op_addiw__ex_stage__L63 = v848;
assign v849 = (EX__op__ex_stage__L44 == v128);
assign EX__op_addw__ex_stage__L64 = v849;
assign v850 = (EX__op__ex_stage__L44 == v130);
assign EX__op_orw__ex_stage__L65 = v850;
assign v851 = (EX__op__ex_stage__L44 == v132);
assign EX__op_andw__ex_stage__L66 = v851;
assign v852 = (EX__op__ex_stage__L44 == v134);
assign EX__op_xorw__ex_stage__L67 = v852;
assign v853 = (EX__op__ex_stage__L44 == v112);
assign EX__op_cmp_eq__ex_stage__L68 = v853;
assign v854 = (EX__op__ex_stage__L44 == v126);
assign EX__op_csel__ex_stage__L69 = v854;
assign v855 = (EX__op__ex_stage__L44 == v100);
assign EX__op_hl_lui__ex_stage__L70 = v855;
assign v856 = (EX__op__ex_stage__L44 == v121);
assign EX__op_lwi__ex_stage__L71 = v856;
assign v857 = (EX__op__ex_stage__L44 == v150);
assign EX__op_c_lwi__ex_stage__L72 = v857;
assign v858 = (EX__op__ex_stage__L44 == v155);
assign EX__op_swi__ex_stage__L73 = v858;
assign v859 = (EX__op__ex_stage__L44 == v153);
assign EX__op_c_swi__ex_stage__L74 = v859;
assign v860 = (EX__op__ex_stage__L44 == v123);
assign EX__op_sdi__ex_stage__L75 = v860;
assign v861 = (EX__imm__ex_stage__L50 << 2);
assign EX__off__ex_stage__L77 = v861;
assign EX__alu__ex_stage__L79 = EX__z64__ex_stage__L40;
assign EX__is_load__ex_stage__L80 = EX__z1__ex_stage__L38;
assign EX__is_store__ex_stage__L81 = EX__z1__ex_stage__L38;
assign EX__size__ex_stage__L82 = EX__z3__ex_stage__L39;
assign EX__addr__ex_stage__L83 = EX__z64__ex_stage__L40;
assign EX__wdata__ex_stage__L84 = EX__z64__ex_stage__L40;
assign v862 = (EX__op_c_bstart_std__ex_stage__L52 | EX__op_c_bstart_cond__ex_stage__L53);
assign v863 = (v862 | EX__op_bstart_std_call__ex_stage__L54);
assign v864 = v863;
assign EX__alu__ex_stage__L88 = EX__imm__ex_stage__L50;
assign EX__is_load__ex_stage__L89 = EX__z1__ex_stage__L38;
assign EX__is_store__ex_stage__L90 = EX__z1__ex_stage__L38;
assign EX__size__ex_stage__L91 = EX__z3__ex_stage__L39;
assign EX__addr__ex_stage__L92 = EX__z64__ex_stage__L40;
assign EX__wdata__ex_stage__L93 = EX__z64__ex_stage__L40;
assign v865 = (v864 ? EX__addr__ex_stage__L92 : EX__addr__ex_stage__L83);
assign v866 = (v864 ? EX__alu__ex_stage__L88 : EX__alu__ex_stage__L79);
assign v867 = (v864 ? EX__is_load__ex_stage__L89 : EX__is_load__ex_stage__L80);
assign v868 = (v864 ? EX__is_store__ex_stage__L90 : EX__is_store__ex_stage__L81);
assign v869 = (v864 ? EX__size__ex_stage__L91 : EX__size__ex_stage__L82);
assign v870 = (v864 ? EX__wdata__ex_stage__L93 : EX__wdata__ex_stage__L84);
assign v871 = v865;
assign v872 = v866;
assign v873 = v867;
assign v874 = v868;
assign v875 = v869;
assign v876 = v870;
assign EX__addr__ex_stage__L87 = v871;
assign EX__alu__ex_stage__L87 = v872;
assign EX__is_load__ex_stage__L87 = v873;
assign EX__is_store__ex_stage__L87 = v874;
assign EX__size__ex_stage__L87 = v875;
assign EX__wdata__ex_stage__L87 = v876;
assign EX__alu__ex_stage__L97 = EX__srcl_val__ex_stage__L47;
assign EX__is_load__ex_stage__L98 = EX__z1__ex_stage__L38;
assign EX__is_store__ex_stage__L99 = EX__z1__ex_stage__L38;
assign EX__size__ex_stage__L100 = EX__z3__ex_stage__L39;
assign EX__addr__ex_stage__L101 = EX__z64__ex_stage__L40;
assign EX__wdata__ex_stage__L102 = EX__z64__ex_stage__L40;
assign v877 = (EX__op_c_movr__ex_stage__L55 ? EX__addr__ex_stage__L101 : EX__addr__ex_stage__L87);
assign v878 = (EX__op_c_movr__ex_stage__L55 ? EX__alu__ex_stage__L97 : EX__alu__ex_stage__L87);
assign v879 = (EX__op_c_movr__ex_stage__L55 ? EX__is_load__ex_stage__L98 : EX__is_load__ex_stage__L87);
assign v880 = (EX__op_c_movr__ex_stage__L55 ? EX__is_store__ex_stage__L99 : EX__is_store__ex_stage__L87);
assign v881 = (EX__op_c_movr__ex_stage__L55 ? EX__size__ex_stage__L100 : EX__size__ex_stage__L87);
assign v882 = (EX__op_c_movr__ex_stage__L55 ? EX__wdata__ex_stage__L102 : EX__wdata__ex_stage__L87);
assign v883 = v877;
assign v884 = v878;
assign v885 = v879;
assign v886 = v880;
assign v887 = v881;
assign v888 = v882;
assign EX__addr__ex_stage__L96 = v883;
assign EX__alu__ex_stage__L96 = v884;
assign EX__is_load__ex_stage__L96 = v885;
assign EX__is_store__ex_stage__L96 = v886;
assign EX__size__ex_stage__L96 = v887;
assign EX__wdata__ex_stage__L96 = v888;
assign EX__alu__ex_stage__L106 = EX__imm__ex_stage__L50;
assign EX__is_load__ex_stage__L107 = EX__z1__ex_stage__L38;
assign EX__is_store__ex_stage__L108 = EX__z1__ex_stage__L38;
assign EX__size__ex_stage__L109 = EX__z3__ex_stage__L39;
assign EX__addr__ex_stage__L110 = EX__z64__ex_stage__L40;
assign EX__wdata__ex_stage__L111 = EX__z64__ex_stage__L40;
assign v889 = (EX__op_c_movi__ex_stage__L56 ? EX__addr__ex_stage__L110 : EX__addr__ex_stage__L96);
assign v890 = (EX__op_c_movi__ex_stage__L56 ? EX__alu__ex_stage__L106 : EX__alu__ex_stage__L96);
assign v891 = (EX__op_c_movi__ex_stage__L56 ? EX__is_load__ex_stage__L107 : EX__is_load__ex_stage__L96);
assign v892 = (EX__op_c_movi__ex_stage__L56 ? EX__is_store__ex_stage__L108 : EX__is_store__ex_stage__L96);
assign v893 = (EX__op_c_movi__ex_stage__L56 ? EX__size__ex_stage__L109 : EX__size__ex_stage__L96);
assign v894 = (EX__op_c_movi__ex_stage__L56 ? EX__wdata__ex_stage__L111 : EX__wdata__ex_stage__L96);
assign v895 = v889;
assign v896 = v890;
assign v897 = v891;
assign v898 = v892;
assign v899 = v893;
assign v900 = v894;
assign EX__addr__ex_stage__L105 = v895;
assign EX__alu__ex_stage__L105 = v896;
assign EX__is_load__ex_stage__L105 = v897;
assign EX__is_store__ex_stage__L105 = v898;
assign EX__size__ex_stage__L105 = v899;
assign EX__wdata__ex_stage__L105 = v900;
pyc_add #(.WIDTH(64)) v901_inst (
  .a(EX__pc__ex_stage__L43),
  .b(EX__imm__ex_stage__L50),
  .y(v901)
);
assign EX__alu__ex_stage__L115 = v901;
assign EX__is_load__ex_stage__L116 = EX__z1__ex_stage__L38;
assign EX__is_store__ex_stage__L117 = EX__z1__ex_stage__L38;
assign EX__size__ex_stage__L118 = EX__z3__ex_stage__L39;
assign EX__addr__ex_stage__L119 = EX__z64__ex_stage__L40;
assign EX__wdata__ex_stage__L120 = EX__z64__ex_stage__L40;
assign v902 = (EX__op_c_setret__ex_stage__L57 ? EX__addr__ex_stage__L119 : EX__addr__ex_stage__L105);
assign v903 = (EX__op_c_setret__ex_stage__L57 ? EX__alu__ex_stage__L115 : EX__alu__ex_stage__L105);
assign v904 = (EX__op_c_setret__ex_stage__L57 ? EX__is_load__ex_stage__L116 : EX__is_load__ex_stage__L105);
assign v905 = (EX__op_c_setret__ex_stage__L57 ? EX__is_store__ex_stage__L117 : EX__is_store__ex_stage__L105);
assign v906 = (EX__op_c_setret__ex_stage__L57 ? EX__size__ex_stage__L118 : EX__size__ex_stage__L105);
assign v907 = (EX__op_c_setret__ex_stage__L57 ? EX__wdata__ex_stage__L120 : EX__wdata__ex_stage__L105);
assign v908 = v902;
assign v909 = v903;
assign v910 = v904;
assign v911 = v905;
assign v912 = v906;
assign v913 = v907;
assign EX__addr__ex_stage__L114 = v908;
assign EX__alu__ex_stage__L114 = v909;
assign EX__is_load__ex_stage__L114 = v910;
assign EX__is_store__ex_stage__L114 = v911;
assign EX__size__ex_stage__L114 = v912;
assign EX__wdata__ex_stage__L114 = v913;
assign EX__setc_eq__ex_stage__L123 = EX__z64__ex_stage__L40;
assign v914 = (EX__srcl_val__ex_stage__L47 == EX__srcr_val__ex_stage__L48);
assign v915 = (v914 ? v172 : EX__setc_eq__ex_stage__L123);
assign EX__setc_eq__ex_stage__L124 = v915;
assign EX__alu__ex_stage__L127 = EX__setc_eq__ex_stage__L124;
assign EX__is_load__ex_stage__L128 = EX__z1__ex_stage__L38;
assign EX__is_store__ex_stage__L129 = EX__z1__ex_stage__L38;
assign EX__size__ex_stage__L130 = EX__z3__ex_stage__L39;
assign EX__addr__ex_stage__L131 = EX__z64__ex_stage__L40;
assign EX__wdata__ex_stage__L132 = EX__z64__ex_stage__L40;
assign v916 = (EX__op_c_setc_eq__ex_stage__L58 ? EX__addr__ex_stage__L131 : EX__addr__ex_stage__L114);
assign v917 = (EX__op_c_setc_eq__ex_stage__L58 ? EX__alu__ex_stage__L127 : EX__alu__ex_stage__L114);
assign v918 = (EX__op_c_setc_eq__ex_stage__L58 ? EX__is_load__ex_stage__L128 : EX__is_load__ex_stage__L114);
assign v919 = (EX__op_c_setc_eq__ex_stage__L58 ? EX__is_store__ex_stage__L129 : EX__is_store__ex_stage__L114);
assign v920 = (EX__op_c_setc_eq__ex_stage__L58 ? EX__size__ex_stage__L130 : EX__size__ex_stage__L114);
assign v921 = (EX__op_c_setc_eq__ex_stage__L58 ? EX__wdata__ex_stage__L132 : EX__wdata__ex_stage__L114);
assign v922 = v916;
assign v923 = v917;
assign v924 = v918;
assign v925 = v919;
assign v926 = v920;
assign v927 = v921;
assign EX__addr__ex_stage__L126 = v922;
assign EX__alu__ex_stage__L126 = v923;
assign EX__is_load__ex_stage__L126 = v924;
assign EX__is_store__ex_stage__L126 = v925;
assign EX__size__ex_stage__L126 = v926;
assign EX__wdata__ex_stage__L126 = v927;
assign EX__alu__ex_stage__L134 = EX__srcl_val__ex_stage__L47;
assign EX__is_load__ex_stage__L135 = EX__z1__ex_stage__L38;
assign EX__is_store__ex_stage__L136 = EX__z1__ex_stage__L38;
assign EX__size__ex_stage__L137 = EX__z3__ex_stage__L39;
assign EX__addr__ex_stage__L138 = EX__z64__ex_stage__L40;
assign EX__wdata__ex_stage__L139 = EX__z64__ex_stage__L40;
assign v928 = (EX__op_c_setc_tgt__ex_stage__L59 ? EX__addr__ex_stage__L138 : EX__addr__ex_stage__L126);
assign v929 = (EX__op_c_setc_tgt__ex_stage__L59 ? EX__alu__ex_stage__L134 : EX__alu__ex_stage__L126);
assign v930 = (EX__op_c_setc_tgt__ex_stage__L59 ? EX__is_load__ex_stage__L135 : EX__is_load__ex_stage__L126);
assign v931 = (EX__op_c_setc_tgt__ex_stage__L59 ? EX__is_store__ex_stage__L136 : EX__is_store__ex_stage__L126);
assign v932 = (EX__op_c_setc_tgt__ex_stage__L59 ? EX__size__ex_stage__L137 : EX__size__ex_stage__L126);
assign v933 = (EX__op_c_setc_tgt__ex_stage__L59 ? EX__wdata__ex_stage__L139 : EX__wdata__ex_stage__L126);
assign v934 = v928;
assign v935 = v929;
assign v936 = v930;
assign v937 = v931;
assign v938 = v932;
assign v939 = v933;
assign EX__addr__ex_stage__L133 = v934;
assign EX__alu__ex_stage__L133 = v935;
assign EX__is_load__ex_stage__L133 = v936;
assign EX__is_store__ex_stage__L133 = v937;
assign EX__size__ex_stage__L133 = v938;
assign EX__wdata__ex_stage__L133 = v939;
pyc_and #(.WIDTH(64)) v940_inst (
  .a(EX__pc__ex_stage__L43),
  .b(v94),
  .y(v940)
);
assign EX__pc_page__ex_stage__L142 = v940;
pyc_add #(.WIDTH(64)) v941_inst (
  .a(EX__pc_page__ex_stage__L142),
  .b(EX__imm__ex_stage__L50),
  .y(v941)
);
assign EX__alu__ex_stage__L144 = v941;
assign EX__is_load__ex_stage__L145 = EX__z1__ex_stage__L38;
assign EX__is_store__ex_stage__L146 = EX__z1__ex_stage__L38;
assign EX__size__ex_stage__L147 = EX__z3__ex_stage__L39;
assign EX__addr__ex_stage__L148 = EX__z64__ex_stage__L40;
assign EX__wdata__ex_stage__L149 = EX__z64__ex_stage__L40;
assign v942 = (EX__op_addtpc__ex_stage__L60 ? EX__addr__ex_stage__L148 : EX__addr__ex_stage__L133);
assign v943 = (EX__op_addtpc__ex_stage__L60 ? EX__alu__ex_stage__L144 : EX__alu__ex_stage__L133);
assign v944 = (EX__op_addtpc__ex_stage__L60 ? EX__is_load__ex_stage__L145 : EX__is_load__ex_stage__L133);
assign v945 = (EX__op_addtpc__ex_stage__L60 ? EX__is_store__ex_stage__L146 : EX__is_store__ex_stage__L133);
assign v946 = (EX__op_addtpc__ex_stage__L60 ? EX__size__ex_stage__L147 : EX__size__ex_stage__L133);
assign v947 = (EX__op_addtpc__ex_stage__L60 ? EX__wdata__ex_stage__L149 : EX__wdata__ex_stage__L133);
assign v948 = v942;
assign v949 = v943;
assign v950 = v944;
assign v951 = v945;
assign v952 = v946;
assign v953 = v947;
assign EX__addr__ex_stage__L143 = v948;
assign EX__alu__ex_stage__L143 = v949;
assign EX__is_load__ex_stage__L143 = v950;
assign EX__is_store__ex_stage__L143 = v951;
assign EX__size__ex_stage__L143 = v952;
assign EX__wdata__ex_stage__L143 = v953;
pyc_add #(.WIDTH(64)) v954_inst (
  .a(EX__srcl_val__ex_stage__L47),
  .b(EX__imm__ex_stage__L50),
  .y(v954)
);
assign EX__alu__ex_stage__L153 = v954;
assign EX__is_load__ex_stage__L154 = EX__z1__ex_stage__L38;
assign EX__is_store__ex_stage__L155 = EX__z1__ex_stage__L38;
assign EX__size__ex_stage__L156 = EX__z3__ex_stage__L39;
assign EX__addr__ex_stage__L157 = EX__z64__ex_stage__L40;
assign EX__wdata__ex_stage__L158 = EX__z64__ex_stage__L40;
assign v955 = (EX__op_addi__ex_stage__L61 ? EX__addr__ex_stage__L157 : EX__addr__ex_stage__L143);
assign v956 = (EX__op_addi__ex_stage__L61 ? EX__alu__ex_stage__L153 : EX__alu__ex_stage__L143);
assign v957 = (EX__op_addi__ex_stage__L61 ? EX__is_load__ex_stage__L154 : EX__is_load__ex_stage__L143);
assign v958 = (EX__op_addi__ex_stage__L61 ? EX__is_store__ex_stage__L155 : EX__is_store__ex_stage__L143);
assign v959 = (EX__op_addi__ex_stage__L61 ? EX__size__ex_stage__L156 : EX__size__ex_stage__L143);
assign v960 = (EX__op_addi__ex_stage__L61 ? EX__wdata__ex_stage__L158 : EX__wdata__ex_stage__L143);
assign v961 = v955;
assign v962 = v956;
assign v963 = v957;
assign v964 = v958;
assign v965 = v959;
assign v966 = v960;
assign EX__addr__ex_stage__L152 = v961;
assign EX__alu__ex_stage__L152 = v962;
assign EX__is_load__ex_stage__L152 = v963;
assign EX__is_store__ex_stage__L152 = v964;
assign EX__size__ex_stage__L152 = v965;
assign EX__wdata__ex_stage__L152 = v966;
assign v967 = (~EX__imm__ex_stage__L50);
assign v968 = (v967 + v172);
assign v969 = (EX__srcl_val__ex_stage__L47 + v968);
assign v970 = v969;
assign EX__subi__ex_stage__L159 = v970;
assign EX__alu__ex_stage__L161 = EX__subi__ex_stage__L159;
assign EX__is_load__ex_stage__L162 = EX__z1__ex_stage__L38;
assign EX__is_store__ex_stage__L163 = EX__z1__ex_stage__L38;
assign EX__size__ex_stage__L164 = EX__z3__ex_stage__L39;
assign EX__addr__ex_stage__L165 = EX__z64__ex_stage__L40;
assign EX__wdata__ex_stage__L166 = EX__z64__ex_stage__L40;
assign v971 = (EX__op_subi__ex_stage__L62 ? EX__addr__ex_stage__L165 : EX__addr__ex_stage__L152);
assign v972 = (EX__op_subi__ex_stage__L62 ? EX__alu__ex_stage__L161 : EX__alu__ex_stage__L152);
assign v973 = (EX__op_subi__ex_stage__L62 ? EX__is_load__ex_stage__L162 : EX__is_load__ex_stage__L152);
assign v974 = (EX__op_subi__ex_stage__L62 ? EX__is_store__ex_stage__L163 : EX__is_store__ex_stage__L152);
assign v975 = (EX__op_subi__ex_stage__L62 ? EX__size__ex_stage__L164 : EX__size__ex_stage__L152);
assign v976 = (EX__op_subi__ex_stage__L62 ? EX__wdata__ex_stage__L166 : EX__wdata__ex_stage__L152);
assign v977 = v971;
assign v978 = v972;
assign v979 = v973;
assign v980 = v974;
assign v981 = v975;
assign v982 = v976;
assign EX__addr__ex_stage__L160 = v977;
assign EX__alu__ex_stage__L160 = v978;
assign EX__is_load__ex_stage__L160 = v979;
assign EX__is_store__ex_stage__L160 = v980;
assign EX__size__ex_stage__L160 = v981;
assign EX__wdata__ex_stage__L160 = v982;
assign v983 = EX__srcl_val__ex_stage__L47[31:0];
assign v984 = EX__imm__ex_stage__L50[31:0];
assign v985 = (v983 + v984);
assign v986 = {{32{v985[31]}}, v985};
assign v987 = v983;
assign v988 = v986;
assign EX__addiw__ex_stage__L167 = v988;
assign EX__alu__ex_stage__L169 = EX__addiw__ex_stage__L167;
assign EX__is_load__ex_stage__L170 = EX__z1__ex_stage__L38;
assign EX__is_store__ex_stage__L171 = EX__z1__ex_stage__L38;
assign EX__size__ex_stage__L172 = EX__z3__ex_stage__L39;
assign EX__addr__ex_stage__L173 = EX__z64__ex_stage__L40;
assign EX__wdata__ex_stage__L174 = EX__z64__ex_stage__L40;
assign v989 = (EX__op_addiw__ex_stage__L63 ? EX__addr__ex_stage__L173 : EX__addr__ex_stage__L160);
assign v990 = (EX__op_addiw__ex_stage__L63 ? EX__alu__ex_stage__L169 : EX__alu__ex_stage__L160);
assign v991 = (EX__op_addiw__ex_stage__L63 ? EX__is_load__ex_stage__L170 : EX__is_load__ex_stage__L160);
assign v992 = (EX__op_addiw__ex_stage__L63 ? EX__is_store__ex_stage__L171 : EX__is_store__ex_stage__L160);
assign v993 = (EX__op_addiw__ex_stage__L63 ? EX__size__ex_stage__L172 : EX__size__ex_stage__L160);
assign v994 = (EX__op_addiw__ex_stage__L63 ? EX__wdata__ex_stage__L174 : EX__wdata__ex_stage__L160);
assign v995 = v989;
assign v996 = v990;
assign v997 = v991;
assign v998 = v992;
assign v999 = v993;
assign v1000 = v994;
assign EX__addr__ex_stage__L168 = v995;
assign EX__alu__ex_stage__L168 = v996;
assign EX__is_load__ex_stage__L168 = v997;
assign EX__is_store__ex_stage__L168 = v998;
assign EX__size__ex_stage__L168 = v999;
assign EX__wdata__ex_stage__L168 = v1000;
assign v1001 = EX__srcr_val__ex_stage__L48[31:0];
assign v1002 = (v987 + v1001);
assign v1003 = {{32{v1002[31]}}, v1002};
assign v1004 = v1001;
assign v1005 = v1003;
assign EX__addw__ex_stage__L177 = v1005;
assign v1006 = (v987 | v1004);
assign v1007 = {{32{v1006[31]}}, v1006};
assign v1008 = v1007;
assign EX__orw__ex_stage__L178 = v1008;
assign v1009 = (v987 & v1004);
assign v1010 = {{32{v1009[31]}}, v1009};
assign v1011 = v1010;
assign EX__andw__ex_stage__L179 = v1011;
assign v1012 = (v987 ^ v1004);
assign v1013 = {{32{v1012[31]}}, v1012};
assign v1014 = v1013;
assign EX__xorw__ex_stage__L180 = v1014;
assign EX__alu__ex_stage__L182 = EX__addw__ex_stage__L177;
assign EX__is_load__ex_stage__L183 = EX__z1__ex_stage__L38;
assign EX__is_store__ex_stage__L184 = EX__z1__ex_stage__L38;
assign EX__size__ex_stage__L185 = EX__z3__ex_stage__L39;
assign EX__addr__ex_stage__L186 = EX__z64__ex_stage__L40;
assign EX__wdata__ex_stage__L187 = EX__z64__ex_stage__L40;
assign v1015 = (EX__op_addw__ex_stage__L64 ? EX__addr__ex_stage__L186 : EX__addr__ex_stage__L168);
assign v1016 = (EX__op_addw__ex_stage__L64 ? EX__alu__ex_stage__L182 : EX__alu__ex_stage__L168);
assign v1017 = (EX__op_addw__ex_stage__L64 ? EX__is_load__ex_stage__L183 : EX__is_load__ex_stage__L168);
assign v1018 = (EX__op_addw__ex_stage__L64 ? EX__is_store__ex_stage__L184 : EX__is_store__ex_stage__L168);
assign v1019 = (EX__op_addw__ex_stage__L64 ? EX__size__ex_stage__L185 : EX__size__ex_stage__L168);
assign v1020 = (EX__op_addw__ex_stage__L64 ? EX__wdata__ex_stage__L187 : EX__wdata__ex_stage__L168);
assign v1021 = v1015;
assign v1022 = v1016;
assign v1023 = v1017;
assign v1024 = v1018;
assign v1025 = v1019;
assign v1026 = v1020;
assign EX__addr__ex_stage__L181 = v1021;
assign EX__alu__ex_stage__L181 = v1022;
assign EX__is_load__ex_stage__L181 = v1023;
assign EX__is_store__ex_stage__L181 = v1024;
assign EX__size__ex_stage__L181 = v1025;
assign EX__wdata__ex_stage__L181 = v1026;
assign EX__alu__ex_stage__L189 = EX__orw__ex_stage__L178;
assign EX__is_load__ex_stage__L190 = EX__z1__ex_stage__L38;
assign EX__is_store__ex_stage__L191 = EX__z1__ex_stage__L38;
assign EX__size__ex_stage__L192 = EX__z3__ex_stage__L39;
assign EX__addr__ex_stage__L193 = EX__z64__ex_stage__L40;
assign EX__wdata__ex_stage__L194 = EX__z64__ex_stage__L40;
assign v1027 = (EX__op_orw__ex_stage__L65 ? EX__addr__ex_stage__L193 : EX__addr__ex_stage__L181);
assign v1028 = (EX__op_orw__ex_stage__L65 ? EX__alu__ex_stage__L189 : EX__alu__ex_stage__L181);
assign v1029 = (EX__op_orw__ex_stage__L65 ? EX__is_load__ex_stage__L190 : EX__is_load__ex_stage__L181);
assign v1030 = (EX__op_orw__ex_stage__L65 ? EX__is_store__ex_stage__L191 : EX__is_store__ex_stage__L181);
assign v1031 = (EX__op_orw__ex_stage__L65 ? EX__size__ex_stage__L192 : EX__size__ex_stage__L181);
assign v1032 = (EX__op_orw__ex_stage__L65 ? EX__wdata__ex_stage__L194 : EX__wdata__ex_stage__L181);
assign v1033 = v1027;
assign v1034 = v1028;
assign v1035 = v1029;
assign v1036 = v1030;
assign v1037 = v1031;
assign v1038 = v1032;
assign EX__addr__ex_stage__L188 = v1033;
assign EX__alu__ex_stage__L188 = v1034;
assign EX__is_load__ex_stage__L188 = v1035;
assign EX__is_store__ex_stage__L188 = v1036;
assign EX__size__ex_stage__L188 = v1037;
assign EX__wdata__ex_stage__L188 = v1038;
assign EX__alu__ex_stage__L196 = EX__andw__ex_stage__L179;
assign EX__is_load__ex_stage__L197 = EX__z1__ex_stage__L38;
assign EX__is_store__ex_stage__L198 = EX__z1__ex_stage__L38;
assign EX__size__ex_stage__L199 = EX__z3__ex_stage__L39;
assign EX__addr__ex_stage__L200 = EX__z64__ex_stage__L40;
assign EX__wdata__ex_stage__L201 = EX__z64__ex_stage__L40;
assign v1039 = (EX__op_andw__ex_stage__L66 ? EX__addr__ex_stage__L200 : EX__addr__ex_stage__L188);
assign v1040 = (EX__op_andw__ex_stage__L66 ? EX__alu__ex_stage__L196 : EX__alu__ex_stage__L188);
assign v1041 = (EX__op_andw__ex_stage__L66 ? EX__is_load__ex_stage__L197 : EX__is_load__ex_stage__L188);
assign v1042 = (EX__op_andw__ex_stage__L66 ? EX__is_store__ex_stage__L198 : EX__is_store__ex_stage__L188);
assign v1043 = (EX__op_andw__ex_stage__L66 ? EX__size__ex_stage__L199 : EX__size__ex_stage__L188);
assign v1044 = (EX__op_andw__ex_stage__L66 ? EX__wdata__ex_stage__L201 : EX__wdata__ex_stage__L188);
assign v1045 = v1039;
assign v1046 = v1040;
assign v1047 = v1041;
assign v1048 = v1042;
assign v1049 = v1043;
assign v1050 = v1044;
assign EX__addr__ex_stage__L195 = v1045;
assign EX__alu__ex_stage__L195 = v1046;
assign EX__is_load__ex_stage__L195 = v1047;
assign EX__is_store__ex_stage__L195 = v1048;
assign EX__size__ex_stage__L195 = v1049;
assign EX__wdata__ex_stage__L195 = v1050;
assign EX__alu__ex_stage__L203 = EX__xorw__ex_stage__L180;
assign EX__is_load__ex_stage__L204 = EX__z1__ex_stage__L38;
assign EX__is_store__ex_stage__L205 = EX__z1__ex_stage__L38;
assign EX__size__ex_stage__L206 = EX__z3__ex_stage__L39;
assign EX__addr__ex_stage__L207 = EX__z64__ex_stage__L40;
assign EX__wdata__ex_stage__L208 = EX__z64__ex_stage__L40;
assign v1051 = (EX__op_xorw__ex_stage__L67 ? EX__addr__ex_stage__L207 : EX__addr__ex_stage__L195);
assign v1052 = (EX__op_xorw__ex_stage__L67 ? EX__alu__ex_stage__L203 : EX__alu__ex_stage__L195);
assign v1053 = (EX__op_xorw__ex_stage__L67 ? EX__is_load__ex_stage__L204 : EX__is_load__ex_stage__L195);
assign v1054 = (EX__op_xorw__ex_stage__L67 ? EX__is_store__ex_stage__L205 : EX__is_store__ex_stage__L195);
assign v1055 = (EX__op_xorw__ex_stage__L67 ? EX__size__ex_stage__L206 : EX__size__ex_stage__L195);
assign v1056 = (EX__op_xorw__ex_stage__L67 ? EX__wdata__ex_stage__L208 : EX__wdata__ex_stage__L195);
assign v1057 = v1051;
assign v1058 = v1052;
assign v1059 = v1053;
assign v1060 = v1054;
assign v1061 = v1055;
assign v1062 = v1056;
assign EX__addr__ex_stage__L202 = v1057;
assign EX__alu__ex_stage__L202 = v1058;
assign EX__is_load__ex_stage__L202 = v1059;
assign EX__is_store__ex_stage__L202 = v1060;
assign EX__size__ex_stage__L202 = v1061;
assign EX__wdata__ex_stage__L202 = v1062;
assign EX__cmp__ex_stage__L211 = EX__z64__ex_stage__L40;
assign v1063 = (v914 ? v172 : EX__cmp__ex_stage__L211);
assign EX__cmp__ex_stage__L212 = v1063;
assign EX__alu__ex_stage__L215 = EX__cmp__ex_stage__L212;
assign EX__is_load__ex_stage__L216 = EX__z1__ex_stage__L38;
assign EX__is_store__ex_stage__L217 = EX__z1__ex_stage__L38;
assign EX__size__ex_stage__L218 = EX__z3__ex_stage__L39;
assign EX__addr__ex_stage__L219 = EX__z64__ex_stage__L40;
assign EX__wdata__ex_stage__L220 = EX__z64__ex_stage__L40;
assign v1064 = (EX__op_cmp_eq__ex_stage__L68 ? EX__addr__ex_stage__L219 : EX__addr__ex_stage__L202);
assign v1065 = (EX__op_cmp_eq__ex_stage__L68 ? EX__alu__ex_stage__L215 : EX__alu__ex_stage__L202);
assign v1066 = (EX__op_cmp_eq__ex_stage__L68 ? EX__is_load__ex_stage__L216 : EX__is_load__ex_stage__L202);
assign v1067 = (EX__op_cmp_eq__ex_stage__L68 ? EX__is_store__ex_stage__L217 : EX__is_store__ex_stage__L202);
assign v1068 = (EX__op_cmp_eq__ex_stage__L68 ? EX__size__ex_stage__L218 : EX__size__ex_stage__L202);
assign v1069 = (EX__op_cmp_eq__ex_stage__L68 ? EX__wdata__ex_stage__L220 : EX__wdata__ex_stage__L202);
assign v1070 = v1064;
assign v1071 = v1065;
assign v1072 = v1066;
assign v1073 = v1067;
assign v1074 = v1068;
assign v1075 = v1069;
assign EX__addr__ex_stage__L214 = v1070;
assign EX__alu__ex_stage__L214 = v1071;
assign EX__is_load__ex_stage__L214 = v1072;
assign EX__is_store__ex_stage__L214 = v1073;
assign EX__size__ex_stage__L214 = v1074;
assign EX__wdata__ex_stage__L214 = v1075;
assign EX__alu__ex_stage__L224 = EX__imm__ex_stage__L50;
assign EX__is_load__ex_stage__L225 = EX__z1__ex_stage__L38;
assign EX__is_store__ex_stage__L226 = EX__z1__ex_stage__L38;
assign EX__size__ex_stage__L227 = EX__z3__ex_stage__L39;
assign EX__addr__ex_stage__L228 = EX__z64__ex_stage__L40;
assign EX__wdata__ex_stage__L229 = EX__z64__ex_stage__L40;
assign v1076 = (EX__op_hl_lui__ex_stage__L70 ? EX__addr__ex_stage__L228 : EX__addr__ex_stage__L214);
assign v1077 = (EX__op_hl_lui__ex_stage__L70 ? EX__alu__ex_stage__L224 : EX__alu__ex_stage__L214);
assign v1078 = (EX__op_hl_lui__ex_stage__L70 ? EX__is_load__ex_stage__L225 : EX__is_load__ex_stage__L214);
assign v1079 = (EX__op_hl_lui__ex_stage__L70 ? EX__is_store__ex_stage__L226 : EX__is_store__ex_stage__L214);
assign v1080 = (EX__op_hl_lui__ex_stage__L70 ? EX__size__ex_stage__L227 : EX__size__ex_stage__L214);
assign v1081 = (EX__op_hl_lui__ex_stage__L70 ? EX__wdata__ex_stage__L229 : EX__wdata__ex_stage__L214);
assign v1082 = v1076;
assign v1083 = v1077;
assign v1084 = v1078;
assign v1085 = v1079;
assign v1086 = v1080;
assign v1087 = v1081;
assign EX__addr__ex_stage__L223 = v1082;
assign EX__alu__ex_stage__L223 = v1083;
assign EX__is_load__ex_stage__L223 = v1084;
assign EX__is_store__ex_stage__L223 = v1085;
assign EX__size__ex_stage__L223 = v1086;
assign EX__wdata__ex_stage__L223 = v1087;
assign EX__csel_val__ex_stage__L232 = EX__srcl_val__ex_stage__L47;
assign v1088 = (EX__srcp_val__ex_stage__L49 == v173);
assign v1089 = (~v1088);
assign v1090 = v1089;
assign EX__csel_val__ex_stage__L234 = EX__srcr_val__ex_stage__L48;
pyc_mux #(.WIDTH(64)) v1091_inst (
  .sel(v1090),
  .a(EX__csel_val__ex_stage__L234),
  .b(EX__csel_val__ex_stage__L232),
  .y(v1091)
);
assign EX__csel_val__ex_stage__L233 = v1091;
assign EX__alu__ex_stage__L236 = EX__csel_val__ex_stage__L233;
assign EX__is_load__ex_stage__L237 = EX__z1__ex_stage__L38;
assign EX__is_store__ex_stage__L238 = EX__z1__ex_stage__L38;
assign EX__size__ex_stage__L239 = EX__z3__ex_stage__L39;
assign EX__addr__ex_stage__L240 = EX__z64__ex_stage__L40;
assign EX__wdata__ex_stage__L241 = EX__z64__ex_stage__L40;
assign v1092 = (EX__op_csel__ex_stage__L69 ? EX__addr__ex_stage__L240 : EX__addr__ex_stage__L223);
assign v1093 = (EX__op_csel__ex_stage__L69 ? EX__alu__ex_stage__L236 : EX__alu__ex_stage__L223);
assign v1094 = (EX__op_csel__ex_stage__L69 ? EX__is_load__ex_stage__L237 : EX__is_load__ex_stage__L223);
assign v1095 = (EX__op_csel__ex_stage__L69 ? EX__is_store__ex_stage__L238 : EX__is_store__ex_stage__L223);
assign v1096 = (EX__op_csel__ex_stage__L69 ? EX__size__ex_stage__L239 : EX__size__ex_stage__L223);
assign v1097 = (EX__op_csel__ex_stage__L69 ? EX__wdata__ex_stage__L241 : EX__wdata__ex_stage__L223);
assign v1098 = v1092;
assign v1099 = v1093;
assign v1100 = v1094;
assign v1101 = v1095;
assign v1102 = v1096;
assign v1103 = v1097;
assign EX__addr__ex_stage__L235 = v1098;
assign EX__alu__ex_stage__L235 = v1099;
assign EX__is_load__ex_stage__L235 = v1100;
assign EX__is_store__ex_stage__L235 = v1101;
assign EX__size__ex_stage__L235 = v1102;
assign EX__wdata__ex_stage__L235 = v1103;
pyc_or #(.WIDTH(1)) v1104_inst (
  .a(EX__op_lwi__ex_stage__L71),
  .b(EX__op_c_lwi__ex_stage__L72),
  .y(v1104)
);
assign EX__is_lwi__ex_stage__L244 = v1104;
pyc_add #(.WIDTH(64)) v1105_inst (
  .a(EX__srcl_val__ex_stage__L47),
  .b(EX__off__ex_stage__L77),
  .y(v1105)
);
assign EX__lwi_addr__ex_stage__L245 = v1105;
assign v1106 = (EX__is_lwi__ex_stage__L244 ? v178 : EX__is_load__ex_stage__L235);
assign v1107 = (EX__is_lwi__ex_stage__L244 ? v166 : EX__size__ex_stage__L235);
assign EX__alu__ex_stage__L247 = EX__z64__ex_stage__L40;
assign EX__is_store__ex_stage__L249 = EX__z1__ex_stage__L38;
assign EX__addr__ex_stage__L251 = EX__lwi_addr__ex_stage__L245;
assign EX__wdata__ex_stage__L252 = EX__z64__ex_stage__L40;
assign v1108 = (EX__is_lwi__ex_stage__L244 ? EX__addr__ex_stage__L251 : EX__addr__ex_stage__L235);
assign v1109 = (EX__is_lwi__ex_stage__L244 ? EX__alu__ex_stage__L247 : EX__alu__ex_stage__L235);
assign v1110 = (EX__is_lwi__ex_stage__L244 ? EX__is_store__ex_stage__L249 : EX__is_store__ex_stage__L235);
assign v1111 = (EX__is_lwi__ex_stage__L244 ? EX__wdata__ex_stage__L252 : EX__wdata__ex_stage__L235);
assign v1112 = v1108;
assign v1113 = v1109;
assign v1114 = v1110;
assign v1115 = v1111;
assign EX__addr__ex_stage__L246 = v1112;
assign EX__alu__ex_stage__L246 = v1113;
assign EX__is_load__ex_stage__L246 = v1106;
assign EX__is_store__ex_stage__L246 = v1114;
assign EX__size__ex_stage__L246 = v1107;
assign EX__wdata__ex_stage__L246 = v1115;
assign EX__store_addr__ex_stage__L255 = v1105;
assign EX__store_data__ex_stage__L256 = EX__srcr_val__ex_stage__L48;
pyc_add #(.WIDTH(64)) v1116_inst (
  .a(EX__srcr_val__ex_stage__L48),
  .b(EX__off__ex_stage__L77),
  .y(v1116)
);
assign EX__store_addr__ex_stage__L258 = v1116;
assign EX__store_data__ex_stage__L259 = EX__srcl_val__ex_stage__L47;
assign v1117 = (EX__op_swi__ex_stage__L73 ? EX__store_addr__ex_stage__L258 : EX__store_addr__ex_stage__L255);
assign v1118 = (EX__op_swi__ex_stage__L73 ? EX__store_data__ex_stage__L259 : EX__store_data__ex_stage__L256);
assign v1119 = v1117;
assign v1120 = v1118;
assign EX__store_addr__ex_stage__L257 = v1119;
assign EX__store_data__ex_stage__L257 = v1120;
pyc_or #(.WIDTH(1)) v1121_inst (
  .a(EX__op_swi__ex_stage__L73),
  .b(EX__op_c_swi__ex_stage__L74),
  .y(v1121)
);
assign v1122 = (v1121 ? v178 : EX__is_store__ex_stage__L246);
assign v1123 = (v1121 ? v166 : EX__size__ex_stage__L246);
assign EX__alu__ex_stage__L261 = EX__z64__ex_stage__L40;
assign EX__is_load__ex_stage__L262 = EX__z1__ex_stage__L38;
assign EX__addr__ex_stage__L265 = EX__store_addr__ex_stage__L257;
assign EX__wdata__ex_stage__L266 = EX__store_data__ex_stage__L257;
assign v1124 = (v1121 ? EX__addr__ex_stage__L265 : EX__addr__ex_stage__L246);
assign v1125 = (v1121 ? EX__alu__ex_stage__L261 : EX__alu__ex_stage__L246);
assign v1126 = (v1121 ? EX__is_load__ex_stage__L262 : EX__is_load__ex_stage__L246);
assign v1127 = (v1121 ? EX__wdata__ex_stage__L266 : EX__wdata__ex_stage__L246);
assign v1128 = v1124;
assign v1129 = v1125;
assign v1130 = v1126;
assign v1131 = v1127;
assign EX__addr__ex_stage__L260 = v1128;
assign EX__alu__ex_stage__L260 = v1129;
assign EX__is_load__ex_stage__L260 = v1130;
assign EX__is_store__ex_stage__L260 = v1122;
assign EX__size__ex_stage__L260 = v1123;
assign EX__wdata__ex_stage__L260 = v1131;
assign v1132 = (EX__imm__ex_stage__L50 << 3);
assign EX__sdi_off__ex_stage__L269 = v1132;
pyc_add #(.WIDTH(64)) v1133_inst (
  .a(EX__srcr_val__ex_stage__L48),
  .b(EX__sdi_off__ex_stage__L269),
  .y(v1133)
);
assign EX__sdi_addr__ex_stage__L270 = v1133;
assign v1134 = (EX__op_sdi__ex_stage__L75 ? v178 : EX__is_store__ex_stage__L260);
assign v1135 = (EX__op_sdi__ex_stage__L75 ? v176 : EX__size__ex_stage__L260);
assign EX__alu__ex_stage__L272 = EX__z64__ex_stage__L40;
assign EX__is_load__ex_stage__L273 = EX__z1__ex_stage__L38;
assign EX__addr__ex_stage__L276 = EX__sdi_addr__ex_stage__L270;
assign EX__wdata__ex_stage__L277 = EX__srcl_val__ex_stage__L47;
assign v1136 = (EX__op_sdi__ex_stage__L75 ? EX__addr__ex_stage__L276 : EX__addr__ex_stage__L260);
assign v1137 = (EX__op_sdi__ex_stage__L75 ? EX__alu__ex_stage__L272 : EX__alu__ex_stage__L260);
assign v1138 = (EX__op_sdi__ex_stage__L75 ? EX__is_load__ex_stage__L273 : EX__is_load__ex_stage__L260);
assign v1139 = (EX__op_sdi__ex_stage__L75 ? EX__wdata__ex_stage__L277 : EX__wdata__ex_stage__L260);
assign v1140 = v1136;
assign v1141 = v1137;
assign v1142 = v1138;
assign v1143 = v1139;
assign EX__addr__ex_stage__L271 = v1140;
assign EX__alu__ex_stage__L271 = v1141;
assign EX__is_load__ex_stage__L271 = v1142;
assign EX__is_store__ex_stage__L271 = v1134;
assign EX__size__ex_stage__L271 = v1135;
assign EX__wdata__ex_stage__L271 = v1143;
pyc_mux #(.WIDTH(6)) v1144_inst (
  .sel(do_ex__linx_cpu_pyc__L105),
  .a(EX__op__ex_stage__L44),
  .b(exmem__op),
  .y(v1144)
);
assign exmem__op__next = v1144;
pyc_mux #(.WIDTH(3)) v1145_inst (
  .sel(do_ex__linx_cpu_pyc__L105),
  .a(EX__len_bytes__ex_stage__L45),
  .b(exmem__len_bytes),
  .y(v1145)
);
assign exmem__len_bytes__next = v1145;
pyc_mux #(.WIDTH(6)) v1146_inst (
  .sel(do_ex__linx_cpu_pyc__L105),
  .a(EX__regdst__ex_stage__L46),
  .b(exmem__regdst),
  .y(v1146)
);
assign exmem__regdst__next = v1146;
pyc_mux #(.WIDTH(64)) v1147_inst (
  .sel(do_ex__linx_cpu_pyc__L105),
  .a(EX__alu__ex_stage__L271),
  .b(exmem__alu),
  .y(v1147)
);
assign exmem__alu__next = v1147;
pyc_mux #(.WIDTH(1)) v1148_inst (
  .sel(do_ex__linx_cpu_pyc__L105),
  .a(EX__is_load__ex_stage__L271),
  .b(exmem__is_load),
  .y(v1148)
);
assign exmem__is_load__next = v1148;
pyc_mux #(.WIDTH(1)) v1149_inst (
  .sel(do_ex__linx_cpu_pyc__L105),
  .a(EX__is_store__ex_stage__L271),
  .b(exmem__is_store),
  .y(v1149)
);
assign exmem__is_store__next = v1149;
pyc_mux #(.WIDTH(3)) v1150_inst (
  .sel(do_ex__linx_cpu_pyc__L105),
  .a(EX__size__ex_stage__L271),
  .b(exmem__size),
  .y(v1150)
);
assign exmem__size__next = v1150;
pyc_mux #(.WIDTH(64)) v1151_inst (
  .sel(do_ex__linx_cpu_pyc__L105),
  .a(EX__addr__ex_stage__L271),
  .b(exmem__addr),
  .y(v1151)
);
assign exmem__addr__next = v1151;
pyc_mux #(.WIDTH(64)) v1152_inst (
  .sel(do_ex__linx_cpu_pyc__L105),
  .a(EX__wdata__ex_stage__L271),
  .b(exmem__wdata),
  .y(v1152)
);
assign exmem__wdata__next = v1152;
assign MEM__op__mem_stage__L12 = exmem__op;
assign MEM__len_bytes__mem_stage__L13 = exmem__len_bytes;
assign MEM__regdst__mem_stage__L14 = exmem__regdst;
assign MEM__alu__mem_stage__L15 = exmem__alu;
assign MEM__is_load__mem_stage__L16 = exmem__is_load;
assign MEM__is_store__mem_stage__L17 = exmem__is_store;
assign v1153 = mem_rdata__linx_cpu_pyc__L124[31:0];
assign MEM__load32__mem_stage__L20 = v1153;
assign v1154 = {{32{MEM__load32__mem_stage__L20[31]}}, MEM__load32__mem_stage__L20};
assign MEM__load64__mem_stage__L21 = v1154;
assign MEM__mem_val__mem_stage__L22 = MEM__alu__mem_stage__L15;
assign MEM__mem_val__mem_stage__L24 = MEM__load64__mem_stage__L21;
pyc_mux #(.WIDTH(64)) v1155_inst (
  .sel(MEM__is_load__mem_stage__L16),
  .a(MEM__mem_val__mem_stage__L24),
  .b(MEM__mem_val__mem_stage__L22),
  .y(v1155)
);
assign MEM__mem_val__mem_stage__L23 = v1155;
assign v1156 = (MEM__is_store__mem_stage__L17 ? v173 : MEM__mem_val__mem_stage__L23);
assign MEM__mem_val__mem_stage__L25 = v1156;
pyc_mux #(.WIDTH(6)) v1157_inst (
  .sel(do_mem__linx_cpu_pyc__L106),
  .a(MEM__op__mem_stage__L12),
  .b(memwb__op),
  .y(v1157)
);
assign memwb__op__next = v1157;
pyc_mux #(.WIDTH(3)) v1158_inst (
  .sel(do_mem__linx_cpu_pyc__L106),
  .a(MEM__len_bytes__mem_stage__L13),
  .b(memwb__len_bytes),
  .y(v1158)
);
assign memwb__len_bytes__next = v1158;
pyc_mux #(.WIDTH(6)) v1159_inst (
  .sel(do_mem__linx_cpu_pyc__L106),
  .a(MEM__regdst__mem_stage__L14),
  .b(memwb__regdst),
  .y(v1159)
);
assign memwb__regdst__next = v1159;
pyc_mux #(.WIDTH(64)) v1160_inst (
  .sel(do_mem__linx_cpu_pyc__L106),
  .a(MEM__mem_val__mem_stage__L25),
  .b(memwb__value),
  .y(v1160)
);
assign memwb__value__next = v1160;
assign WB__stage__wb_stage__L48 = state__stage;
assign WB__pc__wb_stage__L49 = state__pc;
assign WB__br_kind__wb_stage__L50 = state__br_kind;
assign WB__br_base_pc__wb_stage__L51 = state__br_base_pc;
assign WB__br_off__wb_stage__L52 = state__br_off;
assign WB__commit_cond__wb_stage__L53 = state__commit_cond;
assign WB__commit_tgt__wb_stage__L54 = state__commit_tgt;
assign WB__op__wb_stage__L56 = memwb__op;
assign WB__len_bytes__wb_stage__L57 = memwb__len_bytes;
assign WB__regdst__wb_stage__L58 = memwb__regdst;
assign WB__value__wb_stage__L59 = memwb__value;
pyc_mux #(.WIDTH(1)) v1161_inst (
  .sel(halt_set__linx_cpu_pyc__L99),
  .a(v178),
  .b(state__halted),
  .y(v1161)
);
assign state__halted__next = v1161;
assign v1162 = (WB__op__wb_stage__L56 == v139);
assign WB__op_c_bstart_std__wb_stage__L65 = v1162;
assign v1163 = (WB__op__wb_stage__L56 == v142);
assign WB__op_c_bstart_cond__wb_stage__L66 = v1163;
assign v1164 = (WB__op__wb_stage__L56 == v104);
assign WB__op_bstart_call__wb_stage__L67 = v1164;
assign v1165 = (WB__op__wb_stage__L56 == v137);
assign WB__op_c_bstop__wb_stage__L68 = v1165;
assign v1166 = (WB__op_c_bstart_std__wb_stage__L65 | WB__op_c_bstart_cond__wb_stage__L66);
assign v1167 = (v1166 | WB__op_bstart_call__wb_stage__L67);
assign v1168 = v1167;
assign WB__op_is_start_marker__wb_stage__L70 = v1168;
pyc_or #(.WIDTH(1)) v1169_inst (
  .a(WB__op_is_start_marker__wb_stage__L70),
  .b(WB__op_c_bstop__wb_stage__L68),
  .y(v1169)
);
assign WB__op_is_boundary__wb_stage__L71 = v1169;
assign v1170 = (WB__br_kind__wb_stage__L50 == v93);
assign WB__br_is_cond__wb_stage__L73 = v1170;
assign v1171 = (WB__br_kind__wb_stage__L50 == v92);
assign WB__br_is_call__wb_stage__L74 = v1171;
assign v1172 = (WB__br_kind__wb_stage__L50 == v91);
assign WB__br_is_ret__wb_stage__L75 = v1172;
pyc_add #(.WIDTH(64)) v1173_inst (
  .a(WB__br_base_pc__wb_stage__L51),
  .b(WB__br_off__wb_stage__L52),
  .y(v1173)
);
assign WB__br_target_pc__wb_stage__L77 = v1173;
assign WB__br_target_pc__wb_stage__L79 = WB__commit_tgt__wb_stage__L54;
pyc_mux #(.WIDTH(64)) v1174_inst (
  .sel(WB__br_is_ret__wb_stage__L75),
  .a(WB__br_target_pc__wb_stage__L79),
  .b(WB__br_target_pc__wb_stage__L77),
  .y(v1174)
);
assign WB__br_target_pc__wb_stage__L78 = v1174;
assign v1175 = (WB__br_is_call__wb_stage__L74 | WB__br_is_ret__wb_stage__L75);
assign v1176 = (WB__br_is_cond__wb_stage__L73 & WB__commit_cond__wb_stage__L53);
assign v1177 = (v1175 | v1176);
assign v1178 = v1177;
assign WB__br_take__wb_stage__L81 = v1178;
assign v1179 = {{61{1'b0}}, WB__len_bytes__wb_stage__L57};
assign v1180 = (WB__pc__wb_stage__L49 + v1179);
assign v1181 = v1180;
assign WB__pc_inc__wb_stage__L83 = v1181;
assign WB__pc_next__wb_stage__L84 = WB__pc_inc__wb_stage__L83;
pyc_and #(.WIDTH(1)) v1182_inst (
  .a(WB__op_is_boundary__wb_stage__L71),
  .b(WB__br_take__wb_stage__L81),
  .y(v1182)
);
assign WB__pc_next__wb_stage__L86 = WB__br_target_pc__wb_stage__L78;
pyc_mux #(.WIDTH(64)) v1183_inst (
  .sel(v1182),
  .a(WB__pc_next__wb_stage__L86),
  .b(WB__pc_next__wb_stage__L84),
  .y(v1183)
);
assign WB__pc_next__wb_stage__L85 = v1183;
pyc_mux #(.WIDTH(64)) v1184_inst (
  .sel(do_wb__linx_cpu_pyc__L107),
  .a(WB__pc_next__wb_stage__L85),
  .b(state__pc),
  .y(v1184)
);
assign state__pc__next = v1184;
assign WB__stage_seq__wb_stage__L90 = WB__stage__wb_stage__L48;
assign v1185 = (stage_is_if__linx_cpu_pyc__L93 ? v169 : WB__stage_seq__wb_stage__L90);
assign WB__stage_seq__wb_stage__L91 = v1185;
assign v1186 = (stage_is_id__linx_cpu_pyc__L94 ? v168 : WB__stage_seq__wb_stage__L91);
assign WB__stage_seq__wb_stage__L93 = v1186;
assign v1187 = (stage_is_ex__linx_cpu_pyc__L95 ? v167 : WB__stage_seq__wb_stage__L93);
assign WB__stage_seq__wb_stage__L95 = v1187;
assign v1188 = (stage_is_mem__linx_cpu_pyc__L96 ? v166 : WB__stage_seq__wb_stage__L95);
assign WB__stage_seq__wb_stage__L97 = v1188;
assign v1189 = (stage_is_wb__linx_cpu_pyc__L97 ? v176 : WB__stage_seq__wb_stage__L97);
assign WB__stage_seq__wb_stage__L99 = v1189;
pyc_mux #(.WIDTH(3)) v1190_inst (
  .sel(v257),
  .a(WB__stage_seq__wb_stage__L99),
  .b(state__stage),
  .y(v1190)
);
assign state__stage__next = v1190;
pyc_add #(.WIDTH(64)) v1191_inst (
  .a(state__cycles),
  .b(v172),
  .y(v1191)
);
assign state__cycles__next = v1191;
assign v1192 = (WB__op__wb_stage__L56 == v146);
assign WB__op_c_setc_eq__wb_stage__L108 = v1192;
assign v1193 = (WB__op__wb_stage__L56 == v152);
assign WB__op_c_setc_tgt__wb_stage__L109 = v1193;
assign WB__commit_cond_next__wb_stage__L111 = WB__commit_cond__wb_stage__L53;
assign WB__commit_tgt_next__wb_stage__L112 = WB__commit_tgt__wb_stage__L54;
pyc_and #(.WIDTH(1)) v1194_inst (
  .a(do_wb__linx_cpu_pyc__L107),
  .b(WB__op_is_boundary__wb_stage__L71),
  .y(v1194)
);
assign v1195 = (v1194 ? v177 : WB__commit_cond_next__wb_stage__L111);
assign v1196 = (v1194 ? v173 : WB__commit_tgt_next__wb_stage__L112);
assign WB__commit_cond_next__wb_stage__L114 = v1195;
assign WB__commit_tgt_next__wb_stage__L114 = v1196;
assign v1197 = (do_wb__linx_cpu_pyc__L107 & WB__op_c_setc_eq__wb_stage__L108);
assign v1198 = WB__value__wb_stage__L59[0];
assign v1199 = v1197;
assign v1200 = v1198;
assign WB__commit_cond_next__wb_stage__L118 = v1200;
pyc_mux #(.WIDTH(1)) v1201_inst (
  .sel(v1199),
  .a(WB__commit_cond_next__wb_stage__L118),
  .b(WB__commit_cond_next__wb_stage__L114),
  .y(v1201)
);
assign WB__commit_cond_next__wb_stage__L117 = v1201;
pyc_and #(.WIDTH(1)) v1202_inst (
  .a(do_wb__linx_cpu_pyc__L107),
  .b(WB__op_c_setc_tgt__wb_stage__L109),
  .y(v1202)
);
assign WB__commit_tgt_next__wb_stage__L120 = WB__value__wb_stage__L59;
pyc_mux #(.WIDTH(64)) v1203_inst (
  .sel(v1202),
  .a(WB__commit_tgt_next__wb_stage__L120),
  .b(WB__commit_tgt_next__wb_stage__L114),
  .y(v1203)
);
assign WB__commit_tgt_next__wb_stage__L119 = v1203;
assign state__commit_cond__next = WB__commit_cond_next__wb_stage__L117;
assign state__commit_tgt__next = WB__commit_tgt_next__wb_stage__L119;
assign WB__br_kind_next__wb_stage__L127 = WB__br_kind__wb_stage__L50;
assign WB__br_base_next__wb_stage__L128 = WB__br_base_pc__wb_stage__L51;
assign WB__br_off_next__wb_stage__L129 = WB__br_off__wb_stage__L52;
pyc_and #(.WIDTH(1)) v1204_inst (
  .a(v1194),
  .b(WB__br_take__wb_stage__L81),
  .y(v1204)
);
assign v1205 = (v1204 ? v171 : WB__br_kind_next__wb_stage__L127);
assign v1206 = (v1204 ? v173 : WB__br_off_next__wb_stage__L129);
assign WB__br_base_next__wb_stage__L134 = WB__pc__wb_stage__L49;
pyc_mux #(.WIDTH(64)) v1207_inst (
  .sel(v1204),
  .a(WB__br_base_next__wb_stage__L134),
  .b(WB__br_base_next__wb_stage__L128),
  .y(v1207)
);
assign WB__br_base_next__wb_stage__L132 = v1207;
assign WB__br_kind_next__wb_stage__L132 = v1205;
assign WB__br_off_next__wb_stage__L132 = v1206;
assign v1208 = (do_wb__linx_cpu_pyc__L107 & WB__op_is_start_marker__wb_stage__L70);
assign v1209 = (~WB__br_take__wb_stage__L81);
assign v1210 = (v1208 & v1209);
assign v1211 = v1208;
assign v1212 = v1210;
assign WB__enter_new_block__wb_stage__L137 = v1212;
pyc_and #(.WIDTH(1)) v1213_inst (
  .a(WB__enter_new_block__wb_stage__L137),
  .b(WB__op_c_bstart_cond__wb_stage__L66),
  .y(v1213)
);
assign v1214 = (v1213 ? v93 : WB__br_kind_next__wb_stage__L132);
assign WB__br_base_next__wb_stage__L142 = WB__pc__wb_stage__L49;
assign WB__br_off_next__wb_stage__L143 = WB__value__wb_stage__L59;
assign v1215 = (v1213 ? WB__br_base_next__wb_stage__L142 : WB__br_base_next__wb_stage__L132);
assign v1216 = (v1213 ? WB__br_off_next__wb_stage__L143 : WB__br_off_next__wb_stage__L132);
assign v1217 = v1215;
assign v1218 = v1216;
assign WB__br_base_next__wb_stage__L140 = v1217;
assign WB__br_kind_next__wb_stage__L140 = v1214;
assign WB__br_off_next__wb_stage__L140 = v1218;
pyc_and #(.WIDTH(1)) v1219_inst (
  .a(WB__enter_new_block__wb_stage__L137),
  .b(WB__op_bstart_call__wb_stage__L67),
  .y(v1219)
);
assign v1220 = (v1219 ? v92 : WB__br_kind_next__wb_stage__L140);
assign WB__br_base_next__wb_stage__L148 = WB__pc__wb_stage__L49;
assign WB__br_off_next__wb_stage__L149 = WB__value__wb_stage__L59;
assign v1221 = (v1219 ? WB__br_base_next__wb_stage__L148 : WB__br_base_next__wb_stage__L140);
assign v1222 = (v1219 ? WB__br_off_next__wb_stage__L149 : WB__br_off_next__wb_stage__L140);
assign v1223 = v1221;
assign v1224 = v1222;
assign WB__br_base_next__wb_stage__L146 = v1223;
assign WB__br_kind_next__wb_stage__L146 = v1220;
assign WB__br_off_next__wb_stage__L146 = v1224;
assign v1225 = WB__value__wb_stage__L59[2:0];
assign WB__brtype__wb_stage__L152 = v1225;
assign v1226 = (WB__brtype__wb_stage__L152 == v90);
assign v1227 = (v1226 ? v91 : v171);
assign WB__kind_from_brtype__wb_stage__L154 = v1227;
pyc_and #(.WIDTH(1)) v1228_inst (
  .a(WB__enter_new_block__wb_stage__L137),
  .b(WB__op_c_bstart_std__wb_stage__L65),
  .y(v1228)
);
assign v1229 = (v1228 ? v173 : WB__br_off_next__wb_stage__L146);
assign WB__br_kind_next__wb_stage__L157 = WB__kind_from_brtype__wb_stage__L154;
assign WB__br_base_next__wb_stage__L158 = WB__pc__wb_stage__L49;
assign v1230 = (v1228 ? WB__br_base_next__wb_stage__L158 : WB__br_base_next__wb_stage__L146);
assign v1231 = (v1228 ? WB__br_kind_next__wb_stage__L157 : WB__br_kind_next__wb_stage__L146);
assign v1232 = v1230;
assign v1233 = v1231;
assign WB__br_base_next__wb_stage__L156 = v1232;
assign WB__br_kind_next__wb_stage__L156 = v1233;
assign WB__br_off_next__wb_stage__L156 = v1229;
pyc_and #(.WIDTH(1)) v1234_inst (
  .a(do_wb__linx_cpu_pyc__L107),
  .b(WB__op_c_bstop__wb_stage__L68),
  .y(v1234)
);
assign v1235 = (v1234 ? v171 : WB__br_kind_next__wb_stage__L156);
assign v1236 = (v1234 ? v173 : WB__br_off_next__wb_stage__L156);
assign WB__br_base_next__wb_stage__L164 = WB__pc__wb_stage__L49;
pyc_mux #(.WIDTH(64)) v1237_inst (
  .sel(v1234),
  .a(WB__br_base_next__wb_stage__L164),
  .b(WB__br_base_next__wb_stage__L156),
  .y(v1237)
);
assign WB__br_base_next__wb_stage__L162 = v1237;
assign WB__br_kind_next__wb_stage__L162 = v1235;
assign WB__br_off_next__wb_stage__L162 = v1236;
assign state__br_kind__next = WB__br_kind_next__wb_stage__L162;
assign state__br_base_pc__next = WB__br_base_next__wb_stage__L162;
assign state__br_off__next = WB__br_off_next__wb_stage__L162;
assign v1238 = (WB__op__wb_stage__L56 == v155);
assign v1239 = (WB__op__wb_stage__L56 == v153);
assign v1240 = (v1238 | v1239);
assign v1241 = v1240;
assign WB__wb_is_store__wb_stage__L172 = v1241;
assign v1242 = (~WB__wb_is_store__wb_stage__L172);
assign v1243 = (do_wb__linx_cpu_pyc__L107 & v1242);
assign v1244 = (WB__regdst__wb_stage__L58 == v170);
assign v1245 = (~v1244);
assign v1246 = (v1243 & v1245);
assign v1247 = v1246;
assign WB__do_reg_write__wb_stage__L173 = v1247;
assign WB__do_clear_hands__wb_stage__L175 = v1211;
assign v1248 = (WB__op__wb_stage__L56 == v150);
assign v1249 = (do_wb__linx_cpu_pyc__L107 & v1248);
assign v1250 = v1249;
assign WB__do_push_t__wb_stage__L176 = v1250;
assign v1251 = (WB__regdst__wb_stage__L58 == v95);
assign v1252 = (WB__do_reg_write__wb_stage__L173 & v1251);
assign v1253 = (WB__do_push_t__wb_stage__L176 | v1252);
assign v1254 = v1253;
assign WB__do_push_t__wb_stage__L178 = v1254;
assign v1255 = (WB__regdst__wb_stage__L58 == v96);
assign v1256 = (WB__do_reg_write__wb_stage__L173 & v1255);
assign v1257 = v1256;
assign WB__do_push_u__wb_stage__L179 = v1257;
assign gpr__r0__next = v173;
assign v1258 = (memwb__regdst == v139);
assign v1259 = (WB__do_reg_write__wb_stage__L173 & v1258);
assign v1260 = (v1259 ? memwb__value : gpr__r1);
assign v1261 = v1260;
assign gpr__r1__next = v1261;
assign v1262 = (memwb__regdst == v137);
assign v1263 = (WB__do_reg_write__wb_stage__L173 & v1262);
assign v1264 = (v1263 ? memwb__value : gpr__r2);
assign v1265 = v1264;
assign gpr__r2__next = v1265;
assign v1266 = (memwb__regdst == v148);
assign v1267 = (WB__do_reg_write__wb_stage__L173 & v1266);
assign v1268 = (v1267 ? memwb__value : gpr__r3);
assign v1269 = v1268;
assign gpr__r3__next = v1269;
assign v1270 = (memwb__regdst == v150);
assign v1271 = (WB__do_reg_write__wb_stage__L173 & v1270);
assign v1272 = (v1271 ? memwb__value : gpr__r4);
assign v1273 = v1272;
assign gpr__r4__next = v1273;
assign v1274 = (memwb__regdst == v153);
assign v1275 = (WB__do_reg_write__wb_stage__L173 & v1274);
assign v1276 = (v1275 ? memwb__value : gpr__r5);
assign v1277 = v1276;
assign gpr__r5__next = v1277;
assign v1278 = (memwb__regdst == v115);
assign v1279 = (WB__do_reg_write__wb_stage__L173 & v1278);
assign v1280 = (v1279 ? memwb__value : gpr__r6);
assign v1281 = v1280;
assign gpr__r6__next = v1281;
assign v1282 = (memwb__regdst == v117);
assign v1283 = (WB__do_reg_write__wb_stage__L173 & v1282);
assign v1284 = (v1283 ? memwb__value : gpr__r7);
assign v1285 = v1284;
assign gpr__r7__next = v1285;
assign v1286 = (memwb__regdst == v119);
assign v1287 = (WB__do_reg_write__wb_stage__L173 & v1286);
assign v1288 = (v1287 ? memwb__value : gpr__r8);
assign v1289 = v1288;
assign gpr__r8__next = v1289;
assign v1290 = (memwb__regdst == v121);
assign v1291 = (WB__do_reg_write__wb_stage__L173 & v1290);
assign v1292 = (v1291 ? memwb__value : gpr__r9);
assign v1293 = v1292;
assign gpr__r9__next = v1293;
assign v1294 = (memwb__regdst == v155);
assign v1295 = (WB__do_reg_write__wb_stage__L173 & v1294);
assign v1296 = (v1295 ? memwb__value : gpr__r10);
assign v1297 = v1296;
assign gpr__r10__next = v1297;
assign v1298 = (memwb__regdst == v128);
assign v1299 = (WB__do_reg_write__wb_stage__L173 & v1298);
assign v1300 = (v1299 ? memwb__value : gpr__r11);
assign v1301 = v1300;
assign gpr__r11__next = v1301;
assign v1302 = (memwb__regdst == v130);
assign v1303 = (WB__do_reg_write__wb_stage__L173 & v1302);
assign v1304 = (v1303 ? memwb__value : gpr__r12);
assign v1305 = v1304;
assign gpr__r12__next = v1305;
assign v1306 = (memwb__regdst == v132);
assign v1307 = (WB__do_reg_write__wb_stage__L173 & v1306);
assign v1308 = (v1307 ? memwb__value : gpr__r13);
assign v1309 = v1308;
assign gpr__r13__next = v1309;
assign v1310 = (memwb__regdst == v134);
assign v1311 = (WB__do_reg_write__wb_stage__L173 & v1310);
assign v1312 = (v1311 ? memwb__value : gpr__r14);
assign v1313 = v1312;
assign gpr__r14__next = v1313;
assign v1314 = (memwb__regdst == v112);
assign v1315 = (WB__do_reg_write__wb_stage__L173 & v1314);
assign v1316 = (v1315 ? memwb__value : gpr__r15);
assign v1317 = v1316;
assign gpr__r15__next = v1317;
assign v1318 = (memwb__regdst == v126);
assign v1319 = (WB__do_reg_write__wb_stage__L173 & v1318);
assign v1320 = (v1319 ? memwb__value : gpr__r16);
assign v1321 = v1320;
assign gpr__r16__next = v1321;
assign v1322 = (memwb__regdst == v100);
assign v1323 = (WB__do_reg_write__wb_stage__L173 & v1322);
assign v1324 = (v1323 ? memwb__value : gpr__r17);
assign v1325 = v1324;
assign gpr__r17__next = v1325;
assign v1326 = (memwb__regdst == v165);
assign v1327 = (WB__do_reg_write__wb_stage__L173 & v1326);
assign v1328 = (v1327 ? memwb__value : gpr__r18);
assign v1329 = v1328;
assign gpr__r18__next = v1329;
assign v1330 = (memwb__regdst == v142);
assign v1331 = (WB__do_reg_write__wb_stage__L173 & v1330);
assign v1332 = (v1331 ? memwb__value : gpr__r19);
assign v1333 = v1332;
assign gpr__r19__next = v1333;
assign v1334 = (memwb__regdst == v104);
assign v1335 = (WB__do_reg_write__wb_stage__L173 & v1334);
assign v1336 = (v1335 ? memwb__value : gpr__r20);
assign v1337 = v1336;
assign gpr__r20__next = v1337;
assign v1338 = (memwb__regdst == v159);
assign v1339 = (WB__do_reg_write__wb_stage__L173 & v1338);
assign v1340 = (v1339 ? memwb__value : gpr__r21);
assign v1341 = v1340;
assign gpr__r21__next = v1341;
assign v1342 = (memwb__regdst == v156);
assign v1343 = (WB__do_reg_write__wb_stage__L173 & v1342);
assign v1344 = (v1343 ? memwb__value : gpr__r22);
assign v1345 = v1344;
assign gpr__r22__next = v1345;
assign v1346 = (memwb__regdst == v146);
assign v1347 = (WB__do_reg_write__wb_stage__L173 & v1346);
assign v1348 = (v1347 ? memwb__value : gpr__r23);
assign v1349 = v1348;
assign gpr__r23__next = v1349;
assign WB__n0__regfile__L43 = t__r0;
assign WB__n1__regfile__L44 = t__r1;
assign WB__n2__regfile__L45 = t__r2;
assign WB__n3__regfile__L46 = t__r3;
assign WB__n3__regfile__L49 = WB__n2__regfile__L45;
assign WB__n2__regfile__L50 = WB__n1__regfile__L44;
assign WB__n1__regfile__L51 = WB__n0__regfile__L43;
assign WB__n0__regfile__L52 = memwb__value;
assign v1350 = (WB__do_push_t__wb_stage__L178 ? WB__n0__regfile__L52 : WB__n0__regfile__L43);
assign v1351 = (WB__do_push_t__wb_stage__L178 ? WB__n1__regfile__L51 : WB__n1__regfile__L44);
assign v1352 = (WB__do_push_t__wb_stage__L178 ? WB__n2__regfile__L50 : WB__n2__regfile__L45);
assign v1353 = (WB__do_push_t__wb_stage__L178 ? WB__n3__regfile__L49 : WB__n3__regfile__L46);
assign v1354 = v1350;
assign v1355 = v1351;
assign v1356 = v1352;
assign v1357 = v1353;
assign WB__n0__regfile__L48 = v1354;
assign WB__n1__regfile__L48 = v1355;
assign WB__n2__regfile__L48 = v1356;
assign WB__n3__regfile__L48 = v1357;
assign v1358 = (WB__do_clear_hands__wb_stage__L175 ? v173 : WB__n0__regfile__L48);
assign v1359 = (WB__do_clear_hands__wb_stage__L175 ? v173 : WB__n1__regfile__L48);
assign v1360 = (WB__do_clear_hands__wb_stage__L175 ? v173 : WB__n2__regfile__L48);
assign v1361 = (WB__do_clear_hands__wb_stage__L175 ? v173 : WB__n3__regfile__L48);
assign WB__n0__regfile__L55 = v1358;
assign WB__n1__regfile__L55 = v1359;
assign WB__n2__regfile__L55 = v1360;
assign WB__n3__regfile__L55 = v1361;
assign WB__n0__regfile__L43_2 = u__r0;
assign WB__n1__regfile__L44_2 = u__r1;
assign WB__n2__regfile__L45_2 = u__r2;
assign WB__n3__regfile__L46_2 = u__r3;
assign WB__n3__regfile__L49_2 = WB__n2__regfile__L45_2;
assign WB__n2__regfile__L50_2 = WB__n1__regfile__L44_2;
assign WB__n1__regfile__L51_2 = WB__n0__regfile__L43_2;
assign v1362 = (WB__do_push_u__wb_stage__L179 ? WB__n0__regfile__L52 : WB__n0__regfile__L43_2);
assign v1363 = (WB__do_push_u__wb_stage__L179 ? WB__n1__regfile__L51_2 : WB__n1__regfile__L44_2);
assign v1364 = (WB__do_push_u__wb_stage__L179 ? WB__n2__regfile__L50_2 : WB__n2__regfile__L45_2);
assign v1365 = (WB__do_push_u__wb_stage__L179 ? WB__n3__regfile__L49_2 : WB__n3__regfile__L46_2);
assign v1366 = v1362;
assign v1367 = v1363;
assign v1368 = v1364;
assign v1369 = v1365;
assign WB__n0__regfile__L48_2 = v1366;
assign WB__n1__regfile__L48_2 = v1367;
assign WB__n2__regfile__L48_2 = v1368;
assign WB__n3__regfile__L48_2 = v1369;
assign v1370 = (WB__do_clear_hands__wb_stage__L175 ? v173 : WB__n0__regfile__L48_2);
assign v1371 = (WB__do_clear_hands__wb_stage__L175 ? v173 : WB__n1__regfile__L48_2);
assign v1372 = (WB__do_clear_hands__wb_stage__L175 ? v173 : WB__n2__regfile__L48_2);
assign v1373 = (WB__do_clear_hands__wb_stage__L175 ? v173 : WB__n3__regfile__L48_2);
assign WB__n0__regfile__L55_2 = v1370;
assign WB__n1__regfile__L55_2 = v1371;
assign WB__n2__regfile__L55_2 = v1372;
assign WB__n3__regfile__L55_2 = v1373;
assign t__r0__next = WB__n0__regfile__L55;
assign t__r1__next = WB__n1__regfile__L55;
assign t__r2__next = WB__n2__regfile__L55;
assign t__r3__next = WB__n3__regfile__L55;
assign u__r0__next = WB__n0__regfile__L55_2;
assign u__r1__next = WB__n1__regfile__L55_2;
assign u__r2__next = WB__n2__regfile__L55_2;
assign u__r3__next = WB__n3__regfile__L55_2;
assign halted = state__halted;
assign pc = state__pc;
assign stage = state__stage;
assign cycles = state__cycles;
assign a0 = gpr__r2;
assign a1 = gpr__r3;
assign ra = gpr__r10;
assign sp = gpr__r1;
assign br_kind = state__br_kind;
assign if_window = ifid__window;
assign wb_op = memwb__op;
assign wb_regdst = memwb__regdst;
assign wb_value = memwb__value;
assign commit_cond = state__commit_cond;
assign commit_tgt = state__commit_tgt;

endmodule

