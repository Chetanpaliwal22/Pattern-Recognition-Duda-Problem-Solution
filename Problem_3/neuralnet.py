# Computer Network Programming Assignemnt 4
from math import exp
from random import seed
from random import random


def initialize_signmoidal_network(input, hidden, output):
    signmoidal_network = list()


        h_layer = [{'weights': [random() for i in range(input + 1)]}
                   for i in range(hidden)]
        signmoidal_network.append(h_layer)
        out_layer = [{'weights': [random() for i in range(hidden + 1)]} for i in range(output)]
        signmoidal_network.append(out_layer)
         return signmoidal_network


def activate_weight(weight, input):


        activation = weight[-1]
         for i in range(len(weight)-1):
                activation += weight[i] * input[i]
                final_result = 1.0 / (1.0 + exp(-activation))
         return final_result


def forward_propagation(signmoidal_network, row):


        inputs = row
         for layer in signmoidal_network:
                new_inputs = []
                 for neuron in layer:
                        neuron['output'] = activate_weight(neuron['weights'], inputs)
                        new_inputs.append(neuron['output'])
                inputs = new_inputs
         return inputs

# test forward propagation
network = [[{'weights': [0.13436424411240122, 0.8474337369372327, 0.763774618976614]}],
           [{'weights': [0.2550690257394217, 0.49543508709194095]}, {'weights': [0.4494910647887381, 0.651592972722763]}]]

seed(1)
signmoidal_network = initialize_signmoidal_network(2, 1, 2)
for layer in signmoidal_network:
         print(layer)

row = [1, 0, None]
output = forward_propagation(network, row)
print(output)

# Backpropagate error and store in neurons


def backward_propagate_error(network, expected):
    for i in reversed(range(len(network))):
        layer = network[i]
        errors = list()
        if i != len(network)-1:
            for j in range(len(layer)):
                error = 0.0
                for neuron in network[i + 1]:
                    error += (neuron['weights'][j] * neuron['delta'])
                errors.append(error)
        else:
            for j in range(len(layer)):
                neuron = layer[j]
                errors.append(expected[j] - neuron['output'])
        for j in range(len(layer)):
            neuron = layer[j]
            neuron['delta'] = errors[j] * transfer_derivative(neuron['output'])

            # Calculate the derivative of an neuron output


def transfer_derivative(output):
    return output * (1.0 - output)

# Backpropagate error and store in neurons


def backward_propagate_error(network, expected):
    for i in reversed(range(len(network))):
        layer = network[i]
        errors = list()
        if i != len(network)-1:
            for j in range(len(layer)):
                error = 0.0
                for neuron in network[i + 1]:
                    error += (neuron['weights'][j] * neuron['delta'])
                errors.append(error)
        else:
            for j in range(len(layer)):
                neuron = layer[j]
                errors.append(expected[j] - neuron['output'])
        for j in range(len(layer)):
            neuron = layer[j]
            neuron['delta'] = errors[j] * transfer_derivative(neuron['output'])


# test backpropagation of error
network = [[{'output': 0.7105668883115941, 'weights': [0.13436424411240122, 0.8474337369372327, 0.763774618976614]}],
           [{'output': 0.6213859615555266, 'weights': [0.2550690257394217, 0.49543508709194095]}, {'output': 0.6573693455986976, 'weights': [0.4494910647887381, 0.651592972722763]}]]
expected = [0, 1]
backward_propagate_error(network, expected)
for layer in network:
    print(layer)
