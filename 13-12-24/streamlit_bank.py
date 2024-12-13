import streamlit as st

class Bank:
    acc_bal = 10000

    def deposit(self, amount):
        if 100 < amount <= 50000 and amount % 100 == 0:
            st.success(f"You can proceed with the deposit of cash ₹{amount}")
            self.acc_bal = self.acc_bal + amount
        else:
            st.error("Please enter a valid deposit amount (Between ₹100 and ₹50,000 in multiples of ₹100).")

        st.text(f"The balance after depositing the amount is: ₹{self.acc_bal}")

    def withdraw(self, amount):
        count = 0
        while self.acc_bal >= 500 and count < 3:
            if 100 < amount <= 20000 and amount % 100 == 0 and amount <= self.acc_bal:
                st.success(f"You can proceed with the withdrawal of cash ₹{amount}")
                self.acc_bal = self.acc_bal - amount
                break
            else:
                st.error("Please enter a valid withdrawal amount.")
            count += 1
        st.text(f"The balance after withdrawal is: ₹{self.acc_bal}")

    def balanceEnquiry(self):
        st.text(f"The current balance is: ₹{self.acc_bal}")

    def viewOptions(self):
        option = st.radio(
            "The options available are:",
            ('Deposit', 'Withdraw', 'Balance enquiry', 'Exit')
        )

        if option == 'Deposit':
            amount = st.number_input("Enter the amount to deposit:", min_value=100, max_value=50000, step=100)
            if st.button("Deposit"):
                self.deposit(amount)
        
        elif option == 'Withdraw':
            amount = st.number_input("Enter the amount to withdraw:", min_value=100, max_value=20000, step=100)
            if st.button("Withdraw"):
                self.withdraw(amount)
        
        elif option == 'Balance enquiry':
            if st.button("Check Balance"):
                self.balanceEnquiry()
        
        elif option == 'Exit':
            st.text("Exiting the system. Thank you for banking with us!")

    def validate(self):
        pin = 2005
        st.title("Welcome to State Bank!")
        pin_no = st.number_input("Enter the pin number:", min_value=1000, max_value=9999, step=1)

        if st.button("Submit PIN"):
            if pin_no == pin:
                st.success("The entered pin number is correct.")
                self.viewOptions()
            else:
                st.error("Incorrect pin. Please try again.")

def main():
    bank_obj = Bank()

    bank_obj.validate()

if __name__ == "__main__":
    main()
