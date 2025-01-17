import mysql.connector as c

mydb = c.connect(
    host="localhost",
    user="root",
    password="1234",
    database="tina_dbconnect"
)

mycursor = mydb.cursor()

mycursor.execute("CREATE TABLE IF NOT EXISTS customer(cid INT PRIMARY KEY, cname VARCHAR(20), cage INT, ccity VARCHAR(30))")

num_records = int(input("How many customer records would you like to enter? "))

for _ in range(num_records):
    cid = input("Enter the id of the customer: ")
    cname = input("Enter the name of the customer: ")
    cage = input("Enter the age of the customer: ")
    ccity = input("Enter the city of the customer: ")

    mycursor.execute("INSERT INTO customer (cid, cname, cage, ccity) VALUES (%s, %s, %s, %s)", (cid, cname, cage, ccity))
    mydb.commit()

deleteid = input("Enter the record's id to be deleted: ")
print(f"Deleting customer record with id: {deleteid}")
mycursor.execute("DELETE FROM customer WHERE cid = %s", (deleteid,))
mydb.commit()

updateid = input("Enter the customer id to update: ")
new_cname = input("Enter the new name of the customer: ")
new_cage = input("Enter the new age of the customer: ")
new_ccity = input("Enter the new city of the customer: ")
print(f"Updating customer record with id: {updateid}")
mycursor.execute("UPDATE customer SET cname = %s, cage = %s, ccity = %s WHERE cid = %s", 
                 (new_cname, new_cage, new_ccity, updateid))
mydb.commit()

print("\nFetching all customer records:")
mycursor.execute("SELECT * FROM customer")
customers = mycursor.fetchall()
for x in customers:
    print(x)

print("\nFetching customer records sorted by name:")
mycursor.execute("SELECT * FROM customer ORDER BY cname")
sorted_customers = mycursor.fetchall()
for x in sorted_customers:
    print(x)

print("\nFetching customer records with age between 20 and 30:")
mycursor.execute("SELECT * FROM customer WHERE cage BETWEEN 20 AND 30")
age_filtered_customers = mycursor.fetchall()
for x in age_filtered_customers:
    print(x)

print("\nFetching customer records from the city 'hyd':")
mycursor.execute("SELECT * FROM customer WHERE ccity = 'hyd'")
city_filtered_customers = mycursor.fetchall()
for x in city_filtered_customers:
    print(x)

mycursor.close()
mydb.close()
