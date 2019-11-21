class Watched < ApplicationRecord
  belongs_to :user
  enum rate: {ATB: 0, LOVE: 1, LIKE: 2, OK: 3, HATE: 4}
end
