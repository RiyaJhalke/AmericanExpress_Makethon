import random

def print_status(week, balance, income, savings):
    print(f"\n--- Week {week} ---")
    print(f"Balance: ${balance:.2f}")
    print(f"Monthly Income: ${income:.2f}")
    print(f"Total Savings: ${savings:.2f}")

def get_user_choice():
    print("\nChoose an action:")
    print("1. Set aside money for savings")
    print("2. Continue to expenses")
    choice = input("Enter your choice (1 or 2): ")
    return choice

def manage_savings(balance):
    amount = float(input("How much would you like to save this week? $"))
    if amount <= balance:
        return amount
    else:
        print("You cannot save more than your current balance.")
        return 0

def handle_expenses(balance):
    expense = random.randint(200, 500)  # Random weekly expense
    print(f"This week's expenses: ${expense:.2f}")
    if expense <= balance:
        balance -= expense
        print(f"Expenses paid. Remaining balance: ${balance:.2f}")
    else:
        print("You do not have enough money to cover this week's expenses.")
        balance -= expense  # Negative balance indicates debt
    return balance

def main():
    balance = 1000  # Starting balance
    income = 1500  # Monthly income
    savings = 0
    
    # Simulate 4 weeks
    for week in range(1, 5):
        balance += income / 4  # Weekly portion of income
        print_status(week, balance, income, savings)
        
        choice = get_user_choice()
        if choice == '1':
            saved_amount = manage_savings(balance)
            savings += saved_amount
            balance -= saved_amount
        
        balance = handle_expenses(balance)
    
    # End of month summary
    print("\n--- End of Month Summary ---")
    print(f"Final Balance: ${balance:.2f}")
    print(f"Total Savings: ${savings:.2f}")
    if balance >= 0:
        print("Congratulations! You managed your budget well.")
    else:
        print("Unfortunately, you ended up in debt. Better luck next time!")

if __name__ == "__main__":
    main()
