def select_books_titles_and_years_in_first_series_order_by_year
<<-SQL
  SELECT books.title, books.year
  FROM books
  JOIN series ON series.id = books.series_id
  WHERE series_id = 1
  ORDER BY books.year
SQL
end

def select_name_and_motto_of_char_with_longest_motto
<<-SQL
  SELECT name, motto
  FROM characters
  GROUP BY length(motto)
  ORDER BY  length(motto) DESC
  LIMIT 1
SQL
end


def select_value_and_count_of_most_prolific_species
<<-SQL
  SELECT species, COUNT(species)
  FROM characters
  GROUP BY species
  ORDER BY COUNT(species) DESC
  LIMIT 1
SQL
end

def select_name_and_series_subgenres_of_authors
<<-SQL
  SELECT authors.name, subgenres.name
  FROM authors
  JOIN series ON authors.id = series.author_id
  JOIN subgenres ON subgenres.id = series.subgenre_id
SQL
end

def select_series_title_with_most_human_characters
<<-SQL
  SELECT series.title
  FROM series
  JOIN characters ON characters.series_id = series.id
  WHERE characters.species = 'human'
  GROUP BY series.title
  LIMIT 1
SQL
end

def select_character_names_and_number_of_books_they_are_in
<<-SQL
  SELECT characters.name, COUNT(books.title)
  FROM characters
  JOIN character_books ON character_books.character_id = characters.id
  JOIN books ON books.id = character_books.book_id
  GROUP BY characters.name
  ORDER BY COUNT(books.title) DESC
SQL
end
