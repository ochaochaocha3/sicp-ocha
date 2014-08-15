// Exercise 1.32
function accumulate(combiner, nullValue, term, a, next, b) {
    if (a > b) {
        return nullValue;
    }

    return combiner(
        term(a),
        accumulate(combiner, nullValue, term, next(a), next, b)
    );
}

function identity(x) {
    return x;
}

function inc(x) {
    return x + 1;
}

function add(x, y) {
    return x + y;
}

function multiply(x, y) {
    return x * y;
}

function square(x) {
    return x * x;
}

function sum(a, b) {
    return accumulate(add, 0, identity, a, inc, b);
}

function product(a, b) {
    return accumulate(multiply, 1, identity, a, inc, b);
}

// Exercise 1.33
function filteredAccumulate(combiner, nullValue, term, filter, a, next, b) {
    function nextStep() {
        return filteredAccumulate(
            combiner,
            nullValue,
            term,
            filter,
            next(a),
            next,
            b
        );
    }

    if (a > b) {
        return nullValue;
    } else if (filter(a)) {
        return combiner(term(a), nextStep());
    } else {
        return nextStep();
    }
}

function divides(a, b) {
    return b % a === 0;
}

function findDivisor(n, testDivisor) {
    if (square(testDivisor) > n) {
        return n;
    }

    if (divides(testDivisor, n)) {
        return testDivisor;
    }

    return findDivisor(n, testDivisor + 1);
}

function smallestDivisor(n) {
    return findDivisor(n, 2);
}

function isPrime(n) {
    return smallestDivisor(n) === n;
}

function sumOfSquaresOfPrimes(a, b) {
    return filteredAccumulate(
        add,
        0,
        square,
        isPrime,
        a,
        inc,
        b
    );
}

sumOfSquaresOfPrimes(2, 10);
/*
87
*/

function gcd(a, b) {
    if (b === 0) {
        return a;
    }

    return gcd(b, a % b);
}

function productOfRelativelyPrimeNumbers(n) {
    function isRelativelyPrime(i) {
        return gcd(i, n) === 1;
    }

    return filteredAccumulate(
        multiply,
        1,
        identity,
        isRelativelyPrime,
        1,
        inc,
        n - 1
    );
}

productOfRelativelyPrimeNumbers(8);
/*
105
*/