info:
prepare: clean
	cd notebooks && papermill 01_data_preparation.ipynb ../target/01_data_preparation_output.ipynb
prepare-spark: clean
	cd notebooks && papermill 01_data_preparation-spark.ipynb ../target/01_data_preparation-spark_output.ipynb

clean:
	rm -rf data/processed target
	mkdir -p target

