class Order < ApplicationRecord
  has_many :order_items

  belongs_to :user
  belongs_to :processor, class_name: 'Product', optional: true
  belongs_to :motherboard, class_name: 'Product', optional: true
  belongs_to :ram, class_name: 'Product', optional: true
  belongs_to :video_card, class_name: 'Product', optional: true

  validates :processor, presence: true
  validates :motherboard, presence: true
  validates :ram, presence: true

  validate :validate_processor_compatibility
  validate :validate_ram_selection
  validate :validate_video_card_requirement

  private

  def validate_processor_compatibility
    return if processor.nil? || motherboard.nil?

    processor_brand = extract_specification(processor.specifications, 'Marca')
    supported_processors = extract_specification(motherboard.specifications, 'Processadores suportados').split(', ')

    unless supported_processors.include?(processor_brand)
      errors.add(:processor, "não é compatível com a placa-mãe selecionada")
    end
  end

  def validate_ram_selection
    return if ram.nil? || motherboard.nil?

    ram_slots = extract_specification(motherboard.specifications, 'Slots de memória').to_i
    max_ram_supported = extract_specification(motherboard.specifications, 'Memória suportada').to_i
    selected_ram_size = extract_specification(ram.specifications, 'Tamanho').to_i

    if selected_ram_size > max_ram_supported
      errors.add(:ram, "selecionada excede o total suportado pela placa-mãe")
    end
  end

  def validate_video_card_requirement
    return if motherboard.nil?

    video_integrado = extract_specification(motherboard.specifications, 'Vídeo integrado') == 'Sim'
    if !video_integrado && video_card.nil?
      errors.add(:video_card, "é necessária, pois a placa-mãe não possui vídeo integrado")
    end
  end

  # Helper method to extract a specification from a formatted string
  def extract_specification(specifications, key)
    specs = specifications.split(', ').map { |spec| spec.split(': ') }.to_h
    specs[key]
  end
end
