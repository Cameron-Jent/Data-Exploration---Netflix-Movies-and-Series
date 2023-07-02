--Purpose: Explore the dataset and view different types on insights
--Data was last updated in April 2021
--Source: https://www.kaggle.com/datasets/ashishgup/netflix-rotten-tomatoes-metacritic-imdb?resource=download
------------------------------------------------------------------------------------
/* view all data */
select *
from [Personal Projects].dbo.NetflixData;
------------------------------------------------------------------------------------
/* Show movies and genre with highest IMDB ratings that are available in English */
select Title, Genre, [IMDb Score], Languages
from [Personal Projects].dbo.NetflixData
where [Series or Movie] = 'Movie'
	and Languages like '%English%'
order by [IMDb Score] desc;
------------------------------------------------------------------------------------
/* Show series and genre with highest IMDB ratings that are available in English */
select Title, Genre, [IMDb Score], Languages
from [Personal Projects].dbo.NetflixData
where [Series or Movie] = 'Series'
	and Languages like '%English%'
order by [IMDb Score] desc;
------------------------------------------------------------------------------------
/* Show worst animated movies and series in the United States that are in English*/
select top 10 Title, [IMDb Score], Languages
from [Personal Projects].dbo.NetflixData
where Genre like '%Animation%'
	and [IMDb Score] is not null
	and [Country Availability] like '%United States%'
	and Languages like '%English%'
order by [IMDb Score] asc;
------------------------------------------------------------------------------------
/* Show highest box office movies in the US*/
select Title, [View Rating], Boxoffice, [Release Date], Genre
from [Personal Projects].dbo.NetflixData
where Boxoffice is not null
	and Languages like '%English%'
	and [Series or Movie] = 'Movie'
order by Boxoffice desc;
------------------------------------------------------------------------------------
/* Show the top 20 movies with the most awards*/
select top 20 Title, Director, [Awards Received], [Awards Nominated For], Languages, [Release Date]
from [Personal Projects].dbo.NetflixData
where [Series or Movie] = 'Movie'
order by [Awards Received] desc;
------------------------------------------------------------------------------------
/* Show the highest rated movies on Netflix that were available in 2020*/
select title, Genre, [IMDb Score], Runtime, [Netflix Release Date]
from [Personal Projects].dbo.NetflixData
where [Series or Movie] = 'Movie'
	and YEAR([Netflix Release Date]) < 2021
	and [Country Availability] like '%United States%'
order by [IMDb Score] desc;
------------------------------------------------------------------------------------
/* Show the genre with the most awards */
select Genre, SUM([Awards Received]) as TotalAwards, SUM([Awards Nominated For]) as TotalNominated,
	round((SUM([Awards Received])/SUM([Awards Nominated For])), 2) as PercentAwardsWon
from [Personal Projects].dbo.NetflixData
where [Series or Movie] = 'Movie'
group by Genre
order by TotalAwards desc;
------------------------------------------------------------------------------------