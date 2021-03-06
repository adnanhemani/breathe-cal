require 'rails_helper'

RSpec.describe User, type: :model do
    
    describe 'when working with a valid user' do
        before :each do 
            @valid_user = User.new(uid: 101, name: 'Joseph Brodsky', provider: 'google_oauth2', oauth_token: 'some_token', oauth_expires_at: Time.now + 10.day, email: 'jamesbond@gmail.com')
        end
        
        it 'has a provider' do
            expect(@valid_user.provider).to eq 'google_oauth2'
        end
        
        it 'has an authentication token' do
            expect(@valid_user.oauth_token).to eq 'some_token'
        end
        
        it 'passes the validity check' do
            expect(@valid_user.save).to be_truthy
        end
    end
    
    describe 'when working with a valid user' do
        before :each do 
            @invalid_user = User.new(name: 'Ivan Drago', email: 'beatrocky@gmail.com')
        end
        
        it 'does not have a provider' do
            expect(@invalid_user.provider).to be_nil
        end
        
        it 'does not have an authentication token' do
            expect(@invalid_user.oauth_token).to be_nil
        end
        
        it 'does not have an authentication expiration date' do
            expect(@invalid_user.oauth_expires_at).to be_nil
        end
        
        it 'does not pass the validity check' do
            expect(@invalid_user.save).to be_falsey
        end
    end
    
    describe '#find_or_create_from_auth_hash' do
        describe 'when proper credentials are passed to the method' do
            before :each do
                @proper_user_credentials = {uid: 101, provider:'google_oauth2', credentials: {token: 'some token', expires_at: Time.now + 10.day}, info: {name: 'James Bond', email: 'jamesbond@gmail.com'}}
            end
            
            it 'calling the method creates a user' do
                user = User.find_or_create_from_auth_hash(@proper_user_credentials)
                expect(user).to be_an_instance_of User
            end
            
            describe 'after the method has been called' do
                before :each do
                    @user = User.find_or_create_from_auth_hash(@proper_user_credentials)
                end
                
                it 'has a provider' do
                    expect(@user.provider).to eq 'google_oauth2'
                end
                
                it 'has an authentication token' do
                    expect(@user.oauth_token).to eq 'some token'
                end
                
                it 'passes the validity check' do
                    expect(@user.save).to be_truthy
                end
            end
        end 
        
        describe 'when unproper user credentials are passed to the method' do
            before :each do
                @unproper_user_credentials = {name: "Ivan Drago", email: 'ibeatrocky@gmail.com'}
            end
            
            it 'calling the method with unproper user credentials raises an error' do
                expect(lambda { User.from_omniauth(@unproper_user_credentials) }).to raise_error(NameError)
            end
        end
    end 
    
    describe 'saving recent_searches' do
        before :each do
            @valid_user = User.new(uid: 101, name: 'Joseph Brodsky', provider: 'google_oauth2', oauth_token: 'some_token', oauth_expires_at: Time.now + 10.day, email: 'jamesbond@gmail.com')
        end
        
    end
    
    
end