s = load("endTime10.mat")
[siner1, siner2, siner3] = sineSolve(s.endTime10);
function [period, phaseShift, amplitude] = sineSolve(endTime)
    y = smooth(endTime.output.signal);
    for i = 1:length(y)
        prev = i;
        current = i+1;
        if y(prev) < 0 && y(current) > 0
            avg = (endTime.output.time(prev)+ endTime.output.time(current))/2;
            break
        end
    end
    cnt = 0;
    for i = 1:length(endTime.output.signal)
        periodPrev = i;
        periodCurrent = i+1;
        if y(periodPrev) < 0 && y(periodCurrent) > 0
            avgPeriod = (endTime.output.time(periodPrev)+ endTime.output.time(periodCurrent))/2;
            cnt = cnt + 1;
        end
        if cnt == 2
            break
        end
        
    end
    period = avgPeriod-avg;
    phaseShift = avg;
    amplitude = max(y);
    
end
