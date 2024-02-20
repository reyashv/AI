from collections import deque

def is_valid(state):
    m1, c1, b1, m2, c2, b2 = state
    if m1 < 0 or c1 < 0 or m2 < 0 or c2 < 0:
        return False
    if (m1 != 0 and m1 < c1) or (m2 != 0 and m2 < c2):
        return False
    return True

def get_next_states(state):
    m1, c1, b1, m2, c2, b2 = state
    next_states = []
    if b1 == 0:
        for i in range(3):
            for j in range(3):
                if 0 < i + j <= 2:
                    next_state = (m1 - i, c1 - j, 1, m2 + i, c2 + j, 0)
                    if is_valid(next_state):
                        next_states.append(next_state)
    else:
        for i in range(3):
            for j in range(3):
                if 0 < i + j <= 2:
                    next_state = (m1 + i, c1 + j, 0, m2 - i, c2 - j, 1)
                    if is_valid(next_state):
                        next_states.append(next_state)
    return next_states

def bfs():
    initial_state = (3, 3, 0, 0, 0, 1)
    visited = set()
    queue = deque([initial_state])

    while queue:
        current_state = queue.popleft()
        if current_state[0:3] == (0, 0, 0):
            return current_state

        visited.add(current_state)
        for next_state in get_next_states(current_state):
            if next_state not in visited:
                queue.append(next_state)

solution = bfs()
print("Solution found:")
print("Missionaries and Cannibals:", solution)
