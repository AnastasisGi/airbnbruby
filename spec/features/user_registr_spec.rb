require_relative '../spec_helper.rb'

feature 'new user signing up' do
    
    
    let(:username){'TestUsername'}
    let(:email){'testemail'}
    let(:password){'testpassword'}

    scenario'a user has signup details'do
    visit '/'
    click_on 'Sign Up'
     expect(current_path).to eq '/users/new'
    fill_in 'username', with: username
    fill_in 'password', with: password
        fill_in 'password confirmation', with: password
    fill_in 'email', with: email
    click_button 'Sign Up'
    expect(current_path).to eq'/'
    expect(page).to have_content "Welcome, #{username}"
    expect(page).not_to have_link('Sign Up', href: '/users/new')
    expect(page).not_to have_link('Log In', href: '/sessions/new')

    end

    scenario 'a user with the wrong credentials can not login' do
      
        



    end



end