feature 'new user signing up' do
    
    
    let(:username){'TestUsername'}
    let(:email){'testemail'}
    let(:password){'testpassword'}

    scenario'a user has signup details'do
    visit '/'
    click_on 'Sign Up'
    fill_in 'username', with: username
    fill_in 'password', with: password
    fill_in 'email', with: email
    click_button 'Sign Up'
    expect(current_path).to eq'/'
    expect(page).to have_content "Welcome, #{username}"
    expect(page).not_to have_link('Sign Up', href: '/users/new')
    expect(page).not_to have_link('Log In', href: '/sessions/new')

    end



end