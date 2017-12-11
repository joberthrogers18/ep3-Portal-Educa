class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'

acts_as_messageable
def mailboxer_email(object)
  email
end
  attr_accessor :login
     def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:username) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
    end
    validates :username, :presence => true, :uniqueness => {:case_sensitive => false}

    validate :validate_username

    def validate_username
        if User.where(email: username).exists?
     errors.add(:username, :invalid)
    end

end
has_many :articles, foreign_key: :author_id
has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
