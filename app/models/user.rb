##
#Base user class for the platform.
#
#This user has all default devise modules, including:
# *database_authenticable
# *registerable
# *recoverable
# *rememberable
# *trackable
# *validatable
#
#See Devise documentation for more information on these modules.
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  ##
  #Each user has a collection of binders (see Binder).
  has_many :binders

end
