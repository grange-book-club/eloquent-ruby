class StructuredDocument
  def self.disclaimer
    "This document is public."
  end

  def self.privatize
    private :content

    def self.disclaimer
      "This document is private."
    end
  end
end


class BankStatement < StructuredDocument

  privatize

end


class PublicBankStatement < StructuredDocument

end

private_statement = BankStatement.new
puts private_statement.disclaimer


public_statement = PublicBankStatement.new
puts public_statement.disclaimer
