class Watched < ApplicationRecord
  belongs_to :user
  enum rate: {AllTimeBest: 0, LOVE: 1, LIKE: 2, OK: 3, DISLIKE: 4}
end
