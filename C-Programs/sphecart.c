/* Include Files */
#include "sphecart.h"
#include <math.h>

/* Function Definitions */
/*
 * Conversion from spehrical to cartesian
 *    Detailed explanation goes here
 *
 * Arguments    : double r
 *                double thetha
 *                double rho
 *                double *x
 *                double *y
 *                double *z
 * Return Type  : void
 */
void sphecart(double r, double thetha, double rho, double *x, double *y,
              double *z)
{
  double x_tmp;
  x_tmp = r * cos(rho);
  *x = x_tmp * cos(thetha);
  *y = x_tmp * sin(thetha);
  *z = r * sin(rho);
}

