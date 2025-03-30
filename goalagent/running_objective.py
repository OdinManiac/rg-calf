import numpy as np


def angle_normalize(x):
    return ((x + np.pi) % (2 * np.pi)) - np.pi


class GymPendulumRunningObjective:

    def __call__(self, state, action):
        return (
            angle_normalize(state[0]) ** 2
            + 0.1 * state[1] ** 2
            + 0.001 * action[0] ** 2
        )
