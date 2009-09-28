class UserSettingsController < ApplicationController
  
  def index
    @user = User.find( current_user.id )
    @user_profile = @user.user_profile
    @user_wireless_profile = UserWirelessProfile.new
  end
  
  def update_user
    @user = current_user
    if @user.update_attributes(params[:user])
      render :update do | page |
        page.replace_html "user_form", :partial => "account_settings"
        page.replace_html "notice", "Account settings updated."
        page.visual_effect :toggle_blind, 'notice'
        page.delay 3 do
          page.visual_effect :toggle_blind, 'notice'
        end
      end
    else
      render :update do | page |
        page.replace_html "user_form", :partial => "account_settings"
      end
    end
  end

  def update_user_profile
    user = current_user
    @user_profile = user.user_profile
    if @user_profile.update_attributes(params[:user_profile])
      render :update do | page |
        page.replace_html "user_profile_form", :partial => "profile"
        page.replace_html "notice", "Profile updated."
        page.visual_effect :toggle_blind, 'notice'
        page.delay 3 do
          page.visual_effect :toggle_blind, 'notice'
        end
      end
    else
      render :update do | page |
        page.replace_html "user_profile_form", :partial => "profile"
      end
    end
  end
  
  def add_phone
    user = current_user
    @user_wireless_profile = UserWirelessProfile.new( params[ :user_wireless_profile ] )
    @user_wireless_profile.user = user
    if @user_wireless_profile.save
      render :update do | page |
        page.insert_html :bottom, 'phone_list', :partial => "phone", :locals => { :phone => @user_wireless_profile }
        page.replace_html "user_wireless_profile_form", :partial => "user_wireless_profile"
        page.replace_html "notice", "Phone added."
        page.visual_effect :toggle_blind, 'notice'
        page.delay 3 do
          page.visual_effect :toggle_blind, 'notice'
        end
      end
    else
      render :update do | page |
        page.replace_html "user_wireless_profile_form", :partial => "user_wireless_profile"
      end
    end    
  end
  
  def remove_phone
    @user_wireless_profile = UserWirelessProfile.find( params[ :phone_id ] )
    @user_wireless_profile.destroy
    user = current_user
    render :update do | page |
      page.replace_html "phone_list", :partial => "phone", :collection => user.user_wireless_profiles
    end
  end

end
