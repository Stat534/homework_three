data {
  int<lower=0> N; // number of data points
  vector[N] y; // response
  matrix[N,N] dist; // distance matrix
  vector[N] x1; // covariate
  vector[N] x2; // covariate
}

parameters {
  real<lower = 0.1, upper = 0.6> phi;
  real<lower = 0> sigmasq;
  real beta1;
  real beta2;
}

transformed parameters{
  vector[N] mu_vec;
  corr_matrix[N] Sigma;
  
  for(i in 1:N) mu_vec[i] = x1[i] * beta1 + x2[i] * beta2;
  for(i in 1:(N-1)){
   for(j in (i+1):N){
     Sigma[i,j] = exp((-1)*dist[i,j]/ phi);
     Sigma[j,i] = Sigma[i,j];
   }
 }
 for(i in 1:N) Sigma[i,i] = 1;

}

model {
  y ~ multi_normal(mu_vec ,sigmasq * Sigma);
  phi ~ inv_gamma(20,5);
  sigmasq ~ inv_gamma(20,20);
  beta1 ~ normal(0, 50);
  beta2 ~ normal(0, 50);
}
