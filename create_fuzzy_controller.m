FIS = newfis('FIS','FISType','mamdani','AndMethod','prod','OrMethod','probor',...
             'ImplicationMethod','prod','AggregationMethod','sum');
         
FIS = addvar(FIS,'input','Cost',[0.5 1.5]);
FIS = addmf(FIS,'input',1,'Cheap','trapmf', [0 0.5 0.75 1]);
FIS = addmf(FIS,'input',1,'Expensive','trapmf',[1 1.25 1.5 2]);
FIS = addmf(FIS,'input',1,'Medium','trapmf',[0.5 0.75 1 1.25]);

FIS = addvar(FIS,'input','Water level prev',[5 20]);
FIS = addmf(FIS,'input',2,'Too Low','trimf',[0 5 7.5]);
FIS = addmf(FIS,'input',2,'Low','trimf',[5 7.5 10]);
FIS = addmf(FIS,'input',2,'Medium','trapmf',[7.5 10 12.5 15]);
FIS = addmf(FIS,'input',2,'High','trimf',[12.5 15 17.5 20]);
FIS = addmf(FIS,'input',2,'Too High','trimf',[17.5 20 25]);

FIS = addvar(FIS,'output','Water level current',[0 5]);
FIS = addmf(FIS,'output',1,'Low','trimf',[-1 0 1]);
FIS = addmf(FIS,'output',1,'Medium','trapmf',[0 1 3 4]);
FIS = addmf(FIS,'output',1,'High','trimf',[4 5 6]);

ruleList = [1 1 3 1 1;   % Rule 1
            1 2 3 1 1;   % Rule 2
            1 3 2 1 1;   % Rule 3
            1 4 2 1 1;   % Rule 4
            1 5 2 1 1;   % Rule 5
            2 5 1 1 1;   % Rule 6
            2 4 1 1 1;   % Rule 7
            2 3 2 1 1;   % Rule 8
            2 2 2 1 1;   % Rule 9
            2 1 2 1 1;   % Rule 10
            3 1 3 1 1;   % Rule 11
            3 2 2 1 1;   % Rule 12
            3 3 2 1 1;   % Rule 13
            3 4 2 1 1;   % Rule 14
            3 5 1 1 1];  % Rule 15
FIS = addrule(FIS, ruleList);