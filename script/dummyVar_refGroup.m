function [codedGroup]=dummyVar_refGroup(group)
uniqueG={group{1}};
for i=1:length(group)-1
    
    if isempty(find(strcmp(group{i+1},uniqueG)))
        uniqueG=[uniqueG;group{i+1}];
    end
end
remainLevels=uniqueG(2:end);
codedGroup=zeros(length(group),length(remainLevels));
for i=1:length(remainLevels)
   ind=find(ismember(group,remainLevels{i})==1);
   codedGroup(ind,i)=1;
end