CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;

-------------------------------------------------------------
-- PLEASE DO NOT CHANGE ANY SQL STATEMENTS ABOVE THIS LINE --
-------------------------------------------------------------

-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT d.name, s.size 
  FROM dogs AS d, sizes AS s
  WHERE d.height > s.min AND d.height <= s.max;

-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT d.name
  FROM dogs AS d, parents AS p, dogs as dd
  WHERE d.name = p.child AND p.parent = dd.name
  ORDER BY dd.height DESC;

-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT d.name AS name1, dd.name AS name2, d.size AS size
  FROM size_of_dogs AS d, size_of_dogs AS dd
  WHERE d.size = dd.size AND d.name < dd.name;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT s.name1 || ' and ' ||s.name2 || ' are ' || s.size || ' siblings' as sentence
  FROM siblings AS s, parents AS p, parents AS pp
  WHERE s.name1 = p.child AND s.name2 = pp.child AND p.parent = pp.parent
  ORDER BY s.name2;

-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
CREATE TABLE stacks_helper(dogs, stack_height, last_height);

-- Add your INSERT INTOs here


CREATE TABLE stacks AS
  SELECT a.name||', '||b.name||', '|| c.name ||', '|| d.name , a.height+b.height+c.height+d.height
  FROM  dogs AS a, dogs AS b, dogs AS c, dogs AS d
  WHERE a.height < b.height AND b.height < c.height AND c.height < d.height AND (a.height+b.height+c.height+d.height) > 170
  ORDER BY (a.height+b.height+c.height+d.height) ASC;

