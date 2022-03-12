require_relative '../spec_helper.rb'

describe 'User ' do

    describe '#authenticate' do
          
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

        it 'returns a valid user if the credentials are correct ' do
            expect(User.authenticate(username: username, password: password)).to be_a(User)
            
        end

     it 'returns nil user if the credentials are correct ' do
            expect(User.authenticate(username: username, password: wrong_password)).to be_nil
        end


    end



  
end