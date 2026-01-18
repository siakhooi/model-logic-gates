info:
clean-prepare:
	rm -rf data/processed target
	mkdir -p target
prepare:
	cd notebooks && papermill 01_data_preparation.ipynb ../target/01_data_preparation_output.ipynb
prepare-spark:
	cd notebooks && papermill 01_data_preparation-spark.ipynb ../target/01_data_preparation-spark_output.ipynb

clean-model:
	rm -rf models
	mkdir -p target

train-keras:
	cd notebooks && papermill 02_model_fitting_tensorflow_keras.ipynb ../target/02_model_fitting_tensorflow_keras_output.ipynb
train-sklearn:
	cd notebooks && papermill 02_model_fitting_sklearn.ipynb ../target/02_model_fitting_sklearn_output.ipynb

clean-inference:
	rm -rf inference/output
	mkdir -p target

inference-keras:
	cd notebooks && papermill 03_inference_keras.ipynb ../target/03_inference_keras_output.ipynb

all-keras: clean-prepare clean-model prepare train-keras inference-keras
all-sklearn: clean-prepare clean-model prepare train-sklearn
