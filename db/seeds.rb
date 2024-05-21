# Criação e mapeamento de categorias
categories = ["Processador", "Placa Mãe", "Memória RAM", "Placa de Vídeo"]
categories.each do |category_name|
  Category.find_or_create_by!(name: category_name)
end

category_map = Category.all.index_by(&:name)

# Dados de processadores
processor_data = [
  { name: "Core i5", specifications: "Marca: Intel", category: category_map["Processador"], image_url: "https://laptopsreviewer.com/wp-content/uploads/2021/06/intel-core-i5-11400f-desktop-processor-6-cores-up-to-44-ghz-lga1200-intel-2048x2048.jpg"},
  { name: "Core i7", specifications: "Marca: Intel", category: category_map["Processador"], image_url: "https://th.bing.com/th/id/R.a1f0b340a991936d9b477cd0065d2458?rik=IpNUiYhs1GuRWw&pid=ImgRaw&r=0"},
  { name: "Ryzen 5", specifications: "Marca: AMD", category: category_map["Processador"], image_url: "https://th.bing.com/th/id/OIP.iWwVATfqhxqjqk-fD5CZNAHaFj?rs=1&pid=ImgDetMain"},
  { name: "Ryzen 7", specifications: "Marca: AMD", category: category_map["Processador"], image_url: "https://th.bing.com/th/id/OIP.V0hGVdzHzL3tXO-8l9ouigHaED?rs=1&pid=ImgDetMain"}
]

# Dados de placas-mãe
motherboard_data = [
  { name: "Asus ROG", specifications: "Processadores suportados: Intel, Slots de memória: 2, Memória suportada: 16GB, Vídeo integrado: Não", category: category_map["Placa Mãe"], image_url: "https://th.bing.com/th/id/OIP.VJ35Z7U1vPbuB1NIQ0xN6wHaHa?rs=1&pid=ImgDetMain" },
  { name: "Gigabyte Aorus", specifications: "Processadores suportados: AMD, Slots de memória: 2, Memória suportada: 16GB, Vídeo integrado: Não", category: category_map["Placa Mãe"], image_url: "https://th.bing.com/th/id/R.e13cc6c0cea033bf9906008fc81fdb4c?rik=ZDzD4YZYwNivYA&pid=ImgRaw&r=0"},
  { name: "ASRock Steel Legend", specifications: "Processadores suportados: Intel, AMD, Slots de memória: 4, Memória suportada: 64GB, Vídeo integrado: Sim", category: category_map["Placa Mãe"], image_url: "https://www.bhphotovideo.com/images/images1000x1000/asrock_b450m_steel_legend_amd_1576710.jpg"}
]

# Dados de memórias RAM
ram_data = (1..6).map do |i|
  {
    name: "Kingston HyperX #{2**i} GB",
    specifications: "Tamanho: #{2**i}GB",
    category: category_map["Memória RAM"],
    image_url: "https://http2.mlstatic.com/D_NQ_NP_880782-MPE40674257882_022020-F.jpg"
  }
end

# Dados de placas de vídeo
video_card_data = [
  { name: "Evga Geforce RTX 2060", specifications: "Memória: 6GB", category: category_map["Placa de Vídeo"], image_url: "https://th.bing.com/th/id/R.b0c4ec6e39d92ad446a14bb426c8cefc?rik=8ITPN7F8%2bnL8JA&pid=ImgRaw&r=0"},
  { name: "Asus ROG Strix Geforce RTX 3060 6GB", specifications: "Memória: 6GB", category: category_map["Placa de Vídeo"], image_url: "https://th.bing.com/th/id/OIP.abBScyt2cwNPCrPHj9K7YwAAAA?rs=1&pid=ImgDetMain"},
  { name: "Gigabyte Radeon RX 6600 XT EAGLE 8GB", specifications: "Memória: 8GB", category: category_map["Placa de Vídeo"], image_url: "https://cdn.mos.cms.futurecdn.net/bSmZsX2uEfZb8u9vdaJuVk-1200-80.jpg"}
]

# Criação de produtos no banco de dados
[processor_data, motherboard_data, ram_data, video_card_data].flatten.each do |product_data|
  Product.create!(product_data)
end
