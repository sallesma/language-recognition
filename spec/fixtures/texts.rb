module Fixtures
  module BasicEnglish
    def self.text
      "This is a test."
    end

    def self.first_letters
      [
        ['t', 2, 0.5],
        ['i', 1, 0.25],
        ['a', 1, 0.25]
      ]
    end

    def self.chained_letters
      [
        ['t', 'h', 1, 0.5],
        ['h', 'i', 1, 1.0],
        ['i', 's', 2, 1.0],
        ['t', 'e', 1, 0.5],
        ['e', 's', 1, 1.0],
        ['s', 't', 1, 1.0]
      ]
    end
  end
  
  module BasicFrench
    def self.text
      "Dessine moi un mouton."
    end
  end

  module BasicSpanish
    def self.text
      "Cuando sale la luna se pierden las campañas y aparecen las sendas impenetrables."
    end
  end

  module FullText
    def self.english
      "The tomato (see pronunciation) is the edible, often red berry-type fruit of Solanum lycopersicum, commonly known as a tomato plant, which belongs to the nightshade family, Solanaceae. The species originated in Central and South America. The Nahuatl (Aztec language) word tomatl gave rise to the Spanish word \"tomate\", where the English word tomato comes from. Its many varieties are widely grown, sometimes in greenhouses in cooler climates. The plants typically grow to 1–3 meters (3–10 ft) in height and have a weak stem that often sprawls over the ground and vines over other plants. It is a perennial in its native habitat, and grown as an annual in temperate climates. An average common tomato weighs approximately 100 grams (4 oz). Its use as a food originated in Mexico, and spread throughout the world following the Spanish colonization of the Americas. The tomato is consumed in diverse ways, including raw, as an ingredient in many dishes, sauces, salads, and drinks. While tomatoes are botanically and scientifically the berry-type fruits of the tomato plant, they can also be considered a culinary vegetable, causing some confusion."
    end
    def self.french
      "La tomate (Solanum lycopersicum L.) est une espèce de plantes herbacées de la famille des Solanacées, originaire du Nord-Ouest de l'Amérique du Sud1, largement cultivée pour son fruit. Le terme désigne aussi ce fruit charnu. La tomate se consomme comme un légume-fruit, crue ou cuite. Elle est devenue un élément incontournable de la gastronomie dans de nombreux pays, et tout particulièrement dans le bassin méditerranéen. La plante est cultivée en plein champ ou sous abri sous presque toutes les latitudes, sur une superficie d'environ trois millions d'hectares. La tomate a donné lieu au développement d'une importante industrie de transformation, pour la production de concentré, de sauce tomate, notamment de « ketchup » , de jus et de conserves. L'espèce compte quelques variétés botaniques, dont la « tomate-cerise » et plusieurs milliers de variétés cultivées (cultivars). De grande importance économique, elle est l'objet de nombreuses recherches scientifiques. Elle est considérée comme une plante-modèle en génétique. Elle a donné naissance à la première variété génétiquement transformée autorisée à la consommation et vendue de façon éphémère aux États-Unis dans les années 1990."
    end
    def self.spanish
      "Es una planta herbácea anual, a veces bienal, erecta o decumbente, de tamaño muy variable según las variedades (las precoces suelen alcanzar una longitud de 1,2 m; las tardías son casi siempre más grandes y pueden llegar al doble de longitud). Tiene tallos ramificado, a veces volubles, densamente glanduloso-pubescentes, con pelos cortos con o sin glándulas y pelos largos, blancos y pluricelulares. Las hojas llegan hasta 24 por 17 cm, ovadas u ovado-lanceoladas, imparipinnadas o biimparipinnadas con pecíolo de 1,5-6 cm y con folíolos que miden 4-60 por 3-40 mm, ovados, obtusos, peciolulados, enteros o lobados, muy desiguales, alternos, subopuestos u opuestos, en general verdes, glanduloso-pubescentes por el haz, cenicientos y tomentosos por el envés. La inflorescencia se compone de cimas racemiformes, aisladas o geminadas, con 3-7 flores, extraaxilar, con frecuencia opuesta a las hojas y con pedúnculo 4-15 mm, a veces bifurcado. Las flores son actinomorfas, hermafroditas, sin brácteas, con pedicelos de 5,5-20 mm en flor, y de hasta de 30 mm, deflexos y ensanchados en la fructificación, con una articulación hacia la mitad o un poco por encima de la misma. El cáliz tiene 6-10 mm en la floración y hasta de 30 mm en la fructificación. Es campanulado, con 5-7 sépalos soldados en la base, glanduloso-pubescente, y tubo de 0,5-1,5 mm, más corto que los lóbulos que miden 5-10 mm y son linear-lanceolados o linear-elípticos, subobtusos, ligeramente desiguales. La corola mide 8-12 mm, igual o ligeramente más larga que el cáliz, amarilla, glanduloso-pubescente, con 5-8 pétalos de 6-8,5 mm, soldados en la base, oblanceolados, ciliados, con tres nervios. Los estambres son glabros, iguales entre si, con filamentos de 0,2-1 mm, unidos en la parte inferior y con la parte distal libre, más corta que las anteras que tienen 6-8 mm. El ovario es glanduloso-pubescente con estilo cilíndrico, a veces ensanchado en el ápice, pubescente en la mitad inferior al menos cuando joven, y con estigma capitado, deprimido en el centro."
    end
  end
end