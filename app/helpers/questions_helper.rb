module QuestionsHelper
  def declension(number, enot, enota, enotov)
    remainder = number % 10

    return enotov if (number % 100).between?(11, 14)

    if (remainder == 1) # 1 енот
      return enot
    end

    if (remainder >= 2 && remainder <= 4) # 2-4 енота
      return enota
    end

    if (remainder >= 4 && remainder <= 9 || remainder == 0) # 5-9 енотов
      return enotov
    end
  end
end