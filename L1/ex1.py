def compute_transition_function(pattern, alphabet):
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


def finite_automation_matcher(text, pattern, alphabet):
    n = len(text)
    m = len(pattern)
    delta = compute_transition_function(pattern, alphabet)
    q = 0
    for i in range(n):
        q = delta[q][alphabet.index(text[i])]
        if q == m:
            s = i + 1 - m
            print(
                "Pattern occurs: " + text[:s] + '\x1b[4;34;m' + text[s:i + 1] + '\x1b[0m' + text[i + 1:])


if __name__ == '__main__':
    text = input("Text: ")
    while not len(text) > 0:
        text = input("Text: ")
    pattern = input("Pattern: ")
    while not len(pattern) > 0:
        pattern = input("Pattern: ")
    finite_automation_matcher(text, pattern, alphabet="".join(set(text)))
