info:

clean-prepare:
	rm -rf target/prepared

prepare-pandas:
	cd notebooks && papermill 01_data_preparation_pandas.ipynb ../target/notebooks/01_data_preparation_pandas.ipynb
prepare-spark:
	cd notebooks && papermill 01_data_preparation_spark.ipynb ../target/notebooks/01_data_preparation_spark.ipynb

clean-model:
	rm -rf target/models
train-keras:
	cd notebooks && papermill 02_training_keras.ipynb ../target/notebooks/02_training_keras.ipynb
train-sklearn:
	cd notebooks && papermill 02_training_sklearn.ipynb ../target/notebooks/02_training_sklearn.ipynb

clean-inference:
	rm -rf target/inference
inference-keras:
	cd notebooks && papermill 03_inference_keras.ipynb ../target/notebooks/03_inference_keras.ipynb
inference-sklearn:
	cd notebooks && papermill 03_inference_sklearn.ipynb ../target/notebooks/03_inference_sklearn.ipynb

all-keras: clean-prepare clean-model prepare-pandas train-keras inference-keras
all-sklearn: clean-prepare clean-model prepare-pandas train-sklearn inference-sklearn

clean-all:
	rm -rf target
	mkdir -p target/notebooks
.PHONY: target
