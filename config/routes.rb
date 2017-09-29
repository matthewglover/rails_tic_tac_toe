Rails.application.routes.draw do
  get 'tic_tac_toe/options'

  get 'tic_tac_toe/game'

  root 'tic_tac_toe#options'
end
