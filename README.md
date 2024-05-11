# Blockchain Specialization Source Batch 03

#### Division on finite Field Group

Since we are working with finite Field Groups, the division works in a different way. Let's say we would want to divide $a / b$, within Field Groups, this cannot be a division between two whole numbers.

Whenever $a$ needs to be divided by $b$, the multiplicative inverse of $b$ will be found first $b^{-1}$. Then a simple multiplication will be performed $a * b^{-1}$. In other words:

$a / b\ (mod\ p)= a * b^{-1}\ (mod\ p)$

Then, what is the multiplicative inverse of a number?

First of all, all multiplicative inverse operate within a Field Group. Let's randomly take the Field Group $7$, which in other words it implies to use $mod\ 7$ to perform our operations. Also, let's find the multiplicative inverse of $3$.

Within a Field Group $7$, the multiplicative inverse of $3$ is $x$ such that $3*x =1\ (mod\ 7)$. In other words, when a number is multiplied by its multiplicative inverse the result is $1\ mod\ p$.

## References

1. [SHA-3 and The Hash Function Keccak](https://www.cryptotextbook.com/download/Understanding-Cryptography-Keccak.pdf)
2. [SHA-3 Standard: Permutation-based hash and extendable-output functions](https://csrc.nist.gov/files/pubs/fips/202/final/docs/fips_202_draft.pdf)
3. [Lecture 21: SHA-3 Hash function by Christof Paar](https://www.youtube.com/watch?v=JWskjzgiIa4&t=15s)
4. [Pre-image attacks on reduced-round Keccak hash functions by solving algebraic systems](https://www.researchgate.net/publication/367588485_Preimage_attacks_on_reduced-round_Keccak_hash_functions_by_solving_algebraic_systems/download)
5. [Birthday attacks, collisions and password strength](https://auth0.com/blog/birthday-attacks-collisions-and-password-strength/)
6. [What is a collision attack? Threats to digital signature](https://www.comparitech.com/blog/information-security/what-is-a-collision-attack/#Collisions_in_SHA-3)
7. [Elliptic Curve Cryptography Explained](https://fangpenlin.com/posts/2019/10/07/elliptic-curve-cryptography-explained/)
8. [The animated Elliptic Curve](https://curves.xargs.org/)
9. [BIP32](https://github.com/bitcoin/bips/blob/master/bip-0032.mediawiki)
10. [BIP44](https://en.bitcoin.it/wiki/BIP_0044)
11. [SEC 2: Recommended Elliptic Curve Domain Parameters](https://www.secg.org/sec2-v2.pdf)
12. [Elliptic Curve a gentle introduction](https://andrea.corbellini.name/2015/05/17/elliptic-curve-cryptography-a-gentle-introduction/)
13. [A primer on elliptic curve cryptography](https://blog.cloudflare.com/a-relatively-easy-to-understand-primer-on-elliptic-curve-cryptography/)
