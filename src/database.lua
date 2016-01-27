function CreateDatabase()
	-- Create tables
	local sqlCreate = {};
	sqlCreate[1] = "CREATE TABLE IF NOT EXISTS towns (town_id INTEGER PRIMARY KEY, town_name STRING, town_owner STRING)";
	sqlCreate[2] = "CREATE TABLE IF NOT EXISTS townChunks (townChunk_id INTEGER PRIMARY KEY, town_id INTEGER, chunkX INTEGER, chunkZ INTEGER)";
	sqlCreate[3] = "CREATE TABLE IF NOT EXISTS residents (player_uuid STRING, player_name STRING, town_id INTEGER, town_rank STRING, last_online INTEGER)";

	for key in pairs(sqlCreate) do
		ExecuteStatement(sqlCreate[key]);
	end
end

function ExecuteStatement(sql, parameters)
	local db = sqlite3.open(PLUGIN:GetLocalFolder() .. "/database.sqlite3");
	local stmt = db:prepare(sql);

	if not (parameters == nil) then
		for key, value in pairs(parameters) do
			stmt:bind(key, value);
		end
		--stmt:bind_names(parameters);
	end

	local result = {};
	if (sql:match("SELECT")) then
		local x = 1;
		while (stmt:step() == sqlite3.ROW) do
			result[x] = stmt:get_values();
			x = x + 1;
		end
	else
		stmt:step();
	end

	stmt:finalize();

	if (sql:match("INSERT")) then
		result = db:last_insert_rowid();
	end

	db:close();

	if not (result == nil) then
		return result;
	else
		return 0;
	end
end
