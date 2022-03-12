require_relative '../spec_helper.rb'

feature 'An existing user can log in ' do
    
    
    let(:username){'TestUsername'}
    let(:wrong_username){'WrongUsername'}
    
    let(:email){'testemail'}
    let(:wrong_email){'wrongemail'}
    
    let(:password){'testpassword'}
    let(:wrong_password){'wrongpassword'}
    let(:user) {User.new(username: username, password: password)}
     before do
    user.password = password
    user.save!
    end

    scenario 'a user has valid credentials and can log in' do 

        visit '/'
        click_on 'Log In'
        expect(current_path).to eq '/sessions/new'
        fill_in 'username', with: username
        fill_in 'password', with: password
        fill_in 'email', with: email
        click_button 'Log In'
        expect(current_path).to eq '/'
        expect(page).to have_content "Welcome, #{user.username}"
        expect(page).not_to have_link('Sign Up', href: '/users/new')
        expect(page).not_to have_link('Log In', href: '/sessions/new')

    end


    scenario 'A user has no valid credentials and can not login' do 
        visit '/'
        click_on 'Log In'
        expect(current_path).to eq '/sessions/new'
        fill_in 'username', with: wrong_username
        fill_in 'password', with: wrong_password
        fill_in 'email', with: wrong_email
        click_button 'Log In'
        expect(current_path).to eq '/sessions/new'
        expect(page).to have_content "Log in failed, please check your credentials"





    end



end

