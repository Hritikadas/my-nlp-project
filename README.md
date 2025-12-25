# Movie Review Sentiment Classification

A machine learning project that classifies movie review sentiments using custom implementations of Bag of Words, N-Gram features, and Softmax Regression.

## Overview

This project implements sentiment classification on movie reviews using:
- Custom feature extraction methods (Bag of Words and N-Gram)
- Softmax regression classifier built from scratch
- Comparison between different feature extraction techniques

## Dataset

The project uses the Kaggle Movie Review dataset (`train.tsv`) containing movie review phrases and their sentiment labels (0-4 scale).

## Project Structure

```
├── dataset/
│   └── kaggle-movie-review/
│       └── train.tsv           # Training dataset
├── data_preprocess.py          # Data loading and preprocessing
├── feature_extraction.py       # Bag of Words and N-Gram implementations
├── softmax_regerssion.py       # Custom Softmax Regression classifier
├── main.py                     # Main training and evaluation script
├── requirements.txt            # Project dependencies
└── README.md                   # This file
```

## Features

### Feature Extraction Methods
- **Bag of Words (BoW)**: Counts word occurrences in each review
- **N-Gram**: Captures word sequences (unigrams and bigrams)

### Model
- **Softmax Regression**: Multi-class classifier with gradient descent optimization
- Supports both batch and stochastic gradient descent
- Configurable learning rate and epochs

## Installation

1. Clone or download this repository
2. Install required dependencies:
```bash
python -m pip install -r requirements.txt
```

## Usage

Run the main script to train and evaluate both feature extraction methods:

```bash
python main.py
```

The script will:
1. Load and preprocess the movie review data
2. Extract features using both BoW and N-Gram methods
3. Split data into training and testing sets
4. Train separate models for each feature type
5. Display training loss curves
6. Print accuracy scores for both approaches

## Configuration

You can modify these parameters in `main.py`:

- `debug`: Set to 1 for quick testing (uses only 1000 samples)
- `epoch`: Number of training iterations (default: 100)
- `learning_rate`: Learning rate for gradient descent
- `update_strategy`: "batch" or "stochastic" gradient descent

## Results

The project compares two feature extraction approaches:
- **Bag of Words**: Simple word counting approach
- **N-Gram**: Captures word sequences for better context understanding

Training and test accuracies are displayed for both methods, along with loss curves to visualize training progress.

## Dependencies

- `numpy`: Numerical computations
- `pandas`: Data manipulation and CSV reading
- `matplotlib`: Plotting training curves
- `scikit-learn`: Train/test data splitting

## Implementation Details

- **Custom Softmax**: Numerically stable implementation with overflow prevention
- **Feature Extraction**: Built from scratch without external NLP libraries
- **Gradient Descent**: Both batch and stochastic variants implemented
- **One-Hot Encoding**: Manual implementation for multi-class labels

## Author

Created by phil (2020)