class UsersController < ApplicationController

  def downgrade 
    current_user.update_attribute(:role, 'standard')

      current_user.wikis.each do |wiki|
      wiki.update_attribute(:private, false)
    end

    redirect_to edit_user_registration_path
  end


end
