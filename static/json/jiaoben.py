# import pymysql
# db = pymysql.connect('localhost','123456','root','babaifang')
# cursor = db.cursor()
import json

with open('indexDrb.json','r',encoding='utf-8') as fp:
    a = fp.read()
    fp.close()
    a = json.loads(a)
    # print(a)
with open('jiaoben.txt','w',encoding='utf-8') as fp:
    for i in a:
        str1 = "insert into babaifang_drb(mane,tits,price1,price2,img,trackid) values('%s','%s','%s','%s','%s','%s');\n"%(i['mane'],i['tits'],i['price1'],i['price2'],i['img'],i['Id'])
        fp.write(str1)
    fp.close()


# db.close()
