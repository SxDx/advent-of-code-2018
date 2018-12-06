# frozen_string_literal: true

input = DATA.each_line.map do |line|
  # We only care about the numbers
  line.scan(/\d+/).map(&:to_i)
end

# Part 1
fabric = Array.new(1000) { Array.new(1000) { [] } }

input.each do |id, delta_left, delta_top, width, height|
  fabric[delta_left, width].each do |row|
    row[delta_top, height].each do |cell|
      cell << id
    end
  end
end

puts fabric.sum { |row| row.count { |cell| cell.size > 1 } }

# Part 2
uniqe_squares = input.select do |id, delta_left, delta_top, width, height|
  fabric[delta_left, width].all? do |row|
    row[delta_top, height].all? do |cell|
      cell.size == 1
    end
  end
end

puts uniqe_squares.map(&:first)

__END__
#1 @ 604,670: 22x16
#2 @ 783,766: 15x25
#3 @ 378,335: 22x18
#4 @ 343,50: 22x19
#5 @ 388,907: 23x15
#6 @ 466,619: 19x13
#7 @ 501,113: 24x18
#8 @ 351,67: 29x12
#9 @ 574,157: 12x14
#10 @ 638,810: 17x10
#11 @ 904,64: 24x22
#12 @ 48,831: 12x26
#13 @ 834,885: 26x14
#14 @ 787,867: 18x25
#15 @ 949,238: 24x21
#16 @ 627,225: 20x11
#17 @ 746,655: 13x10
#18 @ 304,428: 18x20
#19 @ 394,646: 10x24
#20 @ 261,831: 18x17
#21 @ 953,730: 11x29
#22 @ 638,93: 22x29
#23 @ 640,820: 24x28
#24 @ 357,970: 27x29
#25 @ 182,390: 13x29
#26 @ 686,540: 10x10
#27 @ 542,637: 17x12
#28 @ 662,127: 25x12
#29 @ 175,581: 10x20
#30 @ 398,540: 27x18
#31 @ 875,804: 20x16
#32 @ 403,654: 10x26
#33 @ 75,904: 25x10
#34 @ 122,169: 22x14
#35 @ 611,532: 23x16
#36 @ 499,185: 15x24
#37 @ 762,875: 14x17
#38 @ 175,507: 26x17
#39 @ 438,249: 13x13
#40 @ 129,511: 27x29
#41 @ 239,562: 11x15
#42 @ 264,358: 21x21
#43 @ 485,156: 29x26
#44 @ 465,40: 18x15
#45 @ 66,183: 10x25
#46 @ 844,836: 24x23
#47 @ 759,915: 25x12
#48 @ 536,469: 21x11
#49 @ 482,683: 26x14
#50 @ 346,123: 11x24
#51 @ 224,929: 10x20
#52 @ 737,757: 25x23
#53 @ 781,141: 23x22
#54 @ 324,68: 22x15
#55 @ 497,40: 21x21
#56 @ 557,515: 16x7
#57 @ 660,804: 11x14
#58 @ 217,727: 12x24
#59 @ 385,128: 24x24
#60 @ 319,474: 16x20
#61 @ 811,42: 23x28
#62 @ 610,964: 14x28
#63 @ 370,3: 13x25
#64 @ 639,521: 27x23
#65 @ 823,672: 15x25
#66 @ 40,56: 24x28
#67 @ 301,308: 22x14
#68 @ 128,335: 15x19
#69 @ 386,674: 18x12
#70 @ 770,143: 28x16
#71 @ 941,834: 18x23
#72 @ 532,896: 26x27
#73 @ 466,986: 17x10
#74 @ 107,692: 12x16
#75 @ 86,367: 15x17
#76 @ 719,974: 26x12
#77 @ 676,764: 11x11
#78 @ 952,808: 13x29
#79 @ 727,656: 13x27
#80 @ 474,55: 23x23
#81 @ 591,669: 27x13
#82 @ 645,436: 20x28
#83 @ 578,919: 22x17
#84 @ 34,180: 23x20
#85 @ 635,397: 25x26
#86 @ 419,586: 15x10
#87 @ 369,766: 12x20
#88 @ 215,444: 11x28
#89 @ 248,604: 23x19
#90 @ 927,840: 16x14
#91 @ 397,195: 16x27
#92 @ 39,375: 14x10
#93 @ 331,72: 14x25
#94 @ 627,970: 22x29
#95 @ 1,645: 19x15
#96 @ 718,909: 28x21
#97 @ 326,13: 27x12
#98 @ 176,521: 28x22
#99 @ 35,111: 23x22
#100 @ 801,39: 26x29
#101 @ 328,11: 11x11
#102 @ 529,769: 27x23
#103 @ 356,622: 3x3
#104 @ 401,69: 22x14
#105 @ 801,683: 23x15
#106 @ 408,903: 29x15
#107 @ 105,473: 19x20
#108 @ 746,439: 17x20
#109 @ 318,711: 12x15
#110 @ 203,927: 12x16
#111 @ 633,282: 21x15
#112 @ 425,582: 25x21
#113 @ 213,259: 11x24
#114 @ 671,947: 11x13
#115 @ 53,600: 20x18
#116 @ 45,46: 25x29
#117 @ 890,724: 15x26
#118 @ 328,645: 20x24
#119 @ 275,878: 18x14
#120 @ 372,370: 24x16
#121 @ 554,513: 26x16
#122 @ 0,818: 15x11
#123 @ 635,554: 14x25
#124 @ 625,406: 23x28
#125 @ 549,53: 22x29
#126 @ 834,889: 20x18
#127 @ 11,878: 21x16
#128 @ 241,900: 20x13
#129 @ 372,60: 23x15
#130 @ 562,886: 19x29
#131 @ 447,148: 29x16
#132 @ 196,581: 12x19
#133 @ 703,615: 24x24
#134 @ 208,80: 16x29
#135 @ 818,841: 18x16
#136 @ 68,797: 10x11
#137 @ 850,253: 27x22
#138 @ 306,12: 15x28
#139 @ 574,26: 27x25
#140 @ 269,524: 5x15
#141 @ 322,73: 18x11
#142 @ 374,696: 15x28
#143 @ 298,413: 11x27
#144 @ 558,47: 28x22
#145 @ 898,956: 15x19
#146 @ 287,501: 23x13
#147 @ 304,101: 24x17
#148 @ 541,462: 23x26
#149 @ 14,234: 26x20
#150 @ 855,384: 27x17
#151 @ 505,699: 29x14
#152 @ 789,867: 18x16
#153 @ 946,699: 12x14
#154 @ 149,37: 27x12
#155 @ 969,927: 19x28
#156 @ 855,975: 3x17
#157 @ 672,798: 20x28
#158 @ 602,158: 11x15
#159 @ 447,622: 18x27
#160 @ 337,340: 28x26
#161 @ 957,305: 10x20
#162 @ 449,375: 15x15
#163 @ 929,214: 11x15
#164 @ 939,805: 26x10
#165 @ 859,843: 15x19
#166 @ 723,141: 28x25
#167 @ 554,526: 10x25
#168 @ 196,236: 19x24
#169 @ 311,670: 29x26
#170 @ 117,792: 12x26
#171 @ 615,2: 18x17
#172 @ 627,472: 19x29
#173 @ 926,810: 7x13
#174 @ 466,691: 22x21
#175 @ 739,368: 23x25
#176 @ 757,684: 11x4
#177 @ 211,195: 29x25
#178 @ 293,715: 27x16
#179 @ 765,16: 13x13
#180 @ 370,933: 29x17
#181 @ 282,676: 17x22
#182 @ 843,386: 18x13
#183 @ 294,202: 19x26
#184 @ 4,869: 28x26
#185 @ 750,868: 20x14
#186 @ 642,237: 12x13
#187 @ 964,427: 17x29
#188 @ 624,823: 19x23
#189 @ 672,694: 25x17
#190 @ 477,693: 27x28
#191 @ 626,551: 26x16
#192 @ 562,730: 17x14
#193 @ 672,782: 12x14
#194 @ 898,495: 28x22
#195 @ 386,900: 20x19
#196 @ 540,196: 27x26
#197 @ 734,220: 11x15
#198 @ 282,754: 15x28
#199 @ 231,541: 25x28
#200 @ 846,970: 20x28
#201 @ 237,386: 22x12
#202 @ 666,390: 11x17
#203 @ 451,659: 15x22
#204 @ 511,138: 20x24
#205 @ 8,584: 29x18
#206 @ 640,719: 23x28
#207 @ 461,370: 11x10
#208 @ 206,702: 16x26
#209 @ 195,201: 19x11
#210 @ 1,426: 13x21
#211 @ 261,121: 15x24
#212 @ 580,914: 25x14
#213 @ 124,576: 18x22
#214 @ 974,80: 15x17
#215 @ 926,592: 25x18
#216 @ 356,842: 19x18
#217 @ 891,141: 28x24
#218 @ 573,322: 13x21
#219 @ 519,900: 15x15
#220 @ 654,443: 16x28
#221 @ 810,370: 29x29
#222 @ 590,9: 11x24
#223 @ 929,729: 21x12
#224 @ 98,690: 27x28
#225 @ 149,638: 18x25
#226 @ 962,805: 23x21
#227 @ 451,144: 25x25
#228 @ 631,475: 25x16
#229 @ 673,385: 21x16
#230 @ 257,425: 27x14
#231 @ 293,880: 29x17
#232 @ 613,778: 13x22
#233 @ 87,166: 18x23
#234 @ 534,600: 16x28
#235 @ 555,694: 26x12
#236 @ 129,47: 11x27
#237 @ 622,710: 29x18
#238 @ 90,319: 21x27
#239 @ 308,511: 22x22
#240 @ 257,703: 26x12
#241 @ 113,419: 10x13
#242 @ 355,830: 11x13
#243 @ 556,331: 29x28
#244 @ 531,841: 26x29
#245 @ 748,672: 26x27
#246 @ 743,543: 21x17
#247 @ 269,428: 28x29
#248 @ 235,970: 16x22
#249 @ 878,181: 23x29
#250 @ 745,163: 17x16
#251 @ 659,746: 17x12
#252 @ 460,826: 17x14
#253 @ 970,961: 29x12
#254 @ 214,899: 27x16
#255 @ 657,582: 16x22
#256 @ 815,406: 17x21
#257 @ 932,736: 24x25
#258 @ 925,251: 29x28
#259 @ 528,961: 13x13
#260 @ 721,125: 19x18
#261 @ 433,253: 29x15
#262 @ 873,967: 26x24
#263 @ 497,895: 14x23
#264 @ 95,564: 20x29
#265 @ 299,91: 15x22
#266 @ 241,900: 23x24
#267 @ 637,735: 23x29
#268 @ 528,909: 12x29
#269 @ 112,339: 18x15
#270 @ 586,232: 22x11
#271 @ 199,652: 28x14
#272 @ 243,108: 26x26
#273 @ 34,371: 12x17
#274 @ 781,406: 24x27
#275 @ 601,922: 26x16
#276 @ 156,30: 26x15
#277 @ 545,790: 20x27
#278 @ 52,70: 23x27
#279 @ 374,156: 19x21
#280 @ 831,918: 14x19
#281 @ 520,246: 10x11
#282 @ 468,986: 15x11
#283 @ 232,10: 23x22
#284 @ 393,789: 28x27
#285 @ 88,839: 21x17
#286 @ 755,347: 19x26
#287 @ 380,854: 21x29
#288 @ 812,680: 13x18
#289 @ 868,33: 11x19
#290 @ 523,162: 27x23
#291 @ 303,482: 19x11
#292 @ 52,48: 10x24
#293 @ 553,103: 12x21
#294 @ 548,240: 22x17
#295 @ 760,628: 3x9
#296 @ 259,232: 16x18
#297 @ 302,967: 29x13
#298 @ 237,279: 13x13
#299 @ 299,32: 17x29
#300 @ 855,179: 25x15
#301 @ 317,602: 21x24
#302 @ 649,802: 19x26
#303 @ 535,229: 15x23
#304 @ 636,428: 25x19
#305 @ 202,460: 28x11
#306 @ 600,758: 25x21
#307 @ 172,971: 10x16
#308 @ 925,329: 23x15
#309 @ 635,947: 21x23
#310 @ 138,114: 18x10
#311 @ 439,517: 22x28
#312 @ 985,934: 13x22
#313 @ 298,953: 25x20
#314 @ 586,865: 24x25
#315 @ 388,454: 16x22
#316 @ 326,673: 18x10
#317 @ 286,420: 26x20
#318 @ 44,947: 11x21
#319 @ 675,139: 21x18
#320 @ 400,122: 25x23
#321 @ 58,192: 27x13
#322 @ 496,965: 17x21
#323 @ 914,645: 24x25
#324 @ 662,826: 25x27
#325 @ 535,486: 25x12
#326 @ 334,61: 29x10
#327 @ 940,694: 18x11
#328 @ 897,97: 11x27
#329 @ 178,528: 11x10
#330 @ 560,892: 19x13
#331 @ 308,18: 27x14
#332 @ 728,181: 15x12
#333 @ 627,610: 28x29
#334 @ 341,646: 22x28
#335 @ 461,710: 14x16
#336 @ 384,796: 26x13
#337 @ 880,269: 22x16
#338 @ 275,756: 10x20
#339 @ 516,112: 21x26
#340 @ 339,788: 20x10
#341 @ 656,825: 15x17
#342 @ 882,383: 16x20
#343 @ 919,227: 16x20
#344 @ 315,209: 28x11
#345 @ 576,808: 21x15
#346 @ 675,934: 22x23
#347 @ 692,692: 13x12
#348 @ 846,452: 23x25
#349 @ 522,94: 14x27
#350 @ 87,754: 25x19
#351 @ 547,541: 18x24
#352 @ 786,873: 19x29
#353 @ 304,479: 18x25
#354 @ 793,863: 11x15
#355 @ 433,923: 13x23
#356 @ 281,260: 23x28
#357 @ 395,287: 29x10
#358 @ 829,517: 16x23
#359 @ 452,247: 28x25
#360 @ 221,163: 28x11
#361 @ 261,618: 16x21
#362 @ 765,519: 29x12
#363 @ 155,230: 12x18
#364 @ 419,922: 15x13
#365 @ 302,706: 14x14
#366 @ 502,249: 26x22
#367 @ 503,710: 14x17
#368 @ 246,873: 19x22
#369 @ 131,351: 12x20
#370 @ 191,665: 23x24
#371 @ 542,329: 11x5
#372 @ 574,646: 20x24
#373 @ 647,506: 16x25
#374 @ 85,620: 26x12
#375 @ 118,698: 22x23
#376 @ 135,548: 19x23
#377 @ 134,58: 17x10
#378 @ 837,211: 18x27
#379 @ 76,758: 29x10
#380 @ 6,205: 26x25
#381 @ 980,903: 11x28
#382 @ 306,454: 10x12
#383 @ 475,139: 13x14
#384 @ 889,792: 11x25
#385 @ 51,717: 29x18
#386 @ 209,111: 29x29
#387 @ 329,790: 27x11
#388 @ 871,571: 27x25
#389 @ 451,518: 10x18
#390 @ 398,229: 16x27
#391 @ 612,843: 23x10
#392 @ 907,393: 28x27
#393 @ 835,674: 21x18
#394 @ 394,915: 10x16
#395 @ 30,732: 14x15
#396 @ 50,735: 20x20
#397 @ 827,704: 12x28
#398 @ 847,267: 27x10
#399 @ 627,782: 18x12
#400 @ 538,614: 10x16
#401 @ 53,59: 23x11
#402 @ 587,541: 24x17
#403 @ 629,549: 16x12
#404 @ 885,587: 19x20
#405 @ 104,631: 29x27
#406 @ 209,233: 12x18
#407 @ 704,834: 28x27
#408 @ 287,444: 21x16
#409 @ 687,796: 13x18
#410 @ 193,229: 23x20
#411 @ 250,608: 18x11
#412 @ 926,414: 20x23
#413 @ 89,73: 16x26
#414 @ 171,395: 21x19
#415 @ 296,286: 12x10
#416 @ 894,384: 24x28
#417 @ 360,7: 14x18
#418 @ 323,372: 11x22
#419 @ 186,557: 12x28
#420 @ 392,322: 29x23
#421 @ 7,69: 21x18
#422 @ 428,344: 26x29
#423 @ 44,855: 28x28
#424 @ 333,34: 28x14
#425 @ 751,616: 20x23
#426 @ 842,401: 24x20
#427 @ 174,135: 25x20
#428 @ 63,873: 11x11
#429 @ 99,388: 25x15
#430 @ 563,813: 13x20
#431 @ 409,366: 23x19
#432 @ 208,2: 20x18
#433 @ 754,432: 21x28
#434 @ 470,895: 22x12
#435 @ 628,918: 21x22
#436 @ 609,538: 13x21
#437 @ 258,370: 25x10
#438 @ 526,940: 25x27
#439 @ 110,411: 13x18
#440 @ 119,115: 22x13
#441 @ 327,29: 20x26
#442 @ 826,266: 23x18
#443 @ 155,965: 23x19
#444 @ 277,363: 18x26
#445 @ 536,327: 24x13
#446 @ 269,131: 7x8
#447 @ 571,943: 4x18
#448 @ 675,768: 15x25
#449 @ 243,30: 11x13
#450 @ 571,591: 11x11
#451 @ 877,952: 14x21
#452 @ 897,792: 22x29
#453 @ 861,807: 14x20
#454 @ 486,10: 13x13
#455 @ 225,122: 12x19
#456 @ 777,522: 20x12
#457 @ 139,961: 12x13
#458 @ 942,882: 21x19
#459 @ 481,80: 18x21
#460 @ 481,618: 11x17
#461 @ 952,291: 21x29
#462 @ 882,100: 23x27
#463 @ 266,899: 22x20
#464 @ 918,217: 12x22
#465 @ 921,957: 28x17
#466 @ 180,90: 17x19
#467 @ 505,159: 26x15
#468 @ 733,509: 16x15
#469 @ 234,22: 17x14
#470 @ 356,64: 28x16
#471 @ 70,101: 23x29
#472 @ 637,326: 18x27
#473 @ 823,498: 15x27
#474 @ 945,886: 11x7
#475 @ 2,447: 25x15
#476 @ 618,881: 13x19
#477 @ 30,124: 21x25
#478 @ 498,471: 28x29
#479 @ 630,316: 29x11
#480 @ 442,725: 29x17
#481 @ 980,908: 14x10
#482 @ 756,896: 16x12
#483 @ 516,634: 16x27
#484 @ 870,681: 10x23
#485 @ 161,580: 26x11
#486 @ 188,528: 20x23
#487 @ 172,882: 14x21
#488 @ 503,180: 24x10
#489 @ 459,46: 10x22
#490 @ 223,822: 23x19
#491 @ 404,29: 15x19
#492 @ 717,715: 22x23
#493 @ 771,762: 21x17
#494 @ 368,890: 17x18
#495 @ 22,466: 23x20
#496 @ 600,340: 19x11
#497 @ 699,824: 15x17
#498 @ 6,435: 15x23
#499 @ 595,269: 24x14
#500 @ 484,890: 18x10
#501 @ 128,608: 22x12
#502 @ 388,333: 26x14
#503 @ 559,44: 27x13
#504 @ 200,745: 22x14
#505 @ 538,712: 11x21
#506 @ 217,1: 17x20
#507 @ 603,604: 22x15
#508 @ 528,747: 22x20
#509 @ 658,661: 15x12
#510 @ 550,879: 14x26
#511 @ 851,21: 19x23
#512 @ 527,643: 28x11
#513 @ 571,441: 27x11
#514 @ 780,573: 25x23
#515 @ 11,578: 11x28
#516 @ 631,465: 28x22
#517 @ 633,149: 29x25
#518 @ 60,331: 27x18
#519 @ 668,946: 28x12
#520 @ 633,616: 13x10
#521 @ 600,710: 14x27
#522 @ 386,148: 10x14
#523 @ 629,762: 16x20
#524 @ 193,195: 8x6
#525 @ 504,963: 25x19
#526 @ 617,831: 13x10
#527 @ 673,179: 18x16
#528 @ 651,453: 22x29
#529 @ 477,869: 14x25
#530 @ 533,852: 28x16
#531 @ 891,733: 12x13
#532 @ 178,586: 28x14
#533 @ 190,193: 24x12
#534 @ 288,445: 12x19
#535 @ 110,297: 24x22
#536 @ 400,187: 13x15
#537 @ 400,876: 23x11
#538 @ 536,262: 17x14
#539 @ 501,185: 17x22
#540 @ 751,11: 18x17
#541 @ 870,184: 18x17
#542 @ 597,430: 16x13
#543 @ 864,266: 25x14
#544 @ 120,785: 10x20
#545 @ 937,261: 12x23
#546 @ 564,826: 23x19
#547 @ 442,92: 29x20
#548 @ 523,398: 27x25
#549 @ 454,26: 16x28
#550 @ 549,111: 15x17
#551 @ 890,754: 21x20
#552 @ 583,490: 29x24
#553 @ 596,687: 25x29
#554 @ 566,193: 26x18
#555 @ 724,495: 12x28
#556 @ 318,972: 16x10
#557 @ 735,163: 10x29
#558 @ 130,640: 27x15
#559 @ 198,137: 16x18
#560 @ 680,205: 27x20
#561 @ 630,878: 20x10
#562 @ 261,387: 20x16
#563 @ 311,581: 17x22
#564 @ 367,977: 13x18
#565 @ 455,634: 16x20
#566 @ 754,674: 18x20
#567 @ 404,801: 14x29
#568 @ 0,940: 18x27
#569 @ 574,161: 29x22
#570 @ 460,353: 15x27
#571 @ 654,422: 14x26
#572 @ 703,209: 19x19
#573 @ 179,690: 10x26
#574 @ 493,871: 12x27
#575 @ 289,247: 18x14
#576 @ 581,324: 24x28
#577 @ 699,760: 22x20
#578 @ 563,438: 16x28
#579 @ 702,832: 17x26
#580 @ 139,974: 29x12
#581 @ 664,714: 27x12
#582 @ 243,236: 21x16
#583 @ 714,327: 7x3
#584 @ 516,911: 22x21
#585 @ 311,970: 11x26
#586 @ 386,144: 13x25
#587 @ 343,53: 18x23
#588 @ 14,932: 29x20
#589 @ 746,397: 21x19
#590 @ 286,43: 14x27
#591 @ 535,531: 23x26
#592 @ 845,35: 25x19
#593 @ 568,114: 29x14
#594 @ 619,98: 21x27
#595 @ 393,109: 13x24
#596 @ 379,709: 14x24
#597 @ 867,839: 10x24
#598 @ 215,898: 28x16
#599 @ 594,280: 20x11
#600 @ 397,213: 29x16
#601 @ 136,587: 16x19
#602 @ 2,424: 29x14
#603 @ 802,126: 15x28
#604 @ 228,966: 20x24
#605 @ 280,433: 25x27
#606 @ 692,746: 20x20
#607 @ 179,490: 17x25
#608 @ 270,218: 17x22
#609 @ 449,483: 29x28
#610 @ 66,320: 25x21
#611 @ 830,56: 21x18
#612 @ 116,144: 19x18
#613 @ 960,255: 18x20
#614 @ 554,907: 16x12
#615 @ 88,400: 21x25
#616 @ 695,523: 20x29
#617 @ 143,953: 21x19
#618 @ 422,26: 20x20
#619 @ 167,810: 24x21
#620 @ 504,690: 25x16
#621 @ 371,555: 26x18
#622 @ 275,840: 23x24
#623 @ 718,638: 23x29
#624 @ 96,54: 19x26
#625 @ 829,366: 23x24
#626 @ 2,871: 19x17
#627 @ 634,192: 14x22
#628 @ 873,248: 12x13
#629 @ 452,531: 23x10
#630 @ 924,804: 23x25
#631 @ 842,926: 13x24
#632 @ 807,501: 28x20
#633 @ 786,190: 10x28
#634 @ 433,645: 18x16
#635 @ 76,553: 19x22
#636 @ 856,968: 18x16
#637 @ 919,712: 27x23
#638 @ 84,373: 22x17
#639 @ 854,193: 23x20
#640 @ 113,272: 21x14
#641 @ 70,597: 28x11
#642 @ 341,8: 29x16
#643 @ 849,125: 14x29
#644 @ 863,137: 11x12
#645 @ 645,520: 24x19
#646 @ 156,852: 15x13
#647 @ 831,652: 20x24
#648 @ 18,242: 16x29
#649 @ 679,137: 25x27
#650 @ 745,889: 21x29
#651 @ 310,377: 19x25
#652 @ 537,672: 29x28
#653 @ 843,639: 22x18
#654 @ 578,904: 15x18
#655 @ 837,471: 15x26
#656 @ 791,752: 29x22
#657 @ 844,805: 22x16
#658 @ 183,795: 17x19
#659 @ 255,841: 29x12
#660 @ 639,98: 27x20
#661 @ 737,964: 13x21
#662 @ 903,112: 12x28
#663 @ 15,405: 16x28
#664 @ 89,587: 15x20
#665 @ 557,436: 15x29
#666 @ 497,68: 25x21
#667 @ 266,670: 3x8
#668 @ 321,197: 16x14
#669 @ 531,84: 24x16
#670 @ 932,714: 23x26
#671 @ 312,643: 25x26
#672 @ 206,752: 24x15
#673 @ 516,247: 27x16
#674 @ 736,601: 24x26
#675 @ 506,171: 10x11
#676 @ 64,213: 25x27
#677 @ 21,82: 29x25
#678 @ 379,557: 10x19
#679 @ 560,565: 21x27
#680 @ 684,751: 18x16
#681 @ 635,825: 28x15
#682 @ 316,965: 25x21
#683 @ 959,572: 15x24
#684 @ 971,49: 27x25
#685 @ 796,329: 27x13
#686 @ 243,53: 17x16
#687 @ 657,424: 12x18
#688 @ 788,241: 26x21
#689 @ 534,794: 28x22
#690 @ 93,425: 25x22
#691 @ 680,314: 25x16
#692 @ 297,226: 22x21
#693 @ 129,44: 15x27
#694 @ 181,142: 10x25
#695 @ 463,642: 19x27
#696 @ 681,853: 24x20
#697 @ 85,197: 26x17
#698 @ 225,3: 14x25
#699 @ 970,906: 13x23
#700 @ 465,928: 13x19
#701 @ 568,940: 26x26
#702 @ 769,206: 19x23
#703 @ 262,666: 11x20
#704 @ 848,942: 19x18
#705 @ 188,648: 16x21
#706 @ 545,414: 20x10
#707 @ 72,498: 14x17
#708 @ 59,729: 16x23
#709 @ 600,827: 26x21
#710 @ 593,333: 27x29
#711 @ 2,252: 18x23
#712 @ 541,746: 11x13
#713 @ 281,237: 27x17
#714 @ 562,732: 18x10
#715 @ 923,215: 13x25
#716 @ 630,107: 28x11
#717 @ 870,277: 14x12
#718 @ 67,912: 19x26
#719 @ 169,555: 13x29
#720 @ 949,14: 13x20
#721 @ 932,304: 15x25
#722 @ 255,122: 14x22
#723 @ 524,787: 21x17
#724 @ 541,933: 24x18
#725 @ 294,682: 29x14
#726 @ 828,804: 16x28
#727 @ 851,8: 23x14
#728 @ 632,731: 12x19
#729 @ 364,940: 14x15
#730 @ 973,391: 10x19
#731 @ 557,804: 24x13
#732 @ 400,216: 28x12
#733 @ 471,36: 29x11
#734 @ 632,11: 21x27
#735 @ 601,775: 12x20
#736 @ 486,3: 14x24
#737 @ 816,242: 15x21
#738 @ 709,854: 26x14
#739 @ 645,931: 25x11
#740 @ 311,224: 29x10
#741 @ 661,659: 10x11
#742 @ 28,458: 12x17
#743 @ 89,742: 29x20
#744 @ 703,862: 18x10
#745 @ 961,344: 27x16
#746 @ 117,593: 29x21
#747 @ 502,163: 16x29
#748 @ 79,242: 17x15
#749 @ 567,651: 15x15
#750 @ 66,445: 10x23
#751 @ 449,257: 12x18
#752 @ 938,650: 22x12
#753 @ 259,736: 20x23
#754 @ 17,103: 19x21
#755 @ 609,751: 19x20
#756 @ 42,525: 11x23
#757 @ 808,47: 21x15
#758 @ 370,453: 24x17
#759 @ 150,449: 16x29
#760 @ 323,512: 20x28
#761 @ 346,931: 20x22
#762 @ 344,144: 24x20
#763 @ 268,611: 27x27
#764 @ 633,824: 8x6
#765 @ 702,851: 16x19
#766 @ 580,528: 14x25
#767 @ 472,687: 21x17
#768 @ 605,774: 23x13
#769 @ 449,898: 12x29
#770 @ 817,230: 27x14
#771 @ 379,559: 17x19
#772 @ 383,189: 22x17
#773 @ 635,412: 26x24
#774 @ 790,659: 11x22
#775 @ 376,694: 20x17
#776 @ 401,790: 11x24
#777 @ 378,570: 20x28
#778 @ 629,789: 15x28
#779 @ 146,766: 20x25
#780 @ 271,223: 16x28
#781 @ 165,951: 4x4
#782 @ 218,217: 28x24
#783 @ 931,656: 12x12
#784 @ 291,853: 11x25
#785 @ 125,408: 20x12
#786 @ 264,751: 18x29
#787 @ 922,648: 11x12
#788 @ 620,217: 16x16
#789 @ 247,901: 24x27
#790 @ 812,842: 13x17
#791 @ 2,667: 29x27
#792 @ 830,829: 14x20
#793 @ 971,56: 12x27
#794 @ 739,868: 24x28
#795 @ 250,912: 23x25
#796 @ 198,206: 15x24
#797 @ 362,439: 11x22
#798 @ 234,268: 29x24
#799 @ 464,535: 20x19
#800 @ 625,714: 28x11
#801 @ 81,571: 24x16
#802 @ 379,462: 28x11
#803 @ 640,526: 24x12
#804 @ 34,229: 18x21
#805 @ 151,495: 22x19
#806 @ 872,851: 20x26
#807 @ 606,84: 17x20
#808 @ 640,659: 25x20
#809 @ 118,544: 11x18
#810 @ 450,243: 19x16
#811 @ 768,652: 26x11
#812 @ 833,723: 10x20
#813 @ 621,740: 28x18
#814 @ 853,383: 26x11
#815 @ 963,962: 11x15
#816 @ 670,585: 21x15
#817 @ 171,98: 25x11
#818 @ 761,904: 24x15
#819 @ 144,975: 19x19
#820 @ 775,891: 14x28
#821 @ 25,731: 22x21
#822 @ 457,119: 22x26
#823 @ 717,75: 15x26
#824 @ 900,413: 20x16
#825 @ 888,291: 20x26
#826 @ 472,0: 29x22
#827 @ 455,647: 13x22
#828 @ 118,486: 22x25
#829 @ 340,537: 14x21
#830 @ 638,528: 10x17
#831 @ 96,945: 26x25
#832 @ 812,482: 16x26
#833 @ 695,823: 18x20
#834 @ 296,210: 21x22
#835 @ 5,682: 28x16
#836 @ 379,935: 9x12
#837 @ 390,206: 17x25
#838 @ 56,159: 16x26
#839 @ 654,441: 14x21
#840 @ 391,694: 15x25
#841 @ 203,350: 3x19
#842 @ 353,424: 28x21
#843 @ 745,921: 27x17
#844 @ 216,84: 13x23
#845 @ 239,379: 13x10
#846 @ 149,466: 15x18
#847 @ 279,768: 29x21
#848 @ 683,190: 10x13
#849 @ 300,17: 27x26
#850 @ 514,654: 16x20
#851 @ 31,529: 14x11
#852 @ 521,349: 29x13
#853 @ 223,274: 20x11
#854 @ 19,535: 18x19
#855 @ 298,211: 11x11
#856 @ 727,525: 25x28
#857 @ 470,82: 22x12
#858 @ 893,276: 28x19
#859 @ 642,377: 23x19
#860 @ 580,966: 22x25
#861 @ 201,348: 16x24
#862 @ 398,911: 20x10
#863 @ 453,238: 12x13
#864 @ 231,936: 23x16
#865 @ 467,113: 23x15
#866 @ 536,73: 15x25
#867 @ 520,141: 15x23
#868 @ 589,819: 28x10
#869 @ 255,717: 11x18
#870 @ 365,158: 18x15
#871 @ 696,869: 12x29
#872 @ 704,325: 21x10
#873 @ 912,85: 10x12
#874 @ 348,434: 24x18
#875 @ 1,253: 18x23
#876 @ 383,714: 18x17
#877 @ 404,46: 10x17
#878 @ 2,219: 18x17
#879 @ 572,336: 18x15
#880 @ 557,561: 20x15
#881 @ 954,435: 13x24
#882 @ 932,967: 27x27
#883 @ 231,280: 17x10
#884 @ 136,470: 11x25
#885 @ 176,138: 28x14
#886 @ 673,194: 21x17
#887 @ 287,407: 29x25
#888 @ 981,170: 3x4
#889 @ 916,850: 24x26
#890 @ 627,378: 11x19
#891 @ 303,11: 10x27
#892 @ 909,87: 27x15
#893 @ 194,479: 24x24
#894 @ 239,697: 21x23
#895 @ 548,724: 15x11
#896 @ 208,753: 10x24
#897 @ 297,525: 26x19
#898 @ 849,761: 28x18
#899 @ 739,211: 17x11
#900 @ 566,963: 11x14
#901 @ 773,145: 18x9
#902 @ 607,974: 14x17
#903 @ 370,60: 17x10
#904 @ 189,204: 10x18
#905 @ 645,550: 19x21
#906 @ 949,943: 18x23
#907 @ 484,192: 22x26
#908 @ 736,582: 18x11
#909 @ 311,681: 12x13
#910 @ 838,102: 13x26
#911 @ 301,950: 16x20
#912 @ 690,222: 24x23
#913 @ 141,561: 19x15
#914 @ 168,35: 20x12
#915 @ 85,443: 28x22
#916 @ 376,672: 25x28
#917 @ 624,464: 26x27
#918 @ 854,977: 23x16
#919 @ 692,681: 27x28
#920 @ 310,888: 11x27
#921 @ 531,801: 19x14
#922 @ 662,454: 19x13
#923 @ 298,110: 10x20
#924 @ 124,541: 27x25
#925 @ 295,892: 15x19
#926 @ 839,291: 18x20
#927 @ 478,786: 11x11
#928 @ 176,588: 13x13
#929 @ 314,29: 23x17
#930 @ 376,142: 11x26
#931 @ 86,397: 17x29
#932 @ 841,396: 27x25
#933 @ 234,849: 26x27
#934 @ 116,953: 10x18
#935 @ 881,103: 15x15
#936 @ 483,668: 18x21
#937 @ 239,909: 15x19
#938 @ 811,842: 17x18
#939 @ 57,172: 28x15
#940 @ 548,720: 26x29
#941 @ 600,317: 20x26
#942 @ 630,211: 13x27
#943 @ 784,243: 26x21
#944 @ 649,763: 18x27
#945 @ 137,619: 10x20
#946 @ 468,616: 26x17
#947 @ 150,856: 12x19
#948 @ 452,834: 13x22
#949 @ 122,937: 18x27
#950 @ 647,648: 21x25
#951 @ 60,66: 16x18
#952 @ 928,697: 14x28
#953 @ 269,631: 12x21
#954 @ 325,523: 22x18
#955 @ 744,661: 24x24
#956 @ 591,906: 17x12
#957 @ 548,726: 10x17
#958 @ 267,522: 10x22
#959 @ 862,747: 11x27
#960 @ 568,568: 27x26
#961 @ 659,811: 11x19
#962 @ 617,9: 25x24
#963 @ 197,483: 29x12
#964 @ 755,623: 13x20
#965 @ 170,41: 19x16
#966 @ 399,793: 18x13
#967 @ 168,636: 25x20
#968 @ 302,197: 26x12
#969 @ 420,903: 20x19
#970 @ 465,34: 24x29
#971 @ 720,135: 16x20
#972 @ 671,298: 13x19
#973 @ 899,968: 11x18
#974 @ 710,106: 21x17
#975 @ 174,19: 10x21
#976 @ 172,795: 10x25
#977 @ 627,539: 23x17
#978 @ 966,80: 25x25
#979 @ 326,373: 17x20
#980 @ 70,568: 22x12
#981 @ 936,683: 29x12
#982 @ 357,771: 21x15
#983 @ 628,987: 11x10
#984 @ 319,969: 21x27
#985 @ 98,294: 21x28
#986 @ 789,229: 18x19
#987 @ 143,387: 29x19
#988 @ 269,843: 29x11
#989 @ 29,30: 19x10
#990 @ 99,900: 10x17
#991 @ 3,404: 15x23
#992 @ 121,769: 24x24
#993 @ 99,349: 19x12
#994 @ 397,653: 25x16
#995 @ 334,452: 29x17
#996 @ 748,657: 8x4
#997 @ 18,418: 10x21
#998 @ 742,273: 28x24
#999 @ 159,212: 13x22
#1000 @ 441,159: 11x25
#1001 @ 714,700: 22x18
#1002 @ 213,650: 20x13
#1003 @ 719,862: 21x10
#1004 @ 221,91: 22x20
#1005 @ 345,914: 28x19
#1006 @ 474,348: 21x22
#1007 @ 407,287: 14x18
#1008 @ 517,689: 29x11
#1009 @ 292,851: 28x16
#1010 @ 850,916: 16x25
#1011 @ 170,694: 22x11
#1012 @ 670,789: 27x26
#1013 @ 132,396: 14x24
#1014 @ 284,219: 23x27
#1015 @ 261,111: 28x19
#1016 @ 350,443: 19x23
#1017 @ 904,878: 23x10
#1018 @ 983,933: 16x12
#1019 @ 273,195: 26x29
#1020 @ 960,384: 26x23
#1021 @ 159,379: 16x10
#1022 @ 854,168: 24x23
#1023 @ 210,83: 12x20
#1024 @ 309,21: 21x12
#1025 @ 413,78: 19x13
#1026 @ 615,358: 21x28
#1027 @ 476,623: 26x25
#1028 @ 695,703: 13x14
#1029 @ 286,868: 23x14
#1030 @ 87,556: 23x21
#1031 @ 302,471: 21x27
#1032 @ 737,864: 23x14
#1033 @ 701,120: 17x23
#1034 @ 389,337: 27x15
#1035 @ 852,875: 13x15
#1036 @ 696,804: 17x23
#1037 @ 615,956: 28x21
#1038 @ 537,732: 29x10
#1039 @ 599,114: 20x11
#1040 @ 234,757: 11x28
#1041 @ 566,964: 24x24
#1042 @ 470,930: 18x24
#1043 @ 702,613: 15x28
#1044 @ 839,120: 24x24
#1045 @ 915,61: 11x25
#1046 @ 729,573: 28x24
#1047 @ 607,99: 20x27
#1048 @ 80,392: 11x28
#1049 @ 609,303: 20x16
#1050 @ 216,809: 11x23
#1051 @ 247,886: 10x25
#1052 @ 643,151: 13x13
#1053 @ 519,496: 14x29
#1054 @ 209,636: 14x10
#1055 @ 456,740: 22x23
#1056 @ 675,711: 16x27
#1057 @ 957,10: 19x15
#1058 @ 624,104: 21x14
#1059 @ 921,208: 20x15
#1060 @ 955,718: 18x23
#1061 @ 211,718: 14x11
#1062 @ 304,190: 27x28
#1063 @ 392,51: 17x20
#1064 @ 599,46: 27x13
#1065 @ 593,227: 20x15
#1066 @ 841,283: 29x13
#1067 @ 3,568: 22x23
#1068 @ 27,27: 15x27
#1069 @ 457,868: 21x23
#1070 @ 744,296: 22x27
#1071 @ 962,800: 10x12
#1072 @ 418,213: 27x12
#1073 @ 335,495: 10x25
#1074 @ 387,191: 13x7
#1075 @ 74,93: 14x27
#1076 @ 120,276: 13x16
#1077 @ 672,655: 11x18
#1078 @ 906,211: 16x21
#1079 @ 331,911: 21x23
#1080 @ 797,863: 17x15
#1081 @ 969,582: 15x18
#1082 @ 534,355: 25x15
#1083 @ 507,180: 16x24
#1084 @ 859,134: 17x22
#1085 @ 89,243: 13x11
#1086 @ 196,646: 28x25
#1087 @ 237,167: 12x26
#1088 @ 939,352: 26x24
#1089 @ 877,489: 25x22
#1090 @ 819,402: 20x20
#1091 @ 330,89: 23x13
#1092 @ 637,768: 29x13
#1093 @ 103,835: 23x11
#1094 @ 745,397: 10x14
#1095 @ 473,742: 17x12
#1096 @ 339,330: 25x24
#1097 @ 386,556: 14x28
#1098 @ 973,957: 22x25
#1099 @ 491,193: 28x15
#1100 @ 108,696: 21x23
#1101 @ 354,446: 23x28
#1102 @ 202,458: 13x27
#1103 @ 357,45: 23x25
#1104 @ 566,723: 23x21
#1105 @ 245,608: 18x21
#1106 @ 291,303: 25x18
#1107 @ 11,858: 14x27
#1108 @ 121,169: 17x12
#1109 @ 730,740: 10x26
#1110 @ 794,581: 13x27
#1111 @ 16,110: 25x15
#1112 @ 259,33: 14x23
#1113 @ 751,919: 17x10
#1114 @ 119,231: 26x11
#1115 @ 365,335: 22x25
#1116 @ 66,425: 20x22
#1117 @ 676,909: 20x27
#1118 @ 978,168: 10x15
#1119 @ 542,683: 10x15
#1120 @ 475,130: 20x21
#1121 @ 688,155: 22x18
#1122 @ 0,435: 21x24
#1123 @ 739,894: 13x29
#1124 @ 630,811: 20x25
#1125 @ 77,43: 19x21
#1126 @ 489,642: 26x27
#1127 @ 436,15: 10x21
#1128 @ 438,919: 27x10
#1129 @ 508,929: 22x26
#1130 @ 505,974: 15x12
#1131 @ 203,625: 14x21
#1132 @ 172,523: 28x10
#1133 @ 578,910: 21x28
#1134 @ 858,371: 28x16
#1135 @ 320,472: 20x24
#1136 @ 434,602: 10x23
#1137 @ 237,764: 10x28
#1138 @ 845,119: 11x10
#1139 @ 253,726: 21x21
#1140 @ 593,765: 23x16
#1141 @ 689,916: 14x18
#1142 @ 202,660: 11x12
#1143 @ 89,174: 15x25
#1144 @ 200,233: 21x10
#1145 @ 12,800: 25x23
#1146 @ 915,282: 21x23
#1147 @ 164,809: 23x12
#1148 @ 281,750: 14x17
#1149 @ 316,105: 20x24
#1150 @ 15,509: 29x22
#1151 @ 665,720: 16x29
#1152 @ 163,949: 20x15
#1153 @ 352,382: 26x17
#1154 @ 778,424: 27x21
#1155 @ 498,77: 27x26
#1156 @ 661,117: 25x13
#1157 @ 82,43: 17x11
#1158 @ 430,574: 18x13
#1159 @ 484,217: 15x12
#1160 @ 202,864: 15x19
#1161 @ 303,697: 27x17
#1162 @ 923,574: 29x23
#1163 @ 24,573: 14x27
#1164 @ 339,619: 25x10
#1165 @ 416,543: 10x18
#1166 @ 85,154: 22x17
#1167 @ 202,842: 24x26
#1168 @ 671,765: 25x19
#1169 @ 616,821: 29x16
#1170 @ 570,119: 17x22
#1171 @ 442,500: 14x13
#1172 @ 18,652: 26x24
#1173 @ 346,53: 29x13
#1174 @ 634,178: 24x15
#1175 @ 878,267: 19x17
#1176 @ 690,133: 24x12
#1177 @ 861,916: 13x28
#1178 @ 65,485: 27x20
#1179 @ 509,806: 29x22
#1180 @ 725,972: 21x27
#1181 @ 716,78: 10x12
#1182 @ 920,559: 29x25
#1183 @ 402,706: 26x14
#1184 @ 86,340: 12x13
#1185 @ 138,617: 13x15
#1186 @ 72,527: 27x12
#1187 @ 48,879: 18x17
#1188 @ 372,549: 13x24
#1189 @ 126,481: 19x28
#1190 @ 904,552: 27x21
#1191 @ 909,145: 26x16
#1192 @ 715,705: 29x28
#1193 @ 554,591: 24x11
#1194 @ 198,916: 12x28
#1195 @ 575,44: 29x17
#1196 @ 820,656: 20x25
#1197 @ 633,387: 23x16
#1198 @ 31,946: 20x22
#1199 @ 404,903: 11x10
#1200 @ 463,13: 10x22
#1201 @ 473,775: 20x17
#1202 @ 766,345: 29x10
#1203 @ 85,419: 11x12
#1204 @ 825,803: 28x29
#1205 @ 373,231: 27x19
#1206 @ 710,768: 22x27
#1207 @ 893,413: 12x15
#1208 @ 640,486: 18x14
#1209 @ 275,920: 23x10
#1210 @ 817,679: 12x29
#1211 @ 188,662: 28x16
#1212 @ 148,765: 17x13
#1213 @ 299,229: 12x28
#1214 @ 802,748: 24x18
#1215 @ 126,133: 25x16
#1216 @ 516,473: 25x15
#1217 @ 136,37: 17x23
#1218 @ 161,897: 18x24
#1219 @ 803,229: 12x21
#1220 @ 488,119: 10x18
#1221 @ 561,663: 14x25
#1222 @ 117,219: 17x25
#1223 @ 862,749: 29x16
#1224 @ 389,701: 21x24
#1225 @ 878,139: 21x23
#1226 @ 261,125: 26x24
#1227 @ 596,649: 13x24
#1228 @ 191,484: 25x25
#1229 @ 544,245: 19x10
#1230 @ 214,280: 13x20
#1231 @ 44,167: 23x17
#1232 @ 618,31: 23x16
#1233 @ 880,142: 10x13
#1234 @ 339,83: 16x10
#1235 @ 370,455: 22x17
#1236 @ 664,656: 11x26
#1237 @ 879,809: 27x17
#1238 @ 767,880: 15x21
#1239 @ 68,536: 17x16
#1240 @ 166,581: 12x22
#1241 @ 798,321: 27x19
#1242 @ 359,889: 18x25
#1243 @ 834,898: 27x16
#1244 @ 106,935: 22x17
#1245 @ 552,826: 16x27
#1246 @ 57,934: 28x11
#1247 @ 588,157: 17x21
#1248 @ 268,895: 17x24
#1249 @ 591,960: 15x20
#1250 @ 952,684: 28x23
#1251 @ 122,582: 10x13
#1252 @ 212,192: 28x22
#1253 @ 82,189: 26x22
#1254 @ 715,965: 25x12
#1255 @ 49,708: 13x25
#1256 @ 287,918: 18x15
#1257 @ 291,899: 27x20
#1258 @ 544,52: 19x29
#1259 @ 430,904: 13x15
#1260 @ 594,933: 21x16
#1261 @ 483,64: 26x11
#1262 @ 238,322: 12x22
#1263 @ 531,257: 29x14
#1264 @ 644,485: 26x10
#1265 @ 748,916: 21x10
#1266 @ 406,329: 10x10
#1267 @ 119,616: 26x24
#1268 @ 237,334: 26x15
#1269 @ 941,727: 21x24
#1270 @ 52,794: 21x17
#1271 @ 776,340: 27x12
#1272 @ 663,435: 15x21
#1273 @ 956,811: 10x14
#1274 @ 695,953: 27x18
#1275 @ 14,284: 18x22
#1276 @ 917,873: 26x24
#1277 @ 2,255: 21x17
#1278 @ 313,963: 16x19
#1279 @ 695,688: 28x15
#1280 @ 518,678: 29x18
#1281 @ 303,356: 28x22
#1282 @ 604,888: 19x22
#1283 @ 646,264: 20x25
#1284 @ 812,905: 21x28
#1285 @ 94,423: 15x16
#1286 @ 867,681: 12x27
#1287 @ 24,271: 14x27
#1288 @ 149,39: 26x19
#1289 @ 122,773: 18x26
#1290 @ 608,593: 17x20
#1291 @ 380,800: 14x11
#1292 @ 922,325: 12x17
#1293 @ 91,750: 14x21