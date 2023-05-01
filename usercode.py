from sklearn.linear_model import LogisticRegression
from sklearn.pipeline import make_pipeline

def handle(data):
    data["hello"] = "Hello world!"
    return data
