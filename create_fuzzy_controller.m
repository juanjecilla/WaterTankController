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

FIS = addvar(FIS,'output','Water level current',[5 20]);
FIS = addmf(FIS,'output',1,'Low','trimf',[5 7.5 10]);
FIS = addmf(FIS,'output',1,'Medium','trapmf',[7.5 10 12.5 15]);
FIS = addmf(FIS,'output',1,'High','trimf',[12.5 15 17.5 20]);