feature 'move message to trash' do

    let(:receiver) { create(:user, email: 'receiver@example.com')}
    let(:sender) { create(:user, email: 'sender@example.com')}
    
    before do
        visit root_path
        login_as(sender, scope: :user)
        sender.send_message(receiver, 'Tjena vad gör du ikväll?', 'Alla hjärtans dag')
        logout
        login_as(receiver, scope: :user)
        visit root_path
        click_on 'Inbox'
        click_on 'View'
        click_on 'Move to trash'
    end    

    it 'expects message to be moved to trash' do
        count = receiver.mailbox.trash.count
        expect(count).to eq 1
    end

    it 'expects message to be read in trash folder' do
        visit mailbox_trash_path
        expect(page).to have_text 'Alla hjärtans dag'
    end    
end