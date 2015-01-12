def series(name, n)
  return fibonacci(n) if 'fibonacci'
  return lucas(n) if 'lucas'
  return lucas(n) + fibonacci(n) if 'summed'
end

# http://en.wikipedia.org/wiki/Fibonacci_number#Closed-form_expression
PHI = (1 + 5**0.5) / 2

def fibonacci(n)
  (PHI**n - (-PHI)**(-n)) / Math.sqrt(5)
end

def lucas(n)
  PHI**(n - 1) + (1 - PHI)**(n - 1)
end