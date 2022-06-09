clear all
close all
clc
load w1.mat
w1=w;

 load w2.mat
 w2=w;
 load w3.mat
w3=w;
 
 %%
 X = categorical({'I15','I30','I60'});
X = reordercats(X,{'I15','I30','I60'});
alls=[w1; w2; w3];
 bar(X,alls)
 title({'Threat Score','AMH23, KF, SA and Peak Intensity'})
legend('NB','LDA','SVM')



%%
clear all
close all
clc
load q1.mat


 load q2.mat
 
 load q3.mat

 
 %%
 X = categorical({'I15','I30','I60'});
X = reordercats(X,{'I15','I30','I60'});
alls=[w; q2; q3];
 bar(X,alls)
 title({'Threat Score','AMH23, KF, SA and Peak Intensity'})
legend('NB','LDA','SVM')

%%
I15=[0.55, 0.57,0.58, 0.55];



I30=[0.58, 0.55, 0.58, 0.54];




I60=[0.55, 0.56 , 0.58, 0.54];

 models=[I15; I30; I60];
 X = categorical({'I15','I30','I60'});
X = reordercats(X,{'I15','I30','I60'});
figure(232)
 bar(X,models)
 title({'Threat Score','Sorted by Peak Intensity'})
legend('Model A','Model B','Model C', 'Model D')




% I15=[0.55, 0.57,0.58, 0.55];
MA=[0.55,0.58,0.55];
MB=[ 0.57,0.55,0.56 ];
MC=[0.58,0.58,0.58];
MD=[0.55,0.54,0.54];

% I30=[0.58, 0.55, 0.58, 0.54];




% I60=[0.55, 0.56 , 0.58, 0.54];

 models=[I15; I30; I60];
 X = categorical({'Model A','Model B','Model C', 'Model D'});
X = reordercats(X,{'Model A','Model B','Model C', 'Model D'});
figure(232)
 bar(X,models)
 title({'Threat Score','Sorted by Model'})
legend('I15','I30','I60')



%%

% graph vi
clear all;
close all
clc



db=[0.0837	 0.0852 0.0821];	
d23=[0.0831 0.0850 0.0822];
SA=[0.0884	0.1304	 0.1859];	
KF=[0.0832	0.0840	 0.0818];	 
I=[0.0751 0.1020 0.1209];

allss=[db; d23; SA; KF; I];
bar(allss)

%%
clear all;
close all;
clc
i15=[ 0.0837 0.0831  0.0832	 0.0884	 0.0751];
i30= [0.0852 0.0850	  0.0840 0.1304	 0.1020];
i60=[ 0.0821 0.0822	0.0818  0.1859	  0.1209];

allss=[i15; i30; i60];

X = categorical({'I15','I30','I60'});
X = reordercats(X,{'I15','I30','I60'});
figure(232)
b= bar(X,allss);
 b(4).FaceColor = [0 .5 1];
 b(5).FaceColor = [0 0 1];
 
  b(1).FaceColor = [1 0 0];
 b(2).FaceColor = [1 .4 0];
  b(3).FaceColor = [1 .2 .1];
 
title({'Variable Importance','Model D'})
legend('db1000', 'AMH23', 'KF' ,'SA' ,'I');


%%


clear all;
close all;
clc;

i15=[ 0.0899 	0.0882 0.0440 0.0272 0.0319 ];



i30= [0.0889 0.0877 0.0420 0.0239 0.0370];
i60=[0.0889 0.0870	0.0476 0.0267 	0.0445];

allss=[i15; i30; i60];

X = categorical({'I15','I30','I60'});
X = reordercats(X,{'I15','I30','I60'});
figure(232)
b= bar(X,allss);
 b(3).FaceColor = [0 .5 1];
 b(5).FaceColor = [0 0 1];
 b(4).FaceColor = [0 .7 1];
  b(1).FaceColor = [1 0 0];
 b(2).FaceColor = [1 .4 0];
  
 
title({'Variable Importance','Model C'})
legend('db1000', 'AMH23', 'SD', 'SA' ,'I');

%%







clear all;
close all;
clc;

i15=[ 0.0841 0.0827 0.0829 	0.0709  ];



i30=[0.0853 0.0849	0.1330 0.1031 ];
i60=[0.0822 0.0832 0.1985 0.1185];

allss=[i15; i30; i60];

X = categorical({'I15','I30','I60'});
X = reordercats(X,{'I15','I30','I60'});
figure(232)
b= bar(X,allss);
 b(3).FaceColor = [0 .5 1];
 b(4).FaceColor = [0 0 1];

  b(1).FaceColor = [1 0 0];
 b(2).FaceColor = [1 .4 0];
  
 
title({'Variable Importance','Model B'})
legend('db1000', 'AMH23', 'SA' ,'I');


%%




clear all;
close all;
clc;

i15=[0.0899 0.0892 	0.1314	0.1326  ];



i30=[	0.0827 0.0819 0.1834 0.1600 ];
i60=[0.1137 	0.1132 	0.2638 	0.1828 ];

allss=[i15; i30; i60];

X = categorical({'I15','I30','I60'});
X = reordercats(X,{'I15','I30','I60'});
figure(232)
b= bar(X,allss);
 b(3).FaceColor = [0 .5 1];
 b(4).FaceColor = [0 0 1];

  b(1).FaceColor = [1 0 0];
 b(2).FaceColor = [1 .4 0];
  
 
title({'Variable Importance','Model A'})
legend('db1000', 'AMH23', 'SA' ,'I');
