require "rails_helper"

feature 'User can create a new message' do
    let(:user) { FactoryBot.create(:user, email:'user1_email@gmail.com', password:'password1' )}
    before do 
        visit root_path 
        click_on 'Login'
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_on 'Log in'
        click_on 'Inbox'
        click_on 'Compose'
    end 

    describe 'user can view the compose new message fields' do 

        it 'link to new conversation' do
        expect(current_path).to eq new_conversation_path
        end

        it 'displays recipients field' do
        expect(page).to have_content 'Recipients'
        end

        it 'displays subject field' do
        expect(page).to have_content 'Subject'
        end

        it 'displays message field' do
        expect(page).to have_content 'Message'
        end

    end 
end