from pathlib import Path
import gymnasium as gym

gym.register(
    id="PendulumQuanser-v0",
    entry_point="goalagent.envs.pendulum:PendulumQuanserEnv",
    max_episode_steps=1000,
)

repo_root = Path(__file__).parent.parent
