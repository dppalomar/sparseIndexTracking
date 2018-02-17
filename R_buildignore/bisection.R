bisection <- function(c, u) {
  n <- length(c)
  w <- rep(0, n)

  sort_ind <- order(c)
  c_sort <- c[sort_ind]

  high <- n
  low <- 1

  while (low <= high) {
    mid <- floor((low + high) / 2)
    mu <- -1/mid * (sum(c_sort[1:mid]) + 2)

    tst1 <- (mu + c_sort[mid] < 0)
    if (mid < n) {
      tst2 <- (mu + c_sort[mid+1] >= 0)
    }
    else {
      tst2 <- TRUE
    }

    if (tst1 && tst2) {
      break
    }
    else if (tst1 && !tst2) {
      low <- mid + 1
    }
    else {
      high <- mid - 1
    }
  }

  if (all(-(mu + c_sort[1:mid])/2 <= u)) {
    w[sort_ind[1:mid]] <- -(mu + c_sort[1:mid])/2
    return (w)
  }
  else {
    flg <- FALSE
    flg2 <- FALSE
    k <- mid

    while (1) {
      low1 <- 0
      high1 <- k - 1

      while (low1 <= high1) {
        mid1 <- floor((low1 + high1)/2)
        mu <- (2*mid1*u - sum(c_sort[(mid1+1):k]) - 2) / (k - mid1)

        if (mid1 != 0) {
          tst1 <- (mu + c_sort[mid1] <= -2*u)
        }
        else {
          tst1 <- TRUE
        }

        tst2 <- ((-2*u) < (mu + c_sort[mid1+1])) && ((mu + c_sort[k]) < 0)

        if (k < n) {
          tst3 <- ((mu + c_sort[k+1]) >= 0)
        }
        else {
          tst3 <- TRUE
        }

        if (tst1 && tst2 && tst3) {
          flg <- TRUE
          break
        }
        else if (tst1 && !tst2) {
          low1 <- mid1 + 1
        }
        else {
          high1 <- mid1 - 1
        }
      }

      if (flg) {
        break
      }
      else {
        k <- k + 1
      }

      if (k > n) {
        flg2 <- TRUE
        break
      }
    }

    if (flg2) {
      w[sort_ind[1:ceiling(1/u)]] <- u
      return (w)
    }
    else {
      w[sort_ind[1:mid1]] <- u
      w[sort_ind[(mid1+1):k]] <- -(mu + c_sort[(mid1+1):k])/2
      return (w)
    }
  }
}
