class CashRegister
    attr_reader :discount
    attr_accessor :total

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @transactions = []
    end

    def add_item(title, price, quantity = 1)
        @total = @total + price * quantity 
        transaction = {
            title: title,
            price: price,
            quantity: quantity
        }
            @transactions << transaction
    end

    def apply_discount
        if @discount == 0
            "There is no discount to apply."
        else
            @total = @total - (@total * discount / 100)
            "After the discount, the total comes to $#{@total}."
        end
    end

    def items
        puts @transactions
        all_items = []
        @transactions.each do |transaction|
            transaction[:quantity].times {
                all_items << transaction[:title] 
            }
        end
        all_items
    end

    def void_last_transaction
        @transactions.pop
        @total = 0
        @transactions.each do |transaction|
            @total = @total + transaction[:price] * transaction[:quantity] 
        end
    end
end