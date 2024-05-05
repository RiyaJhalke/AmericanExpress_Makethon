let expenseCounter = 0;

function addExpenseInput() {
    const container = document.getElementById('expenseInputs');
    const inputHtml = `<div id="expense-${expenseCounter}">
        <input type="text" placeholder="Expense name">
        <input type="number" placeholder="Amount">
        <button onclick="removeExpense('expense-${expenseCounter}')">Remove</button>
    </div>`;
    container.innerHTML += inputHtml;
    expenseCounter++;
}

function removeExpense(expenseId) {
    const expenseElement = document.getElementById(expenseId);
    expenseElement.remove();
}

function calculateBudget() {
    const income = parseFloat(document.getElementById('income').value);
    const expenses = document.querySelectorAll('#expenseInputs div');
    let totalExpenses = 0;

    expenses.forEach(expense => {
        const amountInput = expense.querySelectorAll('input')[1];
        const amount = parseFloat(amountInput.value);
        if (!isNaN(amount)) {
            totalExpenses += amount;
        }
    });

    const remainingBalance = income - totalExpenses;
    document.getElementById('totalExpenses').textContent = totalExpenses.toFixed(2);
    document.getElementById('remainingBalance').textContent = remainingBalance.toFixed(2);
}

