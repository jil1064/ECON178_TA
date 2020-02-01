data {

    int<lower=2> N;
    int<lower=1> p;
    vector[N] y;
    matrix[N,p] X;
}


parameters {

    real<lower=0> sig_e;
    real beta0;
    vector[p] beta;
}


model {

    y ~ normal(rep_vector(beta0, N) + X * beta, sig_e);
}
