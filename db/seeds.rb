categories = ["Processador", "Placa Mãe", "Memória RAM", "Placa de Vídeo"]
categories.each do |category_name|
  Category.find_or_create_by!(name: category_name)
end

category_map = Category.all.index_by(&:name)

processor_data = [
  { name: "Core i5", specifications: "{ \"marca\": \"Intel\" }", category: category_map["Processador"], image_url: "https://laptopsreviewer.com/wp-content/uploads/2021/06/intel-core-i5-11400f-desktop-processor-6-cores-up-to-44-ghz-lga1200-intel-2048x2048.jpg"  },
  { name: "Core i7", specifications: "{ \"marca\": \"Intel\" }", category: category_map["Processador"], image_url: "https://th.bing.com/th/id/R.a1f0b340a991936d9b477cd0065d2458?rik=IpNUiYhs1GuRWw&pid=ImgRaw&r=0"  },
  { name: "Ryzen 5", specifications: "{ \"marca\": \"AMD\" }", category: category_map["Processador"], image_url: "https://th.bing.com/th/id/OIP.iWwVATfqhxqjqk-fD5CZNAHaFj?rs=1&pid=ImgDetMain" },
  { name: "Ryzen 7", specifications: "{ \"marca\": \"AMD\" }", category: category_map["Processador"], image_url: "https://th.bing.com/th/id/OIP.V0hGVdzHzL3tXO-8l9ouigHaED?rs=1&pid=ImgDetMain" }
]

motherboard_data = [
  { name: "Asus ROG", specifications: "{ \"processadores_suportados\": [\"Intel\"], \"slots_memoria\": 2, \"memoria_suportada\": 16, \"video_integrado\": false }", category: category_map["Placa Mãe"] },
  { name: "Gigabyte Aorus", specifications: "{ \"processadores_suportados\": [\"AMD\"], \"slots_memoria\": 2, \"memoria_suportada\": 16, \"video_integrado\": false }", category: category_map["Placa Mãe"] },
  { name: "ASRock Steel Legend", specifications: "{ \"processadores_suportados\": [\"Intel\", \"AMD\"], \"slots_memoria\": 4, \"memoria_suportada\": 64, \"video_integrado\": true }", category: category_map["Placa Mãe"] }
]

ram_data = (1..6).map do |i|
  {
    name: "Kingston HyperX #{2**i} GB",
    specifications: "{ \"tamanho\": #{2**i} }",
    category: category_map["Memória RAM"]
  }
end

video_card_data = [
  { name: "Evga Geforce RTX 2060", specifications: "{ \"memoria\": 6 }", category: category_map["Placa de Vídeo"] },
  { name: "Asus ROG Strix Geforce RTX 3060 6GB", specifications: "{ \"memoria\": 6 }", category: category_map["Placa de Vídeo"] },
  { name: "Gigabyte Radeon RX 6600 XT EAGLE 8GB", specifications: "{ \"memoria\": 8 }", category: category_map["Placa de Vídeo"] }
]

[processor_data, motherboard_data, ram_data, video_card_data].flatten.each do |product_data|
  Product.create!(product_data)
end
