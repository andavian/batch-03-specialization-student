# Building an Elliptic Curve from scratch

## Point addition in EC with algorithm

Now that point addition has been graphically explained and Field Group has been introduced, it is time to present an algorithm for point addition. This algorithm has been taken from ["An Introduction To Mathematical Cryptography" by Hoffstein](<https://github.com/isislovecruft/library--/blob/master/cryptography%20%26%20mathematics/An%20Introduction%20to%20Mathematical%20Cryptography%20(2014)%20-%20Hoffstein%2C%20Pipher%2C%20Silverman.pdf>):

Given an Elliptic Curve $E$: $y^2 = x^3 + AX + B$
Also, being $P1$ and $P2$ points on the curve $E$. It applies that:

(a) If $P_1 = (0,0)$, then $P_1 + P_2 = P_2$.
(b) Otherwise, if $P_2 = (0,0)$, then $P_1 + P_2 = P_1$.
(c) Otherwise, write $P_1 = (x_1, y_1)$ and $P_2 = (x_2, y_2)$.
(d) If $x_1 = x_2$ and $y_1 =−y_2$, then $P_1 +P_2 = (0, 0)$.
(e) If $x_1 = x_2$ and $y_1 \neq y_2$, then $P_1 +P_2 = (0, 0)$.
(f) Otherwise:

- (e1) if $P_1 \neq P_2$, then: $λ = (y_2 - y_1)/(x_2 - x_1)$
- (e2) if $P_1 = P_2$, then: $λ = (3 * x_1^2 + A)/(2 * y_1)$

(g) $x_3 = λ^2 − x_1 − x_2$, $y_3 = λ(x_1 − x_3) − y_1$
(h) $P_1 + P_2 = (x_3, y_3)$

## Division on finite Field Group

Since we are working with finite Field Groups, the division works in a different way. Let's say we would want to divide $a / b$, within Field Groups, this cannot be a division between two whole numbers.

Whenever $a$ needs to be divided by $b$, the multiplicative inverse of $b$ will be found first $b^{-1}$. Then a simple multiplication will be performed $a * b^{-1}$. In other words:

$a / b\ (mod\ p)= a * b^{-1}\ (mod\ p)$

Then, what is the multiplicative inverse of a number?

First of all, all multiplicative inverse operate within a Field Group. Let's randomly take the Field Group $7$, which in other words it implies to use $mod\ 7$ to perform our operations. Also, let's find the multiplicative inverse of $3$.

Within a Field Group $7$, the multiplicative inverse of $3$ is $x$ such that $3*x =1\ (mod\ 7)$. In other words, when a number is multiplied by its multiplicative inverse the result is $1\ mod\ p$.

Let's create a table to find out the value of $x$:

|   $x$   |     $3 * x\ (mod\ 7)$     |
| :-----: | :-----------------------: |
|   $0$   |   $3 * 0 = 0\ (mod\ 7)$   |
|   $1$   |   $3 * 1 = 3\ (mod\ 7)$   |
|   $2$   |   $3 * 2 = 6\ (mod\ 7)$   |
|   $3$   |   $3 * 3 = 2\ (mod\ 7)$   |
|   $4$   |   $3 * 4 = 5\ (mod\ 7)$   |
| **$5$** | **$3 * 5 = 1\ (mod\ 7)$** |

Then $5$ would be the multiplicative inverse of $3$. Now let's see the entire equation:

$10 / 3\ (mod\ 7) = 10 * 3^{-1}\ (mod\ 7) = 10 * 5\ (mod\ 7) = 50\ (mod\ 7) = 1\ (mod\ 7)$

Then, $10 / 3\ (mod\ 7) = 1\ (mod\ 7)$.

## Scalar Multiplication in EC

This is also called "double and add" and makes point addition more efficient. It seems like multiplying by an scalar only that it's done more efficiently than adding points one by one.

Let's say that we would want to find $10P$, meaning the $P$ points has been added to itself ten times. One way of doing it is by adding $P$ 10 times consecutively:

$$
P + P + P + P + P + P + P + P + P + P = 10P
$$

This requires ten operations. Or, we could use the "double and add" technique like this:

$$
\begin{align*}
P + P &= 2P  \\
2P + 2P &= 4P \\
4P + 2P &= 6P \\
6P + 4P &= 10P \\
\end{align*}
$$

We needed less operations than with point addition. It takes no more than $2log_2(n)$ point operations to compute $nP$.

Now let's see the algorithm for "double-and-and" technique. This algorithm has been taken from ["An Introduction To Mathematical Cryptography" by Hoffstein](<https://github.com/isislovecruft/library--/blob/master/cryptography%20%26%20mathematics/An%20Introduction%20to%20Mathematical%20Cryptography%20(2014)%20-%20Hoffstein%2C%20Pipher%2C%20Silverman.pdf>):

Given a point $P$ that belongs to an Elliptic Curve $E$ with $n \ge 1$. And considering that there is a finite Field Group $p$ for that curve, it complies that:

(1) Set $Q = P$ and $R = (0, 0)$
(2) Loop $\text{while\ } n > 0$:

- (3) if $n \equiv 1\ (mod\ 2)$, set $R =R + Q$
- (4) Set $Q = 2Q$ and $n = \lfloor n/2 \rfloor$
- (5) if $n > 0$, continue with loop at Step 2

(6) Return the point $R$, which equals $nP$

## Verifying your Elliptic Curve

Use the following information to verify the algorithm of the Elliptic Curve:

Given the following EC:
$y^2 = x^3 - 3*x + 4\ (mod\ 17)$

Point A = (1, 6)
Point B = (9, 14)

Point Addition:
Point A + Point B = (8, 4)

Scalar Multiplication:
Point A \* 4 = (12, 8)
