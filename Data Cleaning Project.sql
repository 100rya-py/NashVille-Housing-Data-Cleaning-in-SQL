-- Cleaning Data in SQL

Select * 
From nashville_housing;

-- Standardize Date Format

select SaleDate,Convert(SaleDate,Date)
from nashville_housing;

update nashville_housing
set SaleDate = Convert(SaleDate,Date); -- Doesn't Work Use the query Below Instead

alter table nashville_housing 
add SaleDateNew Date;

update nashville_housing
set SaleDateNew = Convert(SaleDate,Date);

select SaleDateNew
from nashville_housing;


-- Populate Property Address Data 

select ParcelID,PropertyAddress 
from nashville_housing;


select a.DistinctID ,a.ParcelID,a.PropertyAddress ,b.DistinctID ,b.ParcelID ,b.PropertyAddress 
from nashville_housing a
join nashville_housing b
    on a.parcelID = b.parcelID
    and a.distinctID != b.distinctid
where a.PropertyAddress is null; 

# We noticed that some of the PropertyAddress are empty and some are filled which have the same ParcelID 
# We are gonna use that to fill empty Adresses.

update nashville_housing a 
       join nashville_housing b
    		on b.parcelID = a.parcelID
   		    and a.distinctID <> b.distinctid
set a.PropertyAddress = ifnull(a.PropertyAddress,b.PropertyAddress)
where a.PropertyAddress is null and b.PropertyAddress IS NOT NULL; 

-- Breaking out Address into Individual Columns (Address, City,State)

select PropertyAddress
from nashville_housing;

# Extraction

select Substring(PropertyAddress,1,locate(',',PropertyAddress)-1) as Address,
       Substring(PropertyAddress,locate(',',PropertyAddress)+1,length(PropertyAddress)) as City
from nashville_housing nh;

alter table nashville_housing 
add PropertySplitAddress Char(55);
update nashville_housing
set PropertySplitAddress = Substring(PropertyAddress,1,locate(',',PropertyAddress)-1)

alter table nashville_housing 
add PropertySplitCity Char(55);
update nashville_housing
set PropertySplitCity = Substring(PropertyAddress,locate(',',PropertyAddress)+1,length(PropertyAddress));

select *
from nashville_housing;


# with Owner Address Data

select 
substring_index(replace(OwnerAddress,',','.'),'.',1),
substring_index(substring_index(replace(OwnerAddress,',','.'),'.',2),'.',-1),
substring_index(replace(OwnerAddress,',','.'),'.',-1)
from nashville_housing nh ;
 
alter table nashville_housing 
add OwnerSplitAddress Char(55);
update nashville_housing
set OwnerSplitAddress = substring_index(replace(OwnerAddress,',','.'),'.',1);

alter table nashville_housing 
add OwnerSplitCity Char(55);
update nashville_housing
set OwnerSplitCity = substring_index(substring_index(replace(OwnerAddress,',','.'),'.',2),'.',-1);

alter table nashville_housing 
add OwnerSplitState Char(55);
update nashville_housing
set OwnerSplitState = substring_index(replace(OwnerAddress,',','.'),'.',-1);

select * from nashville_housing nh ;

-- Change Y and N to Yes and No in "Sold as Vacant" field

select distinct SOldasVacant, Count(SoldasVacant)
from nashville_housing nh 
group by nh.SoldAsVacant
order by 2;

select SoldasVacant, 
         case when Soldasvacant="Y" then "Yes"
              when SoldasVacant = "N" then 'No' 
              else SoldAsvacant end
from nashville_housing nh ;

update nashville_housing nh 
set SoldAsVacant = (case when Soldasvacant="Y" then "Yes"
             	 		 when SoldasVacant = "N" then 'No' 
              			 else SoldAsvacant end);

select distinct SOldasVacant, Count(SoldasVacant)
from nashville_housing nh 
group by nh.SoldAsVacant
order by 2;

-- Remove Duplicates
with RowNumCTE as (
select *, Row_number() over(
		  partition by ParcelID,
		               PropertyAddress,
		               SalePrice,
		               SaleDate,
		               LegalReference
		   order by DistinctID) as row_num 
from nashville_housing nh
order by ParcelID)
select * from RowNumCTE where row_num>1;