json.type_of_crop @type_of_crops do |artist|
  json.(artist, :name_with_label)
end json.(type_of_crop, :id, :name)