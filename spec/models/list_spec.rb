# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Test the List Model', type: :model do
  let(:raffle_list) do
    players = 5.times.map{ |n| create(:player) }

    temp_list = create(:list)
    temp_list.players << players
    temp_list.run_raffle
    temp_list.player_lists
  end


  it 'Every user got secret friend assigned' do
    assigned_players = raffle_list.select{|player| !player.secret_friend.nil? }

    expect(raffle_list.length).to eq(assigned_players.length)
  end

  it 'No repeated users' do
    assigned_players = raffle_list.collect(&:secret_friend_id).uniq

    expect(raffle_list.length).to eq(assigned_players.length)
  end

  it 'None users was assigned to itself' do
    assigned_iteslf = false

    raffle_list.each do |player|
      assigned_iteslf = true if player.player_id == player.secret_friend_id
    end

    expect(assigned_iteslf).to eq(false)
  end
end
