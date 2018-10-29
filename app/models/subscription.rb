class Subscription < ApplicationRecord
  belongs_to :cash
  belongs_to :select_cash
  belongs_to :user
  accepts_nested_attributes_for :user
  self.per_page = 5

  ADULT_AGE = 14

  # Проверяем наличие не оплаченного абонемента
  validate :paid_subscriptions, on: :create

  # проверка на детский возраст заказчика
  validate :child_tariff, on: :create

  # заказ абонемента учителем с уже оплаченным статусом
  validate :teacher_paid, on: :create

  after_destroy :set_trial
  before_validation :set_params

  private

  def paid_subscriptions
    errors.add(:paid_subscriptions, 'Невозможно заказать абонемет, так как уже есть неоплаченный.') unless user.paid_subscriptions?
  end

  def child_tariff
    errors.add(:child_tariff, 'Заполните поле даты рождения.') if tariff == 'Детский' && !user.child_age?
  end

  def teacher_paid
    unless user.subscriptions.where(order_destroy: true).blank? || !user.paid_subscriptions?
      errors.add(:teacher_paid, 'Уже заказан')
    end
  end

  def set_trial
    user.update(trial_lesson: true) if trial_lesson
  end

  def set_params
    #Находим вариант абонемента и устанавливаем вид абонемента и длительност
    select_cash = SelectCash.find(select_cash_id)
    cash_sort = select_cash.cash_sort_id
    long_time = select_cash.long_time

    #Кошелек пользователя и если кошелька данного вида нет то создаю новый
    cash = user.cashes.find_by(cash_sort_id: cash_sort)
    self.cash = cash.nil? ? user.cashes.create!(cash_sort_id: cash_sort , cash_count: 0, last_name: user.full_name) : cash

    #цена абонемента
    self.price = select_cash.price
    #название вида тарифа
    self.tariff = select_cash.cash_sort.name

    #При наличии пробного занятия, прибавление его к абонементу
    self.count = user.trial_lesson ? select_cash.add_trial_lesson : select_cash.count
    #Установка даты начала если не определена либо меньше севодняшней
    self.date_start = Date.today if self.date_start.nil? || Date.today > self.date_start
    #Установка даты окончания с учетом, увеличенного времени
    self.date_finish = long_time ? date_start + 39 : date_start + 29
    # Для поздней активации, чтобы не затереть текущий абонемент
    self.confirm = self.cash.confirm?(date_start)
  end
end
