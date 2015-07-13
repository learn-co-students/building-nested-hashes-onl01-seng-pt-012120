def third_challenge
  # epic_tragedy = {
  #  :montague => {
  #     :patriarch => {
  #       #your key/value pairs here
  #       },
  #     :matriarch => {
  #       #your key/value pairs here
  #       },
  #     :hero => {
  #       #your key/value pairs here
  #       },
  #     :hero_friends => []
  #  }, 
  #  :capulet => {
  #     :patriarch => {
  #       #your key/value pairs here
  #       },
  #     :matriarch => {
  #       #your key/value pairs here
  #       },
  #     :heroine => {
  #       #your key/value pairs here
  #       },
  #     :heroine_friends => []
  #  }
  # }

  epic_tragedy = {
   :montague => {
      :patriarch => {name: "Lord Montague", age: "53"},
      :matriarch => {name: "Lady Montague", age: "54"},
      :hero => {name: "Romeo", age: "15", status: "alive"},
      :hero_friends => []
   }, 
   :capulet => {
      :patriarch => {name: "Lord Capulet", age: "50"},
      :matriarch => {name: "Lady Capulet", age: "51"},
      :heroine => {name: "Juliette", age: "15", status: "alive"},
      :heroine_friends => []
   }
}
end