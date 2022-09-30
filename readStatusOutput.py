from bs4 import BeautifulSoup

with open('./Results/myfile_output.xml', 'r') as f:
    data = f.read()
Bs = BeautifulSoup(data, "xml")
item = Bs.statistics.total

numberFail = int(item.stat['fail'])
print(numberFail)

if numberFail > 0:
    print("Fail")
else:
    print("Success")