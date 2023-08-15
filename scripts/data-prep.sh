ogrmerge.py -single -o ./data/merged.shp ./data/TreePoint/BronxP.shp ./data/TreePoint/BrooklynP.shp ./data/TreePoint/ManhP.shp ./data/TreePoint/QueensP.shp ./data/TreePoint/StateIP.shp

ogr2ogr -f GeoJSON ./data/merged-wgs84.json -t_srs EPSG:4326 ./data/merged.shp -sql "SELECT null FROM merged"

# create mbtiles minzoom 15, maxzoom 16, don't drop points, assign feature ids
tippecanoe -o ./data/merged.mbtiles -Z 15 -z 16 ./data/merged-wgs84.json -B 15 -ai