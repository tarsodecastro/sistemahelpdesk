# encoding: UTF-8  
class Chamado < ActiveRecord::Base
  belongs_to :user
  # belongs_to :cliente
  belongs_to :produto
  has_many :comments, :dependent => :destroy
  attr_accessible :assunto, :cortesia, :descricao, :finalizaSolicitacao, 
  				  :observacao, :prioridade, :solucionado, 
  				  :tipoAtendimento, :valorGeral, :produto_id, :user_id, :produto, :status, :servicos_attributes, :cancelar
validates_presence_of :produto_name, :assunto, :descricao, :prioridade, :tipoAtendimento, :slug

has_many :servicos, :dependent => :destroy
  accepts_nested_attributes_for :servicos, allow_destroy: true

# TIPODEATENDIMENTO = %w(1,2,3,4".split(",").map { |s| s.to_i })
TIPODEATENDIMENTO = %w('Online' 'Balcão' 'Domiciliar' 'Visita-cliente')
PRIORIDADE = %w(Normal Urgente Extraurgente)
STATUS = %w(0 10 20 30 40 50 60 70 80 90 100)

validates_numericality_of :status, :valorGeral, :greater_than => -1, :allow_nil => true

def identificacao_chamado
  " N #{id} - #{assunto} - #{user.name}"
end
before_validation :generate_slug


def to_param
  "#{id}-#{slug}"
end

# def produto_name
 #  produto.name if produto
# end
# 
# def produto_name=(name)
 #  self.produto = Produto.find_or_create_by_name(name) unless name.blank?
# end

  def produto_name
    produto.try(:name)
  end
  
  def produto_name=(name)
    # self.produto = Produto.find_or_create_by_name(name) unless name.blank?
    self.produto = Produto.find_by_name(name) unless name.blank?
  end
protected

  def generate_slug
    self.slug = assunto unless slug.present?
    self.slug = slug.parameterize
  end
end
