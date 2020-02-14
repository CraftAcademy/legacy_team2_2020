feature "user can receive message" do
  
    let(:receiver) { FactoryBot.create(:user, email: 'receiver@example.com')}
    let(:sender) { FactoryBot.create(:user, email: 'sender@example.com') }
  
    before do 
      login_as(sender, scope: :user)
      visit mailbox_inbox_path
      sender.send_message(receiver, 'Today we will have pizza for dinner', 'Friday Dinner' )
      logout
      login_as(receiver, scope: :user)
      visit mailbox_inbox_path
      click_link 'Inbox'
    end
  
    it 'expects user to receive message text' do
      expect(page).to have_text 'pizza for dinner'
    end
  end