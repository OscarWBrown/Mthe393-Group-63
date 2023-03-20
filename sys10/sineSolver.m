s = load("endTime10.mat")
[siner11, siner21, siner31] = sineSolve(endTime1, 1);
[siner12, siner22, siner32] = sineSolve(endTime2, 2);
[siner13, siner23, siner33] = sineSolve(endTime3, 3);
[siner14, siner24, siner34] = sineSolve(endTime4, 4);
[siner15, siner25, siner35] = sineSolve(endTime5, 5);
[siner16, siner26, siner36] = sineSolve(endTime6, 6);
[siner17, siner27, siner37] = sineSolve(endTime7, 7);
[siner18, siner28, siner38] = sineSolve(endTime8, 8);
[siner19, siner29, siner39] = sineSolve(endTime9, 9);
[siner110, siner210, siner310] = sineSolve(endTime10, 10);
[siner111, siner211, siner311] = sineSolve(endTime11, 11);
[siner112, siner212, siner312] = sineSolve(endTime12, 12);
[siner113, siner213, siner313] = sineSolve(endTime13, 13);
[siner114, siner214, siner314] = sineSolve(endTime14, 14);
[siner115, siner215, siner315] = sineSolve(endTime15, 15);
[siner116, siner216, siner316] = sineSolve(endTime16, 16);
[siner117, siner217, siner317] = sineSolve(endTime17, 17);
[siner118, siner218, siner318] = sineSolve(endTime18, 18);
[siner119, siner219, siner319] = sineSolve(endTime19, 19);
[siner120, siner220, siner320] = sineSolve(endTime20, 20);
[siner121, siner221, siner321] = sineSolve(endTime21, 21);
[siner122, siner222, siner322] = sineSolve(endTime22, 22);
[siner123, siner223, siner323] = sineSolve(endTime23, 23);
[siner124, siner224, siner324] = sineSolve(endTime24, 24);
% [siner125, siner225, siner325] = sineSolve(endTime25, 25);
% [siner126, siner226, siner326] = sineSolve(endTime26, 26);
% [siner127, siner227, siner327] = sineSolve(endTime27, 27);
% [siner128, siner228, siner328] = sineSolve(endTime28, 28);
% [siner129, siner229, siner329] = sineSolve(endTime29, 29);
% [siner130, siner230, siner330] = sineSolve(endTime30, 30);
% [siner131, siner231, siner331] = sineSolve(endTime31, 31);
% [siner132, siner232, siner332] = sineSolve(endTime32, 32);
% [siner133, siner233, siner333] = sineSolve(endTime33, 33);
% [siner134, siner234, siner334] = sineSolve(endTime34, 34);
% [siner135, siner235, siner335] = sineSolve(endTime35, 35);
% [siner136, siner236, siner336] = sineSolve(endTime36, 36);
% [siner137, siner237, siner337] = sineSolve(endTime37, 37);
% [siner138, siner238, siner338] = sineSolve(endTime38, 38);
% [siner139, siner239, siner339] = sineSolve(endTime39, 39);
% [siner140, siner240, siner340] = sineSolve(endTime40, 40);
% [siner141, siner241, siner341] = sineSolve(endTime41, 41);
% [siner142, siner242, siner342] = sineSolve(endTime42, 42);
% [siner143, siner243, siner343] = sineSolve(endTime43, 43);
% [siner144, siner244, siner344] = sineSolve(endTime44, 44);
% [siner145, siner245, siner345] = sineSolve(endTime45, 45);
% [siner146, siner246, siner346] = sineSolve(endTime46, 46);
% [siner147, siner247, siner347] = sineSolve(endTime47, 47);
% [siner148, siner248, siner348] = sineSolve(endTime48, 48);
% [siner149, siner249, siner349] = sineSolve(endTime49, 49);
% % [siner150, siner250, siner350] = sineSolve(endTime50);
in = logspace(-4, 4, 25);		
in = in(1:24);

siner3 = [siner31 siner32 siner33 siner34 siner35 siner36 siner37 siner38 siner39 siner310 siner311 siner312 siner313 siner314 siner315 siner316 siner317 siner318 siner319 siner320 siner321 siner322 siner323 siner324] %siner325 siner326 siner327 siner328 siner329 siner330 siner331 siner332 siner333 siner334 siner335 siner336 siner337 siner338 siner339 siner340 siner341 siner342 siner343 siner344 siner345 siner346 siner347 siner348 siner349];
siner2 = [siner21  siner22  siner23  siner24  siner25  siner26  siner27  siner28  siner29  siner210  siner211  siner212  siner213  siner214  siner215  siner216  siner217  siner218  siner219  siner220  siner221  siner222  siner223  siner224] %siner225  siner226  siner227  siner228  siner229  siner230  siner231  siner232  siner233  siner234  siner235  siner236  siner237  siner238  siner239  siner240  siner241  siner242  siner243  siner244  siner245  siner246  siner247  siner248  siner249];
hold off
figure(2)
semilogx(in, smooth((180/pi)*siner2))
figure(3)
semilogx(in, smooth(20*log10(siner3)))
function [period, phaseShift, amplitude] = sineSolve(endTime, index)
    y = smooth(endTime.output.signal);
    avg=0;
    k = logspace(-4, 4, 25);
    k = k(1:24);
    k = k(index);
    
    for i = ceil(160*pi):length(y) %160 is 4 periods
        prev = i;
        current = i+1;
        if y(prev) < 0 && y(current) > 0
            avg = (endTime.output.time(prev)+ endTime.output.time(current))/2;
            avg = mod(avg, 2*pi);
            break
        end
    end 
    total = 0;
    periodCount = 0;
    pointsSkipped = 0;
    for i = 1:length(in) 
        pre = i - 1;
        cur = i;
        nex = i + 1;        
        if ((endTime.output(pre) < endTime.output(cur)) && (endTime.output(cur) > endTime.output(nex)))
            periodCount = periodCount + 1;
            if periodCount >= 4
                if periodCount == 4
                    pointsSkipped = cur;
                end
                total = total + cur.endTime.output.time(cur);
            end 
        end
    end

    period = 0;
    phaseShift = avg;
    amplitude = total/(length(in) - pointsSkipped);
    
end
