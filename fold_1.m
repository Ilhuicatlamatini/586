clear all;
close all;
clc;

load data.mat

[sD,index]=sort(Data(:,11));
m=100;
svm_ts_fold=zeros(8,1);
 svm_tp_fold=zeros(8,1);
 svm_fn_fold=zeros(8,1);
 svm_fp_fold=zeros(8,1);
  svm_tn_fold=zeros(8,1);
svm_ts_permutation=zeros(100,1);
svm_tp_permutation=zeros(100,1);
svm_fn_permutation=zeros(100,1);
svm_fp_permutation=zeros(100,1);
svm_tn_permutation=zeros(100,1);


%
for jj=1:m

%columns 489
 Data_sorted = Data(index, :);
 D6=[Data_sorted(:,2),Data_sorted(:,5), Data_sorted(:,8), Data_sorted(:,9),   Data_sorted(:,11)];
 
 Data_sorted_no = D6(1:839,:);
 Data_sorted_yes = D6(840:end, :);
 perm_no=randperm(839);
  perm_yes=randperm(292);
Data_no=Data_sorted_no((perm_no),:);
Data_yes=Data_sorted_yes((perm_yes),:);


    %1k folds
    test_data_no=Data_no((1:252),:);
    train_data_no=Data_no((253:end),:);
    test_data_yes=Data_yes((1:88),:);
    train_data_yes=Data_yes((89:end),:);

Test_D=[test_data_no(:,1:4); test_data_yes(:,1:4)];
Train_D=[train_data_no(:,1:4); train_data_yes(:,1:4)];
c_train=[1+train_data_no(:,5); 2*train_data_yes(:,5)];

svm=fitcsvm(Train_D,c_train,'KernelFunction','RBF');
 pre5=svm.predict(Test_D);
% figure(5)
% bar(pre5),
% set(gca,...
%      'Xtick',[ 252])
%  xline(252)
 
 svm_tp_fold(1)=length(find(pre5(253:end,:)==2));
 svm_fn_fold(1)=length(find(pre5(253:end,:)==1));
 svm_fp_fold(1)=length(find(pre5(1:252,:)==2));
 svm_tn_fold(1)=length(find(pre5(1:252,:)==1));
 
 svm_ts_fold(1)=svm_tp_fold(1)/(svm_tp_fold(1)+svm_fp_fold(1)+svm_fn_fold(1));
 % 2nd
 test_data_no=Data_no((84:335),:);
    train_data_no=[Data_no((1:83),:);Data_no((336:end),:)];
    test_data_yes=Data_yes((29:116),:);
    train_data_yes=[Data_yes((1:28),:);Data_yes((117:end),:)];

Test_D=[test_data_no(:,1:4); test_data_yes(:,1:4)];
Train_D=[train_data_no(:,1:4); train_data_yes(:,1:4)];
c_train=[1+train_data_no(:,5); 2*train_data_yes(:,5)];


svm=fitcsvm(Train_D,c_train,'KernelFunction','RBF');
 pre5=svm.predict(Test_D);
% figure(5)
% bar(pre5),
% set(gca,...
%      'Xtick',[ 252])
%  xline(252)
 
 svm_tp_fold(2)=length(find(pre5(253:end,:)==2));
 svm_fn_fold(2)=length(find(pre5(253:end,:)==1));
 svm_fp_fold(2)=length(find(pre5(1:252,:)==2));
 svm_tn_fold(2)=length(find(pre5(1:252,:)==1));
 svm_ts_fold(2)= svm_tp_fold(2)/(svm_tp_fold(2)+svm_fp_fold(2)+svm_fn_fold(2));
 
 
  
 % 3nd
 test_data_no=Data_no((168:419),:);
    train_data_no=[Data_no((1:167),:);Data_no((420:end),:)];
    test_data_yes=Data_yes((58:145),:);
    train_data_yes=[Data_yes((1:57),:);Data_yes((146:end),:)];

Test_D=[test_data_no(:,1:4); test_data_yes(:,1:4)];
Train_D=[train_data_no(:,1:4); train_data_yes(:,1:4)];
c_train=[1+train_data_no(:,5); 2*train_data_yes(:,5)];


svm=fitcsvm(Train_D,c_train,'KernelFunction','RBF');
 pre5=svm.predict(Test_D);
% figure(5)
% bar(pre5),
% set(gca,...
%      'Xtick',[ 252])
%  xline(252)
 
 svm_tp_fold(3)=length(find(pre5(253:end,:)==2));
 svm_fn_fold(3)=length(find(pre5(253:end,:)==1));
 svm_fp_fold(3)=length(find(pre5(1:252,:)==2));
 svm_tn_fold(3)=length(find(pre5(1:252,:)==1));
 svm_ts_fold(3)= svm_tp_fold(3)/(svm_tp_fold(3)+svm_fp_fold(3)+svm_fn_fold(3));
 
 
 % 4nd
 test_data_no=Data_no((252:503),:);
    train_data_no=[Data_no((1:251),:);Data_no((504:end),:)];
    test_data_yes=Data_yes((87:174),:);
    train_data_yes=[Data_yes((1:86),:);Data_yes((175:end),:)];

Test_D=[test_data_no(:,1:4); test_data_yes(:,1:4)];
Train_D=[train_data_no(:,1:4); train_data_yes(:,1:4)];
c_train=[1+train_data_no(:,5); 2*train_data_yes(:,5)];


svm=fitcsvm(Train_D,c_train,'KernelFunction','RBF');
 pre5=svm.predict(Test_D);
% figure(5)
% bar(pre5),
% set(gca,...
%      'Xtick',[ 252])
%  xline(252)
 
 svm_tp_fold(4)=length(find(pre5(253:end,:)==2));
 svm_fn_fold(4)=length(find(pre5(253:end,:)==1));
 svm_fp_fold(4)=length(find(pre5(1:252,:)==2));
 svm_tn_fold(4)=length(find(pre5(1:252,:)==1));
 svm_ts_fold(4)= svm_tp_fold(4)/(svm_tp_fold(4)+svm_fp_fold(4)+svm_fn_fold(4));
 
 
 % 5nd
 test_data_no=Data_no((336:587),:);
    train_data_no=[Data_no((1:335),:);Data_no((588:end),:)];
    test_data_yes=Data_yes((116:203),:);
    train_data_yes=[Data_yes((1:115),:);Data_yes((204:end),:)];

Test_D=[test_data_no(:,1:4); test_data_yes(:,1:4)];
Train_D=[train_data_no(:,1:4); train_data_yes(:,1:4)];
c_train=[1+train_data_no(:,5); 2*train_data_yes(:,5)];


svm=fitcsvm(Train_D,c_train,'KernelFunction','RBF');
 pre5=svm.predict(Test_D);
% figure(5)
% bar(pre5),
% set(gca,...
%      'Xtick',[ 252])
%  xline(252)
 
 svm_tp_fold(5)=length(find(pre5(253:end,:)==2));
 svm_fn_fold(5)=length(find(pre5(253:end,:)==1));
 svm_fp_fold(5)=length(find(pre5(1:252,:)==2));
 svm_tn_fold(5)=length(find(pre5(1:252,:)==1));
 svm_ts_fold(5)= svm_tp_fold(5)/(svm_tp_fold(5)+svm_fp_fold(5)+svm_fn_fold(5));

 
  % 6st
 test_data_no=Data_no((420:671),:);
    train_data_no=[Data_no((1:419),:);Data_no((672:end),:)];
    test_data_yes=Data_yes((145:232),:);
    train_data_yes=[Data_yes((1:144),:);Data_yes((233:end),:)];

Test_D=[test_data_no(:,1:4); test_data_yes(:,1:4)];
Train_D=[train_data_no(:,1:4); train_data_yes(:,1:4)];
c_train=[1+train_data_no(:,5); 2*train_data_yes(:,5)];


