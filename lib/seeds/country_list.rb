
module CountryList
  def add_country_list
    country_list = [
      "Germany" ,
      "France",
      "India",
      "Netherlands",
      "USA" ,
      "England" ,
      "Australia" ,
      "Spain" ,
      "Argentina" ,
      "Italy" ,
    ]
    country_list.each do |name|
      Country.create( name: name)
  end  
end

