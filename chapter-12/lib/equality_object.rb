class EqualityObject 
  def equal_question_mark(obj1, obj2)
    obj1.equal?(obj2)
  end

  def eql_question_mark(obj1, obj2)
    obj1.eql?(obj2)
  end

  def double_equal_signs(obj1, obj2)
    if obj1 == obj2
      return true
    else
      return false
    end
  end

  def triple_equal_signs(obj1, obj2)
    if obj1 === obj2
      return true
    else
      return false
    end
  end
end
