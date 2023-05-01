import numpy as np
from sklearn.preprocessing import SplineTransformer


def handle(data):
    X = np.arange(5).reshape(5, 1)
    spline = SplineTransformer(degree=2, n_knots=3)
    data["result"] = spline.fit_transform(X)
    data["hello"] = "Hello world!"
    return data
