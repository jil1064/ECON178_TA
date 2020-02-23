data {

    int<lower=2> N;
    int<lower=1> p;
    vector[N] y;
    matrix[N,p] X;
}


parameters {

    real<lower=0> sig_e;
    real<lower=0> nu;
    real beta0;
    vector[p] beta;
    real<lower=0> lam;
}


model {

    beta ~ normal(0, lam * sig_e);
    nu ~ gamma(2,0.1);
    y ~ student_t(nu, rep_vector(beta0, N) + X * beta, sig_e);
}
