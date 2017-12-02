# app/views/type_of_crop/index.json.jbuilder
#json.extract! type_of_crop, :id, :code, :name, :variety_id, :created_at, :updated_at
#json.url type_of_crop_url(type_of_crop, format: :json)


#json.id type_of_crop.id
#json.code type_of_crop.code
#json.name type_of_crop.name

#json.variety type_of_crop.varieties, partial: 'varieties/variety', as: :variety


json.array! @type_of_crops do |comment|
  #next if comment.marked_as_spam_by?(current_user)

  json.id comment.id
  json.code comment.code
  json.name comment.name
  json.variety do
    json.code comment.variety.code
    json.descr comment.variety.descr
  end
end
