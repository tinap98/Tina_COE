def calculate_percentage(salary, bill1, bill2, bill3):
    total_bills = bill1 + bill2 + bill3
    percentage_spent = (total_bills / salary) * 100
    return percentage_spent

#billing inputs
salary = float(input("Enter your salary: "))
bill1 = float(input("Enter your bill amount: "))
bill2 = float(input("Enter your bill amount: "))
bill3 = float(input("Enter your bill amount: "))

percentage_spent = calculate_percentage(salary, bill1, bill2, bill3)
print(f"You have spent {percentage_spent:.2f}% of your salary.")
