import matplotlib.pyplot as plt
import pandas as pd

# Data hasil testing
data = {
    "Algorithm": ["Round Robin", "Least Connections", "IP Hash", "Generic Hash"],
    "Requests per second": [191.96, 178.24, 196.13, 202.54],
    "Time per request (ms)": [5.209, 5.610, 5.099, 4.937],
    "Transfer rate (KB/sec)": [23.06, 21.41, 23.56, 24.33]
}

df = pd.DataFrame(data)

# Grafik Requests per second
plt.figure(figsize=(10, 6))
plt.bar(df["Algorithm"], df["Requests per second"], color=['skyblue', 'salmon', 'limegreen', 'gold'])
plt.xlabel("Algorithm")
plt.ylabel("Requests per second")
plt.title("Performance Analysis : Request Per Second untuk masing masing algoritma")

plt.savefig("/home/bosmuda/Documents/jarkomprak/3/performance_analysis.jpg", format='jpg')

plt.show()
