import 'package:artistry_hub/enums/gender.dart';
import 'package:artistry_hub/models/artist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final List<Artist> artists = [
  Artist(
    name: 'Leonardo da Vinci',
    gender: Gender.male,
    image:
        'https://avatar.iran.liara.run/public/boy?username=Leonardo_da_Vinci',
    nationality: 'Italy',
    outstandingAchievement:
        'Renowned for masterpieces like Mona Lisa and The Last Supper; pioneer of the High Renaissance.',
    createdAt: Timestamp.now(),
    updatedAt: Timestamp.now(),
  ),
  Artist(
    name: 'Vincent van Gogh',
    gender: Gender.male,
    image: 'https://avatar.iran.liara.run/public/boy?username=Vincent_van_Gogh',
    nationality: 'Netherlands',
    outstandingAchievement:
        'Known for Starry Night and Sunflowers; significant influence on modern art despite his struggles with mental health.',
    createdAt: Timestamp.now(),
    updatedAt: Timestamp.now(),
  ),
  Artist(
    name: 'Pablo Picasso',
    gender: Gender.male,
    image: 'https://avatar.iran.liara.run/public/boy?username=Pablo_Picasso',
    nationality: 'Spain',
    outstandingAchievement:
        'Co-founder of Cubism; famous works include Guernica and Les Demoiselles d\'Avignon.',
    createdAt: Timestamp.now(),
    updatedAt: Timestamp.now(),
  ),
  Artist(
    name: 'Claude Monet',
    gender: Gender.male,
    image: 'https://avatar.iran.liara.run/public/boy?username=Claude_Monet',
    nationality: 'France',
    outstandingAchievement:
        'Leader of the Impressionist movement; celebrated for works like Water Lilies and Impression, Sunrise.',
    createdAt: Timestamp.now(),
    updatedAt: Timestamp.now(),
  ),
  Artist(
    name: 'Salvador Dalí',
    gender: Gender.male,
    image: 'https://avatar.iran.liara.run/public/boy?username=Salvador_Dali',
    nationality: 'Spain',
    outstandingAchievement:
        'Master of Surrealism; famous for The Persistence of Memory and his eccentric personality.',
    createdAt: Timestamp.now(),
    updatedAt: Timestamp.now(),
  ),
  Artist(
    name: 'Michelangelo Buonarroti',
    gender: Gender.male,
    image:
        'https://avatar.iran.liara.run/public/boy?username=Michelangelo_Buonarroti',
    nationality: 'Italy',
    outstandingAchievement:
        'Renowned Renaissance sculptor and painter; created David and the Sistine Chapel ceiling.',
    createdAt: Timestamp.now(),
    updatedAt: Timestamp.now(),
  ),
  Artist(
    name: 'Frida Kahlo',
    gender: Gender.female,
    image: 'https://avatar.iran.liara.run/public/girl?username=Frida_Kahlo',
    nationality: 'Mexico',
    outstandingAchievement:
        'Icon of self-portrait and surrealism; known for The Two Fridas and deeply personal art.',
    createdAt: Timestamp.now(),
    updatedAt: Timestamp.now(),
  ),
  Artist(
    name: 'Rembrandt van Rijn',
    gender: Gender.male,
    image:
        'https://avatar.iran.liara.run/public/boy?username=Rembrandt_van_Rijn',
    nationality: 'Netherlands',
    outstandingAchievement:
        'Baroque master known for The Night Watch and his expressive portraiture.',
    createdAt: Timestamp.now(),
    updatedAt: Timestamp.now(),
  ),
  Artist(
    name: 'Andy Warhol',
    gender: Gender.male,
    image: 'https://avatar.iran.liara.run/public/boy?username=Andy_Warhol',
    nationality: 'United States',
    outstandingAchievement:
        'Leading figure of the Pop Art movement; famous for Campbell\'s Soup Cans and portraits of celebrities.',
    createdAt: Timestamp.now(),
    updatedAt: Timestamp.now(),
  ),
  Artist(
    name: 'Jackson Pollock',
    gender: Gender.male,
    image: 'https://avatar.iran.liara.run/public/boy?username=Jackson_Pollock',
    nationality: 'United States',
    outstandingAchievement:
        'Pioneer of Abstract Expressionism; known for his drip painting technique (No. 5, 1948).',
    createdAt: Timestamp.now(),
    updatedAt: Timestamp.now(),
  ),
];
