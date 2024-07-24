from prometheus_client import start_http_server, Gauge
import os
import time


file_size_gauge = Gauge('file_size_bytes', 'Tamanho do arquivom em HTML')

def collect_metrics():
    file_path = 'index.html'
    if os.path.exists(file_path):
        file_size = os.path.getsize(file_path)
        file_size_gauge.set(file_size)
    else:
        file_size_gauge.set(0)
    
if __name__ == '__main__':
    start_http_server(8000)
    while True:
        collect_metrics()
        time.sleep(10)