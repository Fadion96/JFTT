def computeTransitionFunction(pattern, alphabet):
    m = len(pattern)
    delta = [[0 for x in range(len(alphabet))] for y in range(m + 1)]
    for q in range(m + 1):
        for a in alphabet:
            k = min(m, q + 1)
            pattern_q = pattern[:q] + a
            while not pattern_q.endswith(pattern[:k]):
                k -= 1
            delta[q][alphabet.index(a)] = k
    return delta


def finiteAutomationMatcher(text, pattern, alphabet):
    n = len(text)
    m = len(pattern)
    delta = computeTransitionFunction(pattern, alphabet)
    q = 0
    for i in range(n):
        q = delta[q][alphabet.index(text[i])]
        if q == m:
            s = i + 1 - m
            print(
                "Pattern occurs: " + text[:s] + '\x1b[6;34;m' + text[s:i + 1] + '\x1b[0m' + text[i + 1:])


if __name__ == '__main__':
    text = input("Text: ")
    pattern = input("Pattern: ")
    finiteAutomationMatcher(text, pattern, alphabet="".join(set(text)))