svm=fitcsvm(Train_D,c_train,'KernelFunction','RBF');
 pre5=svm.predict(Test_D);
% figure(5)
% bar(pre5),
% set(gca,...
%      'Xtick',[ 252])
%  xline(252)
 
 svm_tp_fold(6)=length(find(pre5(253:end,:)==2));
 svm_fn_fold(6)=length(find(pre5(253:end,:)==1));
 svm_fp_fold(6)=length(find(pre5(1:252,:)==2));
 svm_tn_fold(6)=length(find(pre5(1:252,:)==1));
 svm_ts_fold(6)=svm_tp_fold(6)/(svm_tp_fold(6)+svm_fp_fold(6)+svm_fn_fold(6));

 
  % 7st
 test_data_no=Data_no((504:755),:);
    train_data_no=[Data_no((1:503),:);Data_no((756:end),:)];
    test_data_yes=Data_yes((174:261),:);
    train_data_yes=[Data_yes((1:173),:);Data_yes((262:end),:)];

Test_D=[test_data_no(:,1:4); test_data_yes(:,1:4)];
Train_D=[train_data_no(:,1:4); train_data_yes(:,1:4)];
c_train=[1+train_data_no(:,5); 2*train_data_yes(:,5)];


svm=fitcsvm(Train_D,c_train,'KernelFunction','RBF');
 pre5=svm.predict(Test_D);
% figure(5)
% bar(pre5),
% set(gca,...
%      'Xtick',[ 252])
%  xline(252)
 
 svm_tp_fold(7)=length(find(pre5(253:end,:)==2));
 svm_fn_fold(7)=length(find(pre5(253:end,:)==1));
 svm_fp_fold(7)=length(find(pre5(1:252,:)==2));
 svm_tn_fold(7)=length(find(pre5(1:252,:)==1));
 svm_ts_fold(7)=svm_tp_fold(7)/(svm_tp_fold(7)+svm_fp_fold(7)+svm_fn_fold(7));

% 8st
 test_data_no=Data_no((588:end),:);
    train_data_no=Data_no((1:587),:);
    test_data_yes=Data_yes((205:end),:);
    train_data_yes=Data_yes((1:204),:);

Test_D=[test_data_no(:,1:4); test_data_yes(:,1:4)];
Train_D=[train_data_no(:,1:4); train_data_yes(:,1:4)];
c_train=[1+train_data_no(:,5); 2*train_data_yes(:,5)];


svm=fitcsvm(Train_D,c_train,'KernelFunction','RBF');
 pre5=svm.predict(Test_D);
% figure(5)
% bar(pre5),
% set(gca,...
%      'Xtick',[ 252])
%  xline(252)
 
 svm_tp_fold(8)=length(find(pre5(253:end,:)==2));
 svm_fn_fold(8)=length(find(pre5(253:end,:)==1));
 svm_fp_fold(8)=length(find(pre5(1:252,:)==2));
 svm_tn_fold(8)=length(find(pre5(1:252,:)==1));
 svm_ts_fold(8)=svm_tp_fold(8)/(svm_tp_fold(8)+svm_fp_fold(8)+svm_fn_fold(8));

 svm_ts_permutation(jj)=sum(svm_ts_fold)/8;
 svm_tp_permutation(jj)=sum(svm_tp_fold)/8;
svm_fn_permutation(jj)=sum(svm_fn_fold)/8;
svm_fp_permutation(jj)=sum(svm_fp_fold)/8;
svm_tn_permutation(jj)=sum(svm_tn_fold)/8;
end


TS=sum(svm_ts_permutation)/m
True_positive=sum(svm_tp_permutation)/m
False_negative=sum(svm_fn_permutation)/m
False_positive=sum(svm_fp_permutation)/m
True_negative=sum(svm_tn_permutation)/m
