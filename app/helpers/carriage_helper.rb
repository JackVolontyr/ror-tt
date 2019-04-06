module CarriageHelper
  def to_hash(string)
    string.remove! '{'
    string.remove! '}'
    array = string.split(',')
    hash = {}

    array.each do |e|
      key_value = e.split('=>')
      hash[key_value[0]] = key_value[1]
    end

    hash
  end
end