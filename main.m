normal = load('D:\ML\physionet.org\physiobank\database\training2017-\A00001.mat');
af = load('D:\ML\physionet.org\physiobank\database\training2017-\A00004.mat');
otro = load('D:\ML\physionet.org\physiobank\database\training2017-\A00077.mat');
ruido = load('D:\ML\physionet.org\physiobank\database\training2017-\A01246.mat');

ploteartarea(normal.val,af.val,otro.val,ruido.val,300,20)
