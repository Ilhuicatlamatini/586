clear all;
close all;
clc;

load data.mat

[sD,index]=sort(Data(:,11));
m=100;
n=10;
svm_ts_mix8=zeros(m,1);
%
for jj=1:1:m

%columns 489
 Data_sorted = Data(index, :);
 D6=[Data_sorted(:,1),Data_sorted(:,6), Data_sorted(:,8), Data_sorted(:,9),   Data_sorted(:,11)];
% %  
 Data_sorted_no = D6(1:839,:);
 Data_sorted_yes = D6(840:end, :);
 prtmuted_no=randperm(839);
  permuted_yes=randperm(292);
% ddata=double(data.mat)

train_data_no=Data_sorted_no(prtmuted_no(1:587),3);
train_data_yes=Data_sorted_yes(permuted_yes(1:204),3);
 traindata_no=[Data_sorted_no(1:587,1:2),train_data_no(:,1), Data_sorted_no(1:587,4)];
 traindata_yes=[Data_sorted_yes((1:204),1:2),train_data_yes(:,1),Data_sorted_yes((1:204),4)];
Train_D=[traindata_no(:,1:4); traindata_yes(:,1:4)];

test_data_no=Data_sorted_no(prtmuted_no(588:end),3);
test_data_yes=Data_sorted_yes(permuted_yes(205:end),3);
testdata_no=[Data_sorted_no(588:end,1:2),test_data_no(:,1), Data_sorted_no(588:end,4)];
 testdata_yes=[Data_sorted_yes((205:end),1:2), test_data_yes(:,1),Data_sorted_yes((205:end),4)];
Test_D=[testdata_no(:,1:4); testdata_yes(:,1:4)];

c_train=[1+Data_sorted_no(1:587,5); 2*Data_sorted_yes(1:204,5)];


 
 
 svm2=fitcsvm(Train_D,c_train,'KernelFunction','RBF');
 pre5=svm2.predict(Test_D);
% figure(5)
% bar(pre5),
% set(gca,...
%      'Xtick',[ 252])
%  xline(252)
 
 svm_tp_mix8=length(find(pre5(252:end,:)==2));
 svm_fn_mix8=length(find(pre5(252:end,:)==1));
 svm_fp_mix8=length(find(pre5(1:252,:)==2));
 
 svm_ts_mix8(jj)=svm_tp_mix8/(svm_tp_mix8+svm_fp_mix8+svm_fn_mix8);
 
end

svm_total_mix8=sum(svm_ts_mix8)/m