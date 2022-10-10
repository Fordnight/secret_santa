# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Test the List Model', type: :model do
  let(:raffle_list) do
      # Create 5 users
      # Create list with the users created
      # Get list from database
      # raffle_list = Run run_raffle method
      []
  end


  it 'Every user got secret friend assigned' do
    assigned_players = raffle_list.select{|player| !player.nil? }

    expect(raffle_list.lenght).to eq(assigned_players.lenght)
  end

  it 'No repeated users' do
    assigned_players = raffle_list.collect(&:secret_friend_id).uniq

    expect(raffle_list.lenght).to eq(assigned_players.lenght)
  end

  it 'None users was assigned to itself' do
    assigned_iteslf = false

    raffle_list.each do |player|
      assigned_iteslf = true if player.player_id == player.secrect_friend_id
    end

    expect(assigned_iteslf).to eq(false)
  end
end
