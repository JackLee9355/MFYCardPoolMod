import json

file = open("Millennium Format Cardpool - Sheet1(1).txt", "r", encoding="utf8")
foundIds = open("foundIds.txt", "w")
allCardsJson = json.load(open("cardinfo.php.json", "r"))
notFound = []
for everyLine in file.readlines():
    name = everyLine.replace('\n','').replace('\t', '')
    found = False
    for element in allCardsJson:
        if element["name"] == name:
            found = True
            foundIds.write(element["id"] + "\n")
            break
    if found == False:    
        notFound.append(name)
foundIds.close()
print(notFound)