import matplotlib.pyplot as plt
import pandas as pd

# Data untuk Load Balancer yang sudah ada
data = {
    "Algorithm": ["Round Robin", "Least Connections", "IP Hash", "Generic Hash"],
    "Requests per second": [191.96, 178.24, 196.13, 202.54],
    "Time per request (ms)": [5.209, 5.610, 5.099, 4.937],
    "Transfer rate (KB/sec)": [23.06, 21.41, 23.56, 24.33]
}

# Data untuk Least-Connection
data_least_conn = {
    "Configuration": ["3 Workers", "2 Workers", "1 Worker"],
    "Requests per second": [81.30, 51.96, 82.51],
    "Time per request (ms)": [12.300, 19.246, 12.120]
}

df = pd.DataFrame(data)
df_least_conn = pd.DataFrame(data_least_conn)

# Grafik Requests per second
plt.figure(figsize=(10, 6))
plt.bar(df["Algorithm"], df["Requests per second"], color=['skyblue'], label="Load Balancer Algorithms")
plt.bar(df_least_conn["Configuration"], df_least_conn["Requests per second"], color='orange', label="Least Connection")
plt.xlabel("Configuration")
plt.ylabel("Requests per second")
plt.title("Comparison of Requests per Second by Load Balancing Algorithm and Worker Configuration")
plt.legend()
plt.show()

plt.savefig("/home/bosmuda/Documents/jarkomprak/3/lc-workers.png", format='png')