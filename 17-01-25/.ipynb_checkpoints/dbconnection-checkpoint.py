import mysql.connector as c


mydb = c.connect(
    host="localhost",        
    user="root",             
    password="1234", 
    database="tina"        
)

mycursor = mydb.cursor()
mycursor.execute("create table person(pid int,pname varchar(20))")
mycursor.execute("insert into  student values(102,sisira,belair)")
mydb.commit()
mycursor.execute("delete from student where id = 102")
name=input("Enter your name:")
id=input("Enter your age:")
city=input("Enter your city:")
mycursor.execute("insert into student values(%s,%s,%s)",(id,name,city))
mydb.commit()
mycursor.execute("select * from student")
students=mycursor.fetchall();
for std in students:
    print(std)