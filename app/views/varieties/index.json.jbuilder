json.array! @varieties, partial: 'varieties/variety', as: :variety









#json.varieties @varieties do |artist|
#  json.(artist, :id, :descr, :code)
#  json.type_of_crops artist.type_of_crops, partial: 'type_of_crops/type_of_crop', as: :type_of_crop
#end







#json.varieties @varieties do |variety|
#  json.(variety, :id, :code, :descr)
#
#  json.type_of_crops variety.type_of_crops do |tipos|
#    json.(tipos, :id, :code, :name)
#  end
#end
