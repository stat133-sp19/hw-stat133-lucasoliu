# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'


check_prob <- function(prob) {
  if (prob < 0 || prob > 1) {
    stop('invalid prob value')
  } else {
    return(TRUE)
  }
}

check_trials <- function(trials) {
  if (trials%%1 == 0 && trials >= 1) {
    return(TRUE)
  } else {
    stop('invalid trials value')
  }
}

check_success <- function(success, trials) {
  if (length(success) <= trials && success <= trials) {
    return(TRUE)
  } else {
    stop('invalid success value')
  }
}




aux_mean <- function(trials, prob) {
  return(trials * prob)
}

aux_variance <- function(trials, prob) {
  return((trials * prob) * (1 - prob))
}

aux_mode <- function(trials, prob) {
  return(floor((trials * prob) + prob))
}

aux_skewness <- function(trials, prob) {
  return((1-(2*prob))/sqrt(aux_variance(trials, prob)))
}

aux_kurtosis <- function(trials, prob) {
  return((1-(6 * prob * (1 - prob)))/aux_variance(trials, prob))
}




bin_choose <- function(n, k) {
  if (k > n) {
    stop('k cannot be greater than n')
  } else {
    return(factorial(n) / (factorial(k) * (factorial(n - k))))
  }
}

bin_probability <- function(success, trials, prob) {
  if (!check_trials(trials)) {
    stop('invalid trials value')
  }
  if (!check_success(success, trials)) {
    stop('invalid success value')
  }
  if (!check_prob(prob)) {
    stop('invalid prob value')
  }
  return(bin_choose(trials, success) * prob^success * (1-prob)^(trials-success))
}

bin_distribution <- function(trials, prob) {
  x <- data.frame(success=integer(), probability=double())
  for (i in 0:trials) {
    x <- rbind(x, data.frame(success=i, probability=bin_probability(i, trials, prob)))
  }
  return(x)
}

plot.bindis <- function(bindis) {
  return(barplot(bindis$probability, xlab='success', ylab='probability'))
}

bin_cumulative <- function(trials, prob) {
  x <- data.frame(success=integer(), probability=double(), cumulative=double())
  for (i in 0:trials) {
    if (i == 0) {
      x <- rbind(x, data.frame(success=i, probability=bin_probability(i, trials, prob), cumulative=bin_probability(i, trials, prob)))
    } else {
      x <- rbind(x, data.frame(success=i, probability=bin_probability(i, trials, prob), cumulative=bin_probability(i, trials, prob) + x$cumulative[i]))
    }
  }
  return(x)
}

plot.bincum <- function(bincum) {
  return(plot(bincum$success, bincum$cumulative, type='l'))
}

bin_variable <- function(trials, prob) {
  if (!check_trials(trials)) {
    stop('invalid trials')
  }
  if (!check_prob(prob)) {
    stop('invalid prob')
  }
  x <- list(trials=trials, prob=prob)
  class(x) <- "binvar"
  return(x)
}

print.binvar <- function(binvar) {
  print("Binomial variable")
  print("Parameters")
  print(paste("-number of trials: ", binvar$trials))
  print(paste("-prob of success: ", binvar$prob))
}

summary.binvar <- function(binvar) {
  print("Summary Binomial")
  print("Parameters")
  print(paste("-trials: ", binvar$trials))
  print(paste("-prob: ", binvar$prob))
  print("Measures")
  print(paste("-mean: ", aux_mean(binvar$trials, binvar$prob)))
  print(paste("-variance: ", aux_variance(binvar$trials, binvar$prob)))
  print(paste("-mode: ", aux_mode(binvar$trials, binvar$prob)))
  print(paste("-skewness: ", aux_skewness(binvar$trials, binvar$prob)))
  print(paste("-kurtosis: ", aux_kurtosis(binvar$trials, binvar$prob)))
}

bin_mean <- function(trials, prob) {
  if (!check_trials(trials)) {
    stop('invalid trials')
  }
  if (!check_prob(prob)) {
    stop('invalid prob')
  }
  return(aux_mean(trials, prob))
}

bin_variance <- function(trials, prob) {
  if (!check_trials(trials)) {
    stop('invalid trials')
  }
  if (!check_prob(prob)) {
    stop('invalid prob')
  }
  return(aux_variance(trials, prob))
}

bin_mode <- function(trials, prob) {
  if (!check_trials(trials)) {
    stop('invalid trials')
  }
  if (!check_prob(prob)) {
    stop('invalid prob')
  }
  return(aux_mode(trials, prob))
}

bin_skewness <- function(trials, prob) {
  if (!check_trials(trials)) {
    stop('invalid trials')
  }
  if (!check_prob(prob)) {
    stop('invalid prob')
  }
  return(aux_skewness(trials, prob))
}

bin_kurtosis <- function(trials, prob) {
  if (!check_trials(trials)) {
    stop('invalid trials')
  }
  if (!check_prob(prob)) {
    stop('invalid prob')
  }
  return(aux_kurtosis(trials, prob))
}
