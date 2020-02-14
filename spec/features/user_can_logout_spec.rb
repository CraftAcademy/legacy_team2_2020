
feature 'User can logout' do
    
    let(:user) { create(:user) }
    
    before do
        login_as(user, scope: :user)
        visit root_path
    end
        
    it 'expect to successful logout message' do
        click_on 'Logout'
        expect(page).to have_content 'Signed out successfully.'
    end  
end