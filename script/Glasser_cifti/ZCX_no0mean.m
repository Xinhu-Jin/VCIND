function y = ZCX_no0mean(x,dim)

if nargin==1, 
  % Determine which dimension SUM will use
  dim = find(size(x)~=1, 1 );
  if isempty(dim), dim = 1; end

  y = sum(x)./sum(logical(x),dim);
else
  y = sum(x,dim)./sum(logical(x),dim);
end
