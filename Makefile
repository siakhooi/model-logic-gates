info:
prepare: clean
	cd notebooks && papermill 01_data_preparation.ipynb ../target/01_data_preparation_output.ipynb
prepare-spark: clean
	cd notebooks && papermill 01_data_preparation-spark.ipynb ../target/01_data_preparation-spark_output.ipynb
clean:
	rm -rf data/processed target
	mkdir -p target

clean-model:
	rm -rf models
train: clean-model
	mkdir -p target
	cd notebooks && papermill 02_model_fitting_tensorflow_keras.ipynb ../target/02_model_fitting_tensorflow_keras_output.ipynb

tf-fit: clean clean-model prepare train
