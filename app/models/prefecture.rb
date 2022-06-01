class Prefecture < ActiveHash::Base
  self.data = [
    {id: 1, prefecture: "---"}, {id: 2, prefecture: "北海道"}, {id: 3, prefecture: "青森県"}, {id: 4, prefecture: "岩手県"}, {id: 5, prefecture: "宮城県"},
    {id: 6, prefecture: "秋田県"}, {id: 7, prefecture: "山形県"}, {id: 8, prefecture: "福島県"}, {id: 9, prefecture: "茨城県"}, {id: 10, prefecture: "栃木県"},
    {id: 11, prefecture: "群馬県"}, {id: 12, prefecture: "埼玉県"}, {id: 13,  prefecture: "千葉県"}, {id: 14,  prefecture: "東京都"}, {id: 15,  prefecture: "神奈川県"},
    {id: 16, prefecture: "新潟県"}, {id: 17, prefecture: "富山県"}, {id: 18, prefecture: "石川県"}, {id: 19, prefecture: "福井県"}, {id: 20, prefecture: "山梨県"},
    {id: 21, prefecture: "長野県"}, {id: 22, prefecture: "岐阜県"}, {id: 23, prefecture: "静岡県"}, {id: 24, prefecture: "愛知県"}, {id: 25, prefecture: "三重県"},
    {id: 26, prefecture: "滋賀県"}, {id: 27, prefecture: "京都府"}, {id: 28, prefecture: "大阪府"}, {id: 29, prefecture: "兵庫県"}, {id: 30, prefecture: "奈良県"},
    {id: 31, prefecture: "和歌山県"}, {id: 32, prefecture: "鳥取県"}, {id: 33, prefecture: "島根県"}, {id: 34, prefecture: "岡山県"}, {id: 35, prefecture: "広島県"},
    {id: 36, prefecture: "山口県"}, {id: 37, prefecture: "徳島県"}, {id: 38, prefecture: "香川県"}, {id: 39, prefecture: "愛媛県"}, {id: 40, prefecture: "高知県"},
    {id: 41, prefecture: "福岡県"}, {id: 42, prefecture: "佐賀県"}, {id: 43, prefecture: "長崎県"}, {id: 44, prefecture: "熊本県"}, {id: 45, prefecture: "大分県"},
    {id: 46, prefecture: "宮崎県"}, {id: 47, prefecture: "鹿児島県"}, {id: 48, prefecture: "沖縄県"},
  ]

  include ActiveHash::Associations
  has_many :items
end