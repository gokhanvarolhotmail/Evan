SELECT
	[Business_Owner], [Description]
	INTO #temp
FROM (VALUES
('Blank', ''),
('A', ' Accountant'),
('B', 'Builder'),
('C', 'Contractor'),
('D', 'Dealer/Retailer/Storekeeper'),
('E', 'Distributor/Wholesaler'),
('F', 'Funeral Director'),
('M', 'Maker/Manufacturer'),
('O', 'Owner'),
('P', ' Partner'),
('S', 'Self-Employed'))
vdata ([Business_Owner], [Description])


SELECT 	[Business_Owner], [Description] 	INTO BusinessOwner FROM #temp

CREATE UNIQUE CLUSTERED INDEX [Business_Owner] ON BusinessOwner ([Business_Owner])
CREATE UNIQUE NONCLUSTERED INDEX [Description] ON BusinessOwner ([Description])