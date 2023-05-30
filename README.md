# README

usersテーブル
           
Column              | Type         | Options                |
--------------------|--------------|------------------------|
nickname            | string       | null:false,unique:true |
email               | string       | null:false,unique:true |
password            | string       | null:false,unique:true |
last_name           | string       | null:false             |
first_name          | string       | null:false             |
last_name_kana      | string       | null:false             |
first_name_kana     | string       | null:false             |
birthday            | string       | null:false             |

Association
・has_many:items
・has_many:buys
・has_many:comments


itemsテーブル

Column              | Type         | Options                     |
--------------------|--------------|-----------------------------|
user                | references   | null:false,foreign_key:true | 
name                | string       | null:false                  | 
description         | text         | null:false                  |  
category_id         | integer      | null:false                  | 
items_status_id     | integer      | null:false                  | 
shipping_costs_id   | integer      | null:false                  |  
shipping_date_id    | integer      | null:false                  |  
delivery_area_id    | integer      | null:false                  |  
price               | integer      | null:false                  |  

Association
・belongs_to:user
・has_one:buy
・has_many:comments


buysテーブル

Column              | Type         | Options                     |
--------------------|--------------|-----------------------------|
user                | references   | null:false,foreign_key:true |
item                | references   | null:false,foreign_key:true |

Association
・belongs_to:user
・belongs_to:item
・has_one:shipping_address


shipping_addressesテーブル

Column              | Type         | Options                     |
--------------------|--------------|-----------------------------|
buy                 | references   | null:false,foreign_key:true |
postcode            | string       | null:false                  | 
prefecture_id       | integer      | null:false                  | 
city                | string       | null:false                  |
block               | string       | null:false                  |
building            | string       |                             |
phone_number        | string       | null:false                  |

Association
・belongs_to :buy


commentsテーブル

Column              | Type         | Options                     |
--------------------|--------------|-----------------------------|
user                | references   | null:false,foreign_key:true | 
item                | references   | null:false,foreign_key:true | 
text                | text         | null:false                  |             

Association
・belongs_to :user
・belongs_to :items

