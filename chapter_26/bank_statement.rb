class StructuredDocument
  def self.disclaimer
    "This document is public."
  end

  def self.privatize
    private :balance

    def self.disclaimer
      "This document is private."
    end
  end

  def balance
    1000000
  end
end


class BankStatement < StructuredDocument
  privatize
end


class PublicBankStatement < StructuredDocument
end

puts "=== Working with a PublicBankStatement ==="

public_statement = PublicBankStatement.new
puts PublicBankStatement.disclaimer
puts public_statement.balance

puts "=== Working with a PrivateBankStatement ==="

private_statement = BankStatement.new
puts BankStatement.disclaimer
puts private_statement.balance

