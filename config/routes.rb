Rails.application.routes.draw do
  get 'tic_tac_toe/options'

  get 'tic_tac_toe/game'

  get 'tic_tac_toe/result'

  root 'tic_tac_toe#options'
end
