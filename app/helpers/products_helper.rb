module ProductsHelper

  def units
    {
      '1': '個',
      '2': '本',
      '3': '枚',
      '4': 'g',
      '5': 'ml',
      '6': 'mg',
      '7': 'L',
      '8': 'kg',
      '9': '錠',
    }
  end

  def unit(key)
    return unless key
    units[key.to_s.to_sym]
  end

end
