%quadratique 1, f(s) =sg+1/2sHs

function [fs] = quadratique(s,g,H)
	fs=transpose(s)*g+1/2*transpose(s)*H*s
end	
