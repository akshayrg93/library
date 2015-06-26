require "seeds/country_list.rb"
require "seeds/admin_info.rb"

include CountryList
include AdminInfo

add_country_list
add_admin_info