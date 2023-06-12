class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'メンズ' },
    { id: 3, name: 'レディース' },
    { id: 4, name: 'ベビーキッズ' },
    { id: 5, name: 'インテリア・住まい・小物' },
    { id: 6, name: 'IT' },
    { id: 7, name: 'エンタメ' },
    { id: 8, name: 'スポーツ' },
    { id: 9, name: 'グルメ' },
    { id: 10, name: 'その他' },
    { id: 11, name: '楽器'},
    { id: 12, name: '洋服'}
  ]

  include ActiveHash::Associations
  has_many :items

end