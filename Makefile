info:

clean-prepare:
	rm -rf data/prepared target
	mkdir -p target
prepare-pandas:
	cd notebooks && papermill 01_data_preparation_pandas.ipynb ../target/01_data_preparation_pandas.ipynb
prepare-spark:
	cd notebooks && papermill 01_data_preparation_spark.ipynb ../target/01_data_preparation_spark.ipynb

clean-model:
	rm -rf models
	mkdir -p target
train-keras:
	cd notebooks && papermill 02_training_keras.ipynb ../target/02_training_keras.ipynb
train-sklearn:
	cd notebooks && papermill 02_training_sklearn.ipynb ../target/02_training_sklearn.ipynb

clean-inference:
	rm -rf inference/output
	mkdir -p target
inference-keras:
	cd notebooks && papermill 03_inference_keras.ipynb ../target/03_inference_keras.ipynb
inference-sklearn:
	cd notebooks && papermill 03_inference_sklearn.ipynb ../target/03_inference_sklearn.ipynb

all-keras: clean-prepare clean-model prepare-pandas train-keras inference-keras
all-sklearn: clean-prepare clean-model prepare-pandas train-sklearn inference-sklearn
