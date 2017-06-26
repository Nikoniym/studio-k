class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :timetables

  has_and_belongs_to_many :cashes
  has_and_belongs_to_many :contents
  has_and_belongs_to_many :active_tables
  belongs_to :cash_sort

  has_many :subscriptions

  has_attached_file :avatar, :styles => { :medium => "300x300#", :thumb => "200x200#", :minimal => "100x100#" }, :default_url => "missing_:style.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  crop_attached_file :avatar

  # validates :first_name, :last_name, presence: true
  # accepts_nested_attributes_for :edit_user

  after_validation :assign_default_role
  after_create :create_cash

  def assign_default_role
    self.add_role(:user) if self.roles.blank?
  end

  def create_cash
    if self.cashes.empty?
      c = Cash.create!(cash_sort_id: 1, cash_count: 0, date_finish: Date.today)
      c.users << self
      # cash_sort = CashSort.all
      # cash_sort.each do |sort|
      #   c = Cash.create!(cash_sort: sort, cash_count: 0)
      #   c.users << self
      # end
    end
    self.update(cash_sort_id: 1)
  end

  def full_name
    [last_name, first_name].compact.join(', ')
  end

  filterrific :default_filter_params => { :sorted_by => 'created_at_desc' },
              :available_filters => %w[
                sorted_by
                search_query
              ]


  scope :sorted_by, -> {with_role(:user).order(:last_name)}
  scope :search_query, lambda { |query|
    return nil  if query.blank?
    # condition query, parse into individual keywords
    terms = query.downcase.split(/\s+/)
    # replace "*" with "%" for wildcard searches,
    # append '%', remove duplicate '%'s
    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    # configure number of OR conditions for provision
    # of interpolation arguments. Adjust this if you
    # change the number of OR conditions.
    num_or_conditions = 1
    where(
        terms.map {
          or_clauses = [
              "LOWER(users.last_name) LIKE ?"].join(' OR ')
          "(#{ or_clauses })"
        }.join(' AND '),
        *terms.map { |e| [e] * num_or_conditions }.flatten
    )
  }

end
