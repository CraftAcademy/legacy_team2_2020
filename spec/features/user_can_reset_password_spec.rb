# frozen_string_literal: true

feature 'User can reset password' do
    before do
      visit new_user_password_path
    end
  
    describe 'happy path' do
      let(:registered_user) { create(:user) }
  
          it 'expect user to able to reset password' do
                fill_in 'Email', with: registered_user.email
                click_on 'Send me reset password instructions'
                expect(page).to have_content 'You will receive an email with instructions on how to reset your password in a few minutes.'
          end
    end
  
    describe 'sad path' do
      let(:registered_user) { create(:user) }
  
          it 'expect user not to able to reset password with non-existing email' do
              fill_in 'Email', with: "wrong@email.com"
              click_on 'Send me reset password instructions'
              expect(page).to have_content 'Email not found'
          end
      end    
  end
  
  
  
  