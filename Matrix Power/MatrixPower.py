import numpy as np
import scipy.linalg as spylg


def factorial(n: int) -> int:
    if n == 0:
        return 1
    elif n == 1:
        return n
    else:
        return n * factorial(n - 1)


def MatrixPower(A, B, n=10, method="scipy"):
    """
    Takes a matrix to the power of another matrix

    Parameters
    ----------
    A : np.matrix
    B : np.matrix
    n : int
    method : str

    Returns
    -------
    np.matrix
    """

    if method == "scipy":
        """
        Best method at present, but can be quite slow
        """

        return spylg.expm(np.matmul(B, spylg.logm(A)))

    elif method == "numeric":

        """
        Something is wrong with this method; doesn't work as expected
        """

        SUM = 0

        for i in range(n):

            SUM += pow(-1, i) * np.linalg.matrix_power(np.matmul(B,
                                                                 spylg.logm(A)), i) / factorial(i)

        return SUM
