%Another approach is calculating the permutation feature importance. 
%Here you replace the features one by one with a permutated vector. 
%For this permutated dataset you determine the drop in accuracy (or any other score you prefer to use).
%By repeating this a number of times you get an estimate of the feature importance. 
%https://www.mathworks.com/matlabcentral/answers/406577-how-can-i-determine-feature-importance-of-an-svm-classifier



clear all;
close all;
clc;

load data.mat

[sD,index]=sort(Data(:,11));
m=100;
svm_ts_mix4=zeros(m,1);
%mixing 15mml
%
for jj=1:m

%columns 489
 Data_sorted = Data(index, :);
 D6=[Data_sorted(:,1),Data_sorted(:,4), Data_sorted(:,8), Data_sorted(:,9),   Data_sorted(:,11)];
% %  
 Data_sorted_no = D6(1:839,:);
 Data_sorted_yes = D6(840:end, :);
 prtmuted_no=randperm(839);
  permuted_yes=randperm(292);
% ddata=double(data.mat)

train_data_no=Data_sorted_no(prtmuted_no(1:587),1);
train_data_yes=Data_sorted_yes(permuted_yes(1:204),1);
 traindata_no=[train_data_no(:,1), Data_sorted_no(1:587,2:4)];
 traindata_yes=[train_data_yes(:,1),Data_sorted_yes((1:204),2:4)];
Train_D=[traindata_no(:,1:4); traindata_yes(:,1:4)];

test_data_no=Data_sorted_no(prtmuted_no(588:end),1);
test_data_yes=Data_sorted_yes(permuted_yes(205:end),1);
testdata_no=[test_data_no(:,1), Data_sorted_no(588:end,2:4)];
 testdata_yes=[test_data_yes(:,1),Data_sorted_yes((205:end),2:4)];
Test_D=[testdata_no(:,1:4); testdata_yes(:,1:4)];

c_train=[1+Data_sorted_no(1:587,5); 2*Data_sorted_yes(1:204,5)];


 
 
 svm2=fitcsvm(Train_D,c_train,'KernelFunction','RBF');
 pre5=svm2.predict(Test_D);
% figure(5)
% bar(pre5),
% set(gca,...
%      'Xtick',[ 252])
%  xline(252)
 
 svm_tp_mix4=length(find(pre5(252:end,:)==2));
 svm_fn_mix4=length(find(pre5(252:end,:)==1));
 svm_fp_mix4=length(find(pre5(1:252,:)==2));
 
 svm_ts_mix4(jj)=svm_tp_mix4/(svm_tp_mix4+svm_fp_mix4+svm_fn_mix4);
 
end

svm_total_mix4=sum(svm_ts_mix4)/m