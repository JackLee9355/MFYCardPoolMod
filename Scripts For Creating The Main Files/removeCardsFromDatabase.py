import sqlite3

cardsToIncludeFile = open('foundIds.txt', "r")
cardsToInclude = []
for everyLine in cardsToIncludeFile.readlines():
    cardsToInclude.append(everyLine.replace('\n', ""))
cardDatabase = sqlite3.connect('cards.cdb')
cursor = cardDatabase.cursor()
cursor.execute('SELECT * FROM datas')
datas = cursor.fetchall()
for row in datas:
    if (cardsToInclude.count(str(row[0])) < 1):
        cursor.execute('DELETE FROM datas where id = ' + str(row[0]))
    else:
        print(row[0])
cardDatabase.commit()
cardDatabase.close()



