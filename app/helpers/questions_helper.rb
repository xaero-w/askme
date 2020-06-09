module QuestionsHelper
  def declension(number, enot, enota, enotov)
    remainder = number % 10

    return enotov if (number % 100).between?(11, 14)

    return enot if remainder == 1

    return enota if (2..4).include?(remainder)

    return enotov if (4..9)include?(remainder) || remainder == 0
  end
end