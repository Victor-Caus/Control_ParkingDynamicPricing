s = tf('s');
Gf = (Ki*f*a/(1-Kp*a))/(s^2 + s*(f + Kp*f*a - Ki*a)/(1-Kp*a) + (Ki*a*f)/(1-Kp*a));