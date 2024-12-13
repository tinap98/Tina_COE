class Bank:
    acc_bal = 10000

    def deposit(self):
        amount = int(input("Enter the amount to deposit: "))
        if 100 < amount <= 50000 and amount % 100 == 0:
            print(f"You can proceed with the deposit of cash {amount}")
            self.acc_bal += amount
        else:
            print("Please enter a valid deposit amount.")

        print(f"The balance after depositing the amount is: {self.acc_bal}")

    def withdraw(self):
        count = 0
        while self.acc_bal >= 500 and count < 3:
            amount = int(input("Enter the amount to be withdrawn: "))
            if 100 < amount <= 20000 and amount % 100 == 0 and amount <= self.acc_bal:
                print(f"You can proceed with the withdrawal of cash - {amount}")
                self.acc_bal -= amount
                break
            else:
                print("Please enter a valid withdrawal amount.")
            count += 1

        print(f"The balance after withdrawal is: {self.acc_bal}")

    def balanceEnquiry(self):
        print(f"The current balance is: {self.acc_bal}")

    def viewOptions(self):
        while True:
            print("\nThe options available are: ")
            print("1. Deposit")
            print("2. Withdraw")
            print("3. Balance enquiry")
            print("4. Exit")
            option = int(input("Choose any of the options: "))

            if option == 1:
                self.deposit()
            elif option == 2:
                self.withdraw()
            elif option == 3:
                self.balanceEnquiry()
            elif option == 4:
                print("Exiting the system. Thank you for banking with us!")
                break
            else:
                print("Invalid option. Please try again.")

    def validate(self):
        pin = 2005
        print("Welcome to State Bank!")

        attempts = 0
        while attempts < 3:
            pin_no = int(input("Enter the pin number: "))
            if pin == pin_no:
                print("The entered pin number is correct.")
                self.viewOptions()
                break
            else:
                print("Incorrect pin. Please try again.")
                attempts += 1

        if attempts == 3:
            print("Too many incorrect attempts. Exiting the system.")
            exit(0)


obj = Bank()
obj.validate()
