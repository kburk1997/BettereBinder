##
#Base user class for the platform.
#
#This user has all default devise modules, including:
#* database_authenticable
#* registerable
#* recoverable
#* rememberable
#* trackable
#* validatable
#
#See Devise documentation for more information on these modules.
#
#=Attributes:
#* id [integer, primary, not null] - primary key
#* created_at [datetime, not null] - creation time
#* current_sign_in_at [datetime] - Devise Trackable module
#* current_sign_in_ip [string] - Devise Trackable module
#* email [string, default="", not null]
#* encrypted_password [string, default="", not null] - Devise encrypted password
#* last_sign_in_at [datetime] - Devise Trackable module
#* last_sign_in_ip [string] - Devise Trackable module
#* remember_created_at [datetime] - Devise Rememberable module
#* reset_password_sent_at [datetime] - Devise Recoverable module
#* reset_password_token [string] - Devise Recoverable module
#* sign_in_count [integer, default=0, not null] - Devise Trackable module
#* updated_at [datetime, not null] - last update time

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  ##
  #Each user has a collection of binders (see Binder).
  has_many :binders

end
