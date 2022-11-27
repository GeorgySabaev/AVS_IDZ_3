#include "stdio.h"

struct Doublefloat {
  float first;
  float second;
};

struct Doublefloat calcExponents(float x) {
  struct Doublefloat retval;
  retval.first = -1;
  retval.second = -1;
  float ex = 1;
  float exneg = 1;
  float tmp = 1;
  int i = 1;
  while ((ex != retval.first || exneg != retval.second)) {
    retval.first = ex;
    retval.second = exneg;
    tmp *= x;
    tmp /= i;
    ex += tmp;
    if (i % 2 == 0) {
      exneg += tmp;
    } else {
      exneg -= tmp;
    }
    ++i;
  }
  return retval;
}

int main() {
  float x;
  scanf("%f", &x);
  struct Doublefloat exponents = calcExponents(x);
  printf("%f", (exponents.first + exponents.second) /
                   (exponents.first - exponents.second));
  return 0;
}
