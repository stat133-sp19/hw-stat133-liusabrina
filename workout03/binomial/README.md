## Binomial Probabilities, Distribution, and Plots

The package `"binomial"` gives users many insights into the binomial distribution, including calculating probabilities, plotting both the probability distribution and the cumulative distribution, and calculating various summary statistics.

- `bin_choose()` calculates the number of combinations you can choose _k_ things in _n_ picks
- `bin_probability()` calculates the probability of getting _k_ successes in _n_ trials given success probability _p_
- `bin_distribution()` calculates the probability distribution given a number of trials and a success probability, producing a data frame of class `"bindis"`
- `plot()` method for a `"bindis"` object to plot the probability histogram of successes
- `bin_cumulative()` calculates the probability distribution and the cumulative distribution given a number of trials and a success probability, producing a data frame of class `"bincum"`
- `plot()` method for a `"bincum"` object to plot the cumulative distribution of successes
    - `bin_variable()` returns the parameters of the binomial in an easy-to-read format, internally producing an object of class `"binvar"`
- `summary()` method for a `"binvar"` object to return parameters and summary measures of the binomial in an easy-to-read format
