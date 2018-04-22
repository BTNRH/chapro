% test IIR filterbank design
function iirfb
no=2;     % filter order
td=2.5;   % target delay
sr=24000; % sampling rate
cf=[317.2,503.0,797.6,1265,2006,3181,5045]; % crossover frequencies
nt=sr;
% filter design
[b,a]=iir_fbco(sr,cf,no);
[g,d]=peak_align_par(b,a,sr,td);
g=adjust_gain(b,a,g,d,cf,sr);
% filter example
x=[1;zeros(nt-1,1)];
y=filterbank(x,b,a);
y=peak_align(y,g,d);
z=sum(y,2);
%
plot_filt(y,sr,td,'IIR filterbank',1)
plot_filt(z,sr,td,'IIR filter-sum',3)
filter_print(b,a,g,d);
% save 
b = transpose(b);
a = transpose(a);
save iirfb b a g d cf sr -v4
return

function [b,a]=iir_fbco(sr,cf,no)
% sr - sampling rate
% cf - cross-over frequencies
% no - filter order
% y  - output signal
cos = 9;            % cross-over spread parameter
nb = length(cf)+1;  % number of bands
% calculate IIR filter coefficients
fn = sr/2;            % Nyquist rate
n2 = 2 * no;          % double filter order
b = zeros(nb,n2+1);   % initialize b coefficient array
a = zeros(nb,n2+1);   % initialize a coefficient array
s = 1 + cos ./ cf;    % cross-over spread
wn=(cf(1)/s(1))/fn;
[b(1,:),a(1,:)] = butter(n2,wn);           % low-pass
for k=2:(nb-1)
    wn=[cf(k-1)*s(k-1) cf(k)/s(k)]/fn;
    [b(k,:),a(k,:)] = butter(no,wn);       % band-pass
end
wn=(cf(nb-1)*s(nb-1))/fn;
[b(nb,:),a(nb,:)] = butter(n2,wn,'high');  % high-pass
return

function y=filterbank(x,b,a)
nb = size(b,1);
% apply filters to input
x = x(:);                % ensure input is column vector
y = zeros(length(x),nb); % initialize output signal
for k=1:nb
   y(:,k) = filter(b(k,:),a(k,:),x);
end
return

function [g,d]=peak_align_par(b,a,sr,td)
nt=1+round(sr*td);
x=[1;zeros(nt-1,1)];
y=filterbank(x,b,a);
nc=size(y,2);
yp=max(y);
yn=min(y);
kk=(-yn)>yp;
g=ones(1,nc);
g(kk)=-g(kk);
y(:,kk)=-y(:,kk);
[~,kp]=max(y);
dd=td*sr/1000;
d=max(0,round(dd-kp));
return

function g=adjust_gain(b,a,g,d,cf,sr)
nb=size(b,1);
nt=sr;
x=[1;zeros(nt-1,1)];
for iter=1:8
    y=filterbank(x,b,a);
    y=peak_align(y,g,d);
    z=sum(y,2);
    H=ffa(z);
    for k=1:(nb-2)
        e=(0:4)/4;
        f=(cf(k).^e).*(cf(k+1).^(1-e));
        m=1+round(f*(nt/sr));
        g(k+1)=g(k+1)/exp(mean(log(abs(H(m)))));
    end
end
return

function y=peak_align(y,p,d)
[nt,nc]=size(y);
for k=1:nc
    zz=zeros(d(k),1);
    yy=y(1:(nt-d(k)),k);
    y(:,k)=[zz;yy]*p(k);
end
return

function plot_filt(y,sr,td,lab,fig)
nt=size(y,1);
t=1000*(0:(nt-1))/sr;
% plot impulse responses
figure(fig);clf
plot(t,y)
title(sprintf('%s impulse response',lab))
ymn=min(min(y));
ymx=max(max(y));
ymg=(ymx-ymn)/20;
y_lim=[ymn-ymg ymx+ymg];
t_lim=[-0.5 12.5];
axis([t_lim y_lim])
xlabel('time (ms)')
% plot transfer functions
figure(fig+1);clf
H=ffa(y);
f=linspace(0,sr/2000,length(H))';
d=td*ones(size(f));
fm=max(max(f));
if (size(y,2)>1) mmn=-35; else mmn=-5; end
m_lim=[0.05 fm mmn 5];
d_lim=[0.05 fm   0 8];
M=db(H);
D=gd(H,f);
D(M<-40)=NaN;
subplot(2,1,1)
semilogx(f,M)
axis(m_lim)
ylabel('magnitude (dB)')
title(sprintf('%s transfer function',lab))
subplot(2,1,2)
semilogx(f,D,f,d,':k')
axis(d_lim)
xlabel('frequency (kHz)')
ylabel('delay (ms)')
return

function y=db(x)
y=20*log10(max(eps,abs(x)));
return

function d=gd(H,f)
[nf,nc]=size(H);
d=zeros(nf,nc);
for k=1:nc
   p=unwrap(angle(H(:,k)))/(2*pi);
   d(:,k)=-cdif(p)./cdif(f);
end
return

function dx=cdif(x)
n=length(x);
dx=zeros(size(x));
dx(1)=x(2)-x(1);
dx(2:(n-1))=(x(3:n)-x(1:(n-2)))/2;
dx(n)=x(n)-x(n-1);
return

% fast Fourier analyze real signal
function H=ffa(h)
H=fft(real(h));
n=length(H);
m=1+n/2;            % assume n is even
H(1,:)=real(H(1,:));
H(m,:)=real(H(m,:));
H((m+1):n,:)=[];    % remove upper frequencies
return

function filter_print(b,a,g,d)
nb=length(d);
fprintf('b = \n');
for k=1:nb
    fprintf('%15.8e,',b(k,:));
    fprintf('\n');
end
fprintf('a = \n');
for k=1:nb
    fprintf('%15.8e,',a(k,:));
    fprintf('\n');
end
fprintf('g = ');
fprintf('%.5f,',g);
fprintf('\n');
fprintf('d = ');
fprintf('%d,',d);
fprintf('\n');
return
edit butter
