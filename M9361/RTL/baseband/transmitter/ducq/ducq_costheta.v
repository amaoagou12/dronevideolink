module ducq_costheta(
  input  wire [ 8:0] addr,
  output reg  [ 7:0] q
);
  always @* begin
    case (addr)
      9'h000: q = 8'hFF;
      9'h001: q = 8'hFF;
      9'h002: q = 8'hFF;
      9'h003: q = 8'hFF;
      9'h004: q = 8'hFF;
      9'h005: q = 8'hFF;
      9'h006: q = 8'hFF;
      9'h007: q = 8'hFF;
      9'h008: q = 8'hFF;
      9'h009: q = 8'hFF;
      9'h00A: q = 8'hFF;
      9'h00B: q = 8'hFF;
      9'h00C: q = 8'hFF;
      9'h00D: q = 8'hFF;
      9'h00E: q = 8'hFF;
      9'h00F: q = 8'hFF;
      9'h010: q = 8'hFF;
      9'h011: q = 8'hFF;
      9'h012: q = 8'hFF;
      9'h013: q = 8'hFF;
      9'h014: q = 8'hFF;
      9'h015: q = 8'hFF;
      9'h016: q = 8'hFF;
      9'h017: q = 8'hFF;
      9'h018: q = 8'hFF;
      9'h019: q = 8'hFF;
      9'h01A: q = 8'hFF;
      9'h01B: q = 8'hFF;
      9'h01C: q = 8'hFF;
      9'h01D: q = 8'hFF;
      9'h01E: q = 8'hFF;
      9'h01F: q = 8'hFF;
      9'h020: q = 8'hFF;
      9'h021: q = 8'hFF;
      9'h022: q = 8'hFF;
      9'h023: q = 8'hFF;
      9'h024: q = 8'hFF;
      9'h025: q = 8'hFF;
      9'h026: q = 8'hFF;
      9'h027: q = 8'hFF;
      9'h028: q = 8'hFF;
      9'h029: q = 8'hFF;
      9'h02A: q = 8'hFF;
      9'h02B: q = 8'hFF;
      9'h02C: q = 8'hFF;
      9'h02D: q = 8'hFF;
      9'h02E: q = 8'hFF;
      9'h02F: q = 8'hFF;
      9'h030: q = 8'hFF;
      9'h031: q = 8'hFF;
      9'h032: q = 8'hFF;
      9'h033: q = 8'hFF;
      9'h034: q = 8'hFF;
      9'h035: q = 8'hFF;
      9'h036: q = 8'hFF;
      9'h037: q = 8'hFF;
      9'h038: q = 8'hFF;
      9'h039: q = 8'hFF;
      9'h03A: q = 8'hFF;
      9'h03B: q = 8'hFF;
      9'h03C: q = 8'hFF;
      9'h03D: q = 8'hFF;
      9'h03E: q = 8'hFF;
      9'h03F: q = 8'hFF;
      9'h040: q = 8'hFF;
      9'h041: q = 8'hFF;
      9'h042: q = 8'hFF;
      9'h043: q = 8'hFF;
      9'h044: q = 8'hFF;
      9'h045: q = 8'hFF;
      9'h046: q = 8'hFF;
      9'h047: q = 8'hFE;
      9'h048: q = 8'hFE;
      9'h049: q = 8'hFE;
      9'h04A: q = 8'hFE;
      9'h04B: q = 8'hFE;
      9'h04C: q = 8'hFE;
      9'h04D: q = 8'hFE;
      9'h04E: q = 8'hFE;
      9'h04F: q = 8'hFE;
      9'h050: q = 8'hFE;
      9'h051: q = 8'hFE;
      9'h052: q = 8'hFE;
      9'h053: q = 8'hFE;
      9'h054: q = 8'hFE;
      9'h055: q = 8'hFE;
      9'h056: q = 8'hFE;
      9'h057: q = 8'hFE;
      9'h058: q = 8'hFE;
      9'h059: q = 8'hFE;
      9'h05A: q = 8'hFE;
      9'h05B: q = 8'hFE;
      9'h05C: q = 8'hFD;
      9'h05D: q = 8'hFD;
      9'h05E: q = 8'hFD;
      9'h05F: q = 8'hFD;
      9'h060: q = 8'hFD;
      9'h061: q = 8'hFD;
      9'h062: q = 8'hFD;
      9'h063: q = 8'hFD;
      9'h064: q = 8'hFD;
      9'h065: q = 8'hFD;
      9'h066: q = 8'hFD;
      9'h067: q = 8'hFD;
      9'h068: q = 8'hFD;
      9'h069: q = 8'hFD;
      9'h06A: q = 8'hFD;
      9'h06B: q = 8'hFD;
      9'h06C: q = 8'hFC;
      9'h06D: q = 8'hFC;
      9'h06E: q = 8'hFC;
      9'h06F: q = 8'hFC;
      9'h070: q = 8'hFC;
      9'h071: q = 8'hFC;
      9'h072: q = 8'hFC;
      9'h073: q = 8'hFC;
      9'h074: q = 8'hFC;
      9'h075: q = 8'hFC;
      9'h076: q = 8'hFC;
      9'h077: q = 8'hFC;
      9'h078: q = 8'hFC;
      9'h079: q = 8'hFC;
      9'h07A: q = 8'hFC;
      9'h07B: q = 8'hFB;
      9'h07C: q = 8'hFB;
      9'h07D: q = 8'hFB;
      9'h07E: q = 8'hFB;
      9'h07F: q = 8'hFB;
      9'h080: q = 8'hFB;
      9'h081: q = 8'hFB;
      9'h082: q = 8'hFB;
      9'h083: q = 8'hFB;
      9'h084: q = 8'hFB;
      9'h085: q = 8'hFB;
      9'h086: q = 8'hFB;
      9'h087: q = 8'hFB;
      9'h088: q = 8'hFA;
      9'h089: q = 8'hFA;
      9'h08A: q = 8'hFA;
      9'h08B: q = 8'hFA;
      9'h08C: q = 8'hFA;
      9'h08D: q = 8'hFA;
      9'h08E: q = 8'hFA;
      9'h08F: q = 8'hFA;
      9'h090: q = 8'hFA;
      9'h091: q = 8'hFA;
      9'h092: q = 8'hFA;
      9'h093: q = 8'hFA;
      9'h094: q = 8'hF9;
      9'h095: q = 8'hF9;
      9'h096: q = 8'hF9;
      9'h097: q = 8'hF9;
      9'h098: q = 8'hF9;
      9'h099: q = 8'hF9;
      9'h09A: q = 8'hF9;
      9'h09B: q = 8'hF9;
      9'h09C: q = 8'hF9;
      9'h09D: q = 8'hF9;
      9'h09E: q = 8'hF9;
      9'h09F: q = 8'hF8;
      9'h0A0: q = 8'hF8;
      9'h0A1: q = 8'hF8;
      9'h0A2: q = 8'hF8;
      9'h0A3: q = 8'hF8;
      9'h0A4: q = 8'hF8;
      9'h0A5: q = 8'hF8;
      9'h0A6: q = 8'hF8;
      9'h0A7: q = 8'hF8;
      9'h0A8: q = 8'hF8;
      9'h0A9: q = 8'hF7;
      9'h0AA: q = 8'hF7;
      9'h0AB: q = 8'hF7;
      9'h0AC: q = 8'hF7;
      9'h0AD: q = 8'hF7;
      9'h0AE: q = 8'hF7;
      9'h0AF: q = 8'hF7;
      9'h0B0: q = 8'hF7;
      9'h0B1: q = 8'hF7;
      9'h0B2: q = 8'hF7;
      9'h0B3: q = 8'hF6;
      9'h0B4: q = 8'hF6;
      9'h0B5: q = 8'hF6;
      9'h0B6: q = 8'hF6;
      9'h0B7: q = 8'hF6;
      9'h0B8: q = 8'hF6;
      9'h0B9: q = 8'hF6;
      9'h0BA: q = 8'hF6;
      9'h0BB: q = 8'hF6;
      9'h0BC: q = 8'hF5;
      9'h0BD: q = 8'hF5;
      9'h0BE: q = 8'hF5;
      9'h0BF: q = 8'hF5;
      9'h0C0: q = 8'hF5;
      9'h0C1: q = 8'hF5;
      9'h0C2: q = 8'hF5;
      9'h0C3: q = 8'hF5;
      9'h0C4: q = 8'hF5;
      9'h0C5: q = 8'hF4;
      9'h0C6: q = 8'hF4;
      9'h0C7: q = 8'hF4;
      9'h0C8: q = 8'hF4;
      9'h0C9: q = 8'hF4;
      9'h0CA: q = 8'hF4;
      9'h0CB: q = 8'hF4;
      9'h0CC: q = 8'hF4;
      9'h0CD: q = 8'hF3;
      9'h0CE: q = 8'hF3;
      9'h0CF: q = 8'hF3;
      9'h0D0: q = 8'hF3;
      9'h0D1: q = 8'hF3;
      9'h0D2: q = 8'hF3;
      9'h0D3: q = 8'hF3;
      9'h0D4: q = 8'hF3;
      9'h0D5: q = 8'hF2;
      9'h0D6: q = 8'hF2;
      9'h0D7: q = 8'hF2;
      9'h0D8: q = 8'hF2;
      9'h0D9: q = 8'hF2;
      9'h0DA: q = 8'hF2;
      9'h0DB: q = 8'hF2;
      9'h0DC: q = 8'hF2;
      9'h0DD: q = 8'hF1;
      9'h0DE: q = 8'hF1;
      9'h0DF: q = 8'hF1;
      9'h0E0: q = 8'hF1;
      9'h0E1: q = 8'hF1;
      9'h0E2: q = 8'hF1;
      9'h0E3: q = 8'hF1;
      9'h0E4: q = 8'hF1;
      9'h0E5: q = 8'hF0;
      9'h0E6: q = 8'hF0;
      9'h0E7: q = 8'hF0;
      9'h0E8: q = 8'hF0;
      9'h0E9: q = 8'hF0;
      9'h0EA: q = 8'hF0;
      9'h0EB: q = 8'hF0;
      9'h0EC: q = 8'hEF;
      9'h0ED: q = 8'hEF;
      9'h0EE: q = 8'hEF;
      9'h0EF: q = 8'hEF;
      9'h0F0: q = 8'hEF;
      9'h0F1: q = 8'hEF;
      9'h0F2: q = 8'hEF;
      9'h0F3: q = 8'hEE;
      9'h0F4: q = 8'hEE;
      9'h0F5: q = 8'hEE;
      9'h0F6: q = 8'hEE;
      9'h0F7: q = 8'hEE;
      9'h0F8: q = 8'hEE;
      9'h0F9: q = 8'hEE;
      9'h0FA: q = 8'hED;
      9'h0FB: q = 8'hED;
      9'h0FC: q = 8'hED;
      9'h0FD: q = 8'hED;
      9'h0FE: q = 8'hED;
      9'h0FF: q = 8'hED;
      9'h100: q = 8'hED;
      9'h101: q = 8'hEC;
      9'h102: q = 8'hEC;
      9'h103: q = 8'hEC;
      9'h104: q = 8'hEC;
      9'h105: q = 8'hEC;
      9'h106: q = 8'hEC;
      9'h107: q = 8'hEB;
      9'h108: q = 8'hEB;
      9'h109: q = 8'hEB;
      9'h10A: q = 8'hEB;
      9'h10B: q = 8'hEB;
      9'h10C: q = 8'hEB;
      9'h10D: q = 8'hEB;
      9'h10E: q = 8'hEA;
      9'h10F: q = 8'hEA;
      9'h110: q = 8'hEA;
      9'h111: q = 8'hEA;
      9'h112: q = 8'hEA;
      9'h113: q = 8'hEA;
      9'h114: q = 8'hE9;
      9'h115: q = 8'hE9;
      9'h116: q = 8'hE9;
      9'h117: q = 8'hE9;
      9'h118: q = 8'hE9;
      9'h119: q = 8'hE9;
      9'h11A: q = 8'hE8;
      9'h11B: q = 8'hE8;
      9'h11C: q = 8'hE8;
      9'h11D: q = 8'hE8;
      9'h11E: q = 8'hE8;
      9'h11F: q = 8'hE8;
      9'h120: q = 8'hE7;
      9'h121: q = 8'hE7;
      9'h122: q = 8'hE7;
      9'h123: q = 8'hE7;
      9'h124: q = 8'hE7;
      9'h125: q = 8'hE7;
      9'h126: q = 8'hE6;
      9'h127: q = 8'hE6;
      9'h128: q = 8'hE6;
      9'h129: q = 8'hE6;
      9'h12A: q = 8'hE6;
      9'h12B: q = 8'hE6;
      9'h12C: q = 8'hE5;
      9'h12D: q = 8'hE5;
      9'h12E: q = 8'hE5;
      9'h12F: q = 8'hE5;
      9'h130: q = 8'hE5;
      9'h131: q = 8'hE4;
      9'h132: q = 8'hE4;
      9'h133: q = 8'hE4;
      9'h134: q = 8'hE4;
      9'h135: q = 8'hE4;
      9'h136: q = 8'hE4;
      9'h137: q = 8'hE3;
      9'h138: q = 8'hE3;
      9'h139: q = 8'hE3;
      9'h13A: q = 8'hE3;
      9'h13B: q = 8'hE3;
      9'h13C: q = 8'hE3;
      9'h13D: q = 8'hE2;
      9'h13E: q = 8'hE2;
      9'h13F: q = 8'hE2;
      9'h140: q = 8'hE2;
      9'h141: q = 8'hE2;
      9'h142: q = 8'hE1;
      9'h143: q = 8'hE1;
      9'h144: q = 8'hE1;
      9'h145: q = 8'hE1;
      9'h146: q = 8'hE1;
      9'h147: q = 8'hE0;
      9'h148: q = 8'hE0;
      9'h149: q = 8'hE0;
      9'h14A: q = 8'hE0;
      9'h14B: q = 8'hE0;
      9'h14C: q = 8'hE0;
      9'h14D: q = 8'hDF;
      9'h14E: q = 8'hDF;
      9'h14F: q = 8'hDF;
      9'h150: q = 8'hDF;
      9'h151: q = 8'hDF;
      9'h152: q = 8'hDE;
      9'h153: q = 8'hDE;
      9'h154: q = 8'hDE;
      9'h155: q = 8'hDE;
      9'h156: q = 8'hDE;
      9'h157: q = 8'hDD;
      9'h158: q = 8'hDD;
      9'h159: q = 8'hDD;
      9'h15A: q = 8'hDD;
      9'h15B: q = 8'hDD;
      9'h15C: q = 8'hDC;
      9'h15D: q = 8'hDC;
      9'h15E: q = 8'hDC;
      9'h15F: q = 8'hDC;
      9'h160: q = 8'hDC;
      9'h161: q = 8'hDB;
      9'h162: q = 8'hDB;
      9'h163: q = 8'hDB;
      9'h164: q = 8'hDB;
      9'h165: q = 8'hDB;
      9'h166: q = 8'hDA;
      9'h167: q = 8'hDA;
      9'h168: q = 8'hDA;
      9'h169: q = 8'hDA;
      9'h16A: q = 8'hDA;
      9'h16B: q = 8'hD9;
      9'h16C: q = 8'hD9;
      9'h16D: q = 8'hD9;
      9'h16E: q = 8'hD9;
      9'h16F: q = 8'hD8;
      9'h170: q = 8'hD8;
      9'h171: q = 8'hD8;
      9'h172: q = 8'hD8;
      9'h173: q = 8'hD8;
      9'h174: q = 8'hD7;
      9'h175: q = 8'hD7;
      9'h176: q = 8'hD7;
      9'h177: q = 8'hD7;
      9'h178: q = 8'hD7;
      9'h179: q = 8'hD6;
      9'h17A: q = 8'hD6;
      9'h17B: q = 8'hD6;
      9'h17C: q = 8'hD6;
      9'h17D: q = 8'hD6;
      9'h17E: q = 8'hD5;
      9'h17F: q = 8'hD5;
      9'h180: q = 8'hD5;
      9'h181: q = 8'hD5;
      9'h182: q = 8'hD4;
      9'h183: q = 8'hD4;
      9'h184: q = 8'hD4;
      9'h185: q = 8'hD4;
      9'h186: q = 8'hD4;
      9'h187: q = 8'hD3;
      9'h188: q = 8'hD3;
      9'h189: q = 8'hD3;
      9'h18A: q = 8'hD3;
      9'h18B: q = 8'hD2;
      9'h18C: q = 8'hD2;
      9'h18D: q = 8'hD2;
      9'h18E: q = 8'hD2;
      9'h18F: q = 8'hD2;
      9'h190: q = 8'hD1;
      9'h191: q = 8'hD1;
      9'h192: q = 8'hD1;
      9'h193: q = 8'hD1;
      9'h194: q = 8'hD0;
      9'h195: q = 8'hD0;
      9'h196: q = 8'hD0;
      9'h197: q = 8'hD0;
      9'h198: q = 8'hCF;
      9'h199: q = 8'hCF;
      9'h19A: q = 8'hCF;
      9'h19B: q = 8'hCF;
      9'h19C: q = 8'hCF;
      9'h19D: q = 8'hCE;
      9'h19E: q = 8'hCE;
      9'h19F: q = 8'hCE;
      9'h1A0: q = 8'hCE;
      9'h1A1: q = 8'hCD;
      9'h1A2: q = 8'hCD;
      9'h1A3: q = 8'hCD;
      9'h1A4: q = 8'hCD;
      9'h1A5: q = 8'hCC;
      9'h1A6: q = 8'hCC;
      9'h1A7: q = 8'hCC;
      9'h1A8: q = 8'hCC;
      9'h1A9: q = 8'hCB;
      9'h1AA: q = 8'hCB;
      9'h1AB: q = 8'hCB;
      9'h1AC: q = 8'hCB;
      9'h1AD: q = 8'hCB;
      9'h1AE: q = 8'hCA;
      9'h1AF: q = 8'hCA;
      9'h1B0: q = 8'hCA;
      9'h1B1: q = 8'hCA;
      9'h1B2: q = 8'hC9;
      9'h1B3: q = 8'hC9;
      9'h1B4: q = 8'hC9;
      9'h1B5: q = 8'hC9;
      9'h1B6: q = 8'hC8;
      9'h1B7: q = 8'hC8;
      9'h1B8: q = 8'hC8;
      9'h1B9: q = 8'hC8;
      9'h1BA: q = 8'hC7;
      9'h1BB: q = 8'hC7;
      9'h1BC: q = 8'hC7;
      9'h1BD: q = 8'hC7;
      9'h1BE: q = 8'hC6;
      9'h1BF: q = 8'hC6;
      9'h1C0: q = 8'hC6;
      9'h1C1: q = 8'hC6;
      9'h1C2: q = 8'hC5;
      9'h1C3: q = 8'hC5;
      9'h1C4: q = 8'hC5;
      9'h1C5: q = 8'hC5;
      9'h1C6: q = 8'hC4;
      9'h1C7: q = 8'hC4;
      9'h1C8: q = 8'hC4;
      9'h1C9: q = 8'hC4;
      9'h1CA: q = 8'hC3;
      9'h1CB: q = 8'hC3;
      9'h1CC: q = 8'hC3;
      9'h1CD: q = 8'hC3;
      9'h1CE: q = 8'hC2;
      9'h1CF: q = 8'hC2;
      9'h1D0: q = 8'hC2;
      9'h1D1: q = 8'hC2;
      9'h1D2: q = 8'hC1;
      9'h1D3: q = 8'hC1;
      9'h1D4: q = 8'hC1;
      9'h1D5: q = 8'hC1;
      9'h1D6: q = 8'hC0;
      9'h1D7: q = 8'hC0;
      9'h1D8: q = 8'hC0;
      9'h1D9: q = 8'hC0;
      9'h1DA: q = 8'hBF;
      9'h1DB: q = 8'hBF;
      9'h1DC: q = 8'hBF;
      9'h1DD: q = 8'hBE;
      9'h1DE: q = 8'hBE;
      9'h1DF: q = 8'hBE;
      9'h1E0: q = 8'hBE;
      9'h1E1: q = 8'hBD;
      9'h1E2: q = 8'hBD;
      9'h1E3: q = 8'hBD;
      9'h1E4: q = 8'hBD;
      9'h1E5: q = 8'hBC;
      9'h1E6: q = 8'hBC;
      9'h1E7: q = 8'hBC;
      9'h1E8: q = 8'hBC;
      9'h1E9: q = 8'hBB;
      9'h1EA: q = 8'hBB;
      9'h1EB: q = 8'hBB;
      9'h1EC: q = 8'hBA;
      9'h1ED: q = 8'hBA;
      9'h1EE: q = 8'hBA;
      9'h1EF: q = 8'hBA;
      9'h1F0: q = 8'hB9;
      9'h1F1: q = 8'hB9;
      9'h1F2: q = 8'hB9;
      9'h1F3: q = 8'hB9;
      9'h1F4: q = 8'hB8;
      9'h1F5: q = 8'hB8;
      9'h1F6: q = 8'hB8;
      9'h1F7: q = 8'hB8;
      9'h1F8: q = 8'hB7;
      9'h1F9: q = 8'hB7;
      9'h1FA: q = 8'hB7;
      9'h1FB: q = 8'hB6;
      9'h1FC: q = 8'hB6;
      9'h1FD: q = 8'hB6;
      9'h1FE: q = 8'hB6;
      9'h1FF: q = 8'hB5;
      default: q = 8'h0;
    endcase
  end
endmodule