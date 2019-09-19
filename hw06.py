
passphrase = 'CC74EB'

def survey(p):
    """
    You do not need to understand this code.
    >>> survey(passphrase)
    '3d2eea56786a3d9e503a4c07dd667867ef3d92bfccd68b2aa0900ead'
    """
    import hashlib
    return hashlib.sha224(p.encode('utf-8')).hexdigest()


# Object Oriented Programming

class Fib():
    """A Fibonacci number.

    >>> start = Fib()
    >>> start
    Fib object, value 0
    >>> start.next()
    Fib object, value 1
    >>> start.next().next()
    Fib object, value 1
    >>> start.next().next().next()
    Fib object, value 2
    >>> start.next().next().next().next()
    Fib object, value 3
    >>> start.next().next().next().next().next()
    Fib object, value 5
    >>> start.next().next().next().next().next().next()
    Fib object, value 8
    >>> start.next().next().next().next().next().next() # Ensure start isn't changed
    Fib object, value 8
    """

    def __init__(self, value=0):
        self.value = value

    def next(self):
        fb = Fib()
        if self.value == 0:
            fb.value = 1
            fb.pre = self.value

        else:
            fb.value = self.value + self.pre
            fb.pre = self.value
        return fb


    def __repr__(self):
        return "Fib object, value " + str(self.value)

class VendingMachine:
    """A vending machine that vends some product for some price.

    >>> v = VendingMachine('candy', 10)
    >>> v.vend()
    'Machine is out of stock.'
    >>> v.deposit(15)
    'Machine is out of stock. Here is your $15.'
    >>> v.restock(2)
    'Current candy stock: 2'
    >>> v.vend()
    'You must deposit $10 more.'
    >>> v.deposit(7)
    'Current balance: $7'
    >>> v.vend()
    'You must deposit $3 more.'
    >>> v.deposit(5)
    'Current balance: $12'
    >>> v.vend()
    'Here is your candy and $2 change.'
    >>> v.deposit(10)
    'Current balance: $10'
    >>> v.vend()
    'Here is your candy.'
    >>> v.deposit(15)
    'Machine is out of stock. Here is your $15.'

    >>> w = VendingMachine('soda', 2)
    >>> w.restock(3)
    'Current soda stock: 3'
    >>> w.restock(3)
    'Current soda stock: 6'
    >>> w.deposit(2)
    'Current balance: $2'
    >>> w.vend()
    'Here is your soda.'
    """
    def __init__(self, product, price):
        self.product = product
        self.price = price
        self.bal = 0
        self.amount = 0

    def restock(self, amount):
        if self.amount == 0:
            self.amount = amount
        else:
            self.amount += amount
        return 'Current '+ self.product +' stock: ' + str(self.amount)

    def vend(self):
        if self.amount == 0:
            return 'Machine is out of stock.'
        elif self.bal < self.price:
            add_val = self.price - self.bal
            return 'You must deposit $' + str(add_val) + ' more.'
        elif self.bal == self.price:
            self.bal -= self.price
            self.amount -= 1
            return 'Here is your ' + self.product + '.'
        elif self.bal > self.price:
            return_amount = self.bal - self.price
            self.bal = 0
            self.amount -= 1
            return 'Here is your ' + self.product + ' and $' + str(return_amount)+ ' change.'
 

    def deposit(self, dollar):
        if self.bal == 0:
            self.bal = dollar
        else:
            self.bal += dollar
        if self.amount == 0:
            return_amount = self.bal
            self.bal = 0
            return 'Machine is out of stock. Here is your $' + str(return_amount) + '.'
        else:
            return 'Current balance: $' + str(self.bal)

