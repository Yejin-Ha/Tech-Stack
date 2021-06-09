'''
개발 권장 구조
1. 모든 멤버 변수(self) 선언 위치 : __init__
'''

import cx_Oracle


class Book:
    def __init__(self, title, author, price):
        self.title = title
        self.author = author
        
        # price가 100보다 작다면 0으로 크다면 입력값으로 바꾸는 기능을 넣는다면
        #   1. setPrice() 메소드를 생성해서 __init__에서 실행시킨다.
        self.setPrice(price)
        
        #   2. __init__안에 if문을 사용하여 값을 선언한다.
        self.price = 0
        if price > 100:
            self.price = price
        # 2번 방법을 사용하는 것을 추천한다.


    def getTitle(self):
        return self.title

    def getAuthor(self):
        return self.author

    def getPrice(self):
        return self.price

    def setPrice(self, new_price):
        if new_price > 100:
            self.price = new_price
        else:
            self.price = 0


def book_insert(book):
    conn = cx_Oracle.connect(user='SCOTT', pw='TIGER', dsn='xe')
    cur = conn.cursor()

    cur.execute("insert into book values (seq_book_no.nextval, :title, :author, :price)", \
        title = book.getTitle(), author = book.getAuthor(), price = book.getPrice())
    conn.commit()

    cur.close()
    conn.close()


def book_update(book):
    conn = cx_Oracle.connect(user='SCOTT', pw='TIGER', dsn='xe')
    cur = conn.cursor()

    cur.execute("update bokk set author = :author, price = :price where title = :title", \
        title = book.getTitle(), author = book.getAuthor(), price = book.getPrice())
    conn.commit()

    cur.close()
    conn.close()
    




if __name__ == '__main__':
    b1 = Book('python', '로드반썸', 10000)
    book_insert(b)
    book_update(Book('python', '유재석', 7000))
