classdef Gemm_To_GemmLayer1019 < nnet.layer.Layer & nnet.layer.Formattable
    % A custom layer auto-generated while importing an ONNX network.
    
    %#codegen
    %#ok<*PROPLC>
    %#ok<*NBRAK>
    %#ok<*INUSL>
    %#ok<*VARARG>
    
    properties (Learnable)
        layers_lin1_bias
        layers_lin1_weight
        layers_lin2_bias
        layers_lin2_weight
        layers_lin3_bias
        layers_lin3_weight
        layers_lin4_bias
        layers_lin4_weight
    end
    
    properties
        ONNXParams         % An ONNXParameters object containing parameters used by this layer.
    end
    
    methods
        function this = Gemm_To_GemmLayer1019(name, onnxParams)
            this.Name = name;
            this.NumInputs = 2;
            this.OutputNames = {'u'};
            this.ONNXParams = onnxParams;
            this.layers_lin1_bias = onnxParams.Learnables.layers_lin1_bias;
            this.layers_lin1_weight = onnxParams.Learnables.layers_lin1_weight;
            this.layers_lin2_bias = onnxParams.Learnables.layers_lin2_bias;
            this.layers_lin2_weight = onnxParams.Learnables.layers_lin2_weight;
            this.layers_lin3_bias = onnxParams.Learnables.layers_lin3_bias;
            this.layers_lin3_weight = onnxParams.Learnables.layers_lin3_weight;
            this.layers_lin4_bias = onnxParams.Learnables.layers_lin4_bias;
            this.layers_lin4_weight = onnxParams.Learnables.layers_lin4_weight;
        end
        
        function [u] = predict(this, x, xNumDims)
            if isdlarray(x)
                x = stripdims(x);
            end
            xNumDims = numel(xNumDims);
            onnxParams = this.ONNXParams;
            onnxParams.Learnables.layers_lin1_bias = this.layers_lin1_bias;
            onnxParams.Learnables.layers_lin1_weight = this.layers_lin1_weight;
            onnxParams.Learnables.layers_lin2_bias = this.layers_lin2_bias;
            onnxParams.Learnables.layers_lin2_weight = this.layers_lin2_weight;
            onnxParams.Learnables.layers_lin3_bias = this.layers_lin3_bias;
            onnxParams.Learnables.layers_lin3_weight = this.layers_lin3_weight;
            onnxParams.Learnables.layers_lin4_bias = this.layers_lin4_bias;
            onnxParams.Learnables.layers_lin4_weight = this.layers_lin4_weight;
            [u, uNumDims] = Gemm_To_GemmFcn(x, xNumDims, onnxParams, 'Training', false, ...
                'InputDataPermutation', {['as-is'], ['as-is']}, ...
                'OutputDataPermutation', {['as-is'], ['as-is']});
            if any(cellfun(@(A)isempty(A)||~isnumeric(A), {u}))
                fprintf('Runtime error in network. The custom layer ''%s'' output an empty or non-numeric value.\n', 'Gemm_To_GemmLayer1019');
                error(message('nnet_cnn_onnx:onnx:BadCustomLayerRuntimeOutput', 'Gemm_To_GemmLayer1019'));
            end
            u = dlarray(single(u), repmat('U', 1, max(2, uNumDims)));
            if ~coder.target('MATLAB')
                u = extractdata(u);
            end
        end
        
        function [u] = forward(this, x, xNumDims)
            if isdlarray(x)
                x = stripdims(x);
            end
            xNumDims = numel(xNumDims);
            onnxParams = this.ONNXParams;
            onnxParams.Learnables.layers_lin1_bias = this.layers_lin1_bias;
            onnxParams.Learnables.layers_lin1_weight = this.layers_lin1_weight;
            onnxParams.Learnables.layers_lin2_bias = this.layers_lin2_bias;
            onnxParams.Learnables.layers_lin2_weight = this.layers_lin2_weight;
            onnxParams.Learnables.layers_lin3_bias = this.layers_lin3_bias;
            onnxParams.Learnables.layers_lin3_weight = this.layers_lin3_weight;
            onnxParams.Learnables.layers_lin4_bias = this.layers_lin4_bias;
            onnxParams.Learnables.layers_lin4_weight = this.layers_lin4_weight;
            [u, uNumDims] = Gemm_To_GemmFcn(x, xNumDims, onnxParams, 'Training', true, ...
                'InputDataPermutation', {['as-is'], ['as-is']}, ...
                'OutputDataPermutation', {['as-is'], ['as-is']});
            if any(cellfun(@(A)isempty(A)||~isnumeric(A), {u}))
                fprintf('Runtime error in network. The custom layer ''%s'' output an empty or non-numeric value.\n', 'Gemm_To_GemmLayer1019');
                error(message('nnet_cnn_onnx:onnx:BadCustomLayerRuntimeOutput', 'Gemm_To_GemmLayer1019'));
            end
            u = dlarray(single(u), repmat('U', 1, max(2, uNumDims)));
            if ~coder.target('MATLAB')
                u = extractdata(u);
            end
        end
    end
end

function [u, uNumDims, state] = Gemm_To_GemmFcn(x, xNumDims, params, varargin)
%GEMM_TO_GEMMFCN Function implementing an imported ONNX network.
%
% THIS FILE WAS AUTO-GENERATED BY importONNXFunction.
% ONNX Operator Set Version: 9
%
% Variable names in this function are taken from the original ONNX file.
%
% [U] = Gemm_To_GemmFcn(X, PARAMS)
%			- Evaluates the imported ONNX network GEMM_TO_GEMMFCN with input(s)
%			X and the imported network parameters in PARAMS. Returns
%			network output(s) in U.
%
% [U, STATE] = Gemm_To_GemmFcn(X, PARAMS)
%			- Additionally returns state variables in STATE. When training,
%			use this form and set TRAINING to true.
%
% [__] = Gemm_To_GemmFcn(X, PARAMS, 'NAME1', VAL1, 'NAME2', VAL2, ...)
%			- Specifies additional name-value pairs described below:
%
% 'Training'
% 			Boolean indicating whether the network is being evaluated for
%			prediction or training. If TRAINING is true, state variables
%			will be updated.
%
% 'InputDataPermutation'
%			'auto' - Automatically attempt to determine the permutation
%			 between the dimensions of the input data and the dimensions of
%			the ONNX model input. For example, the permutation from HWCN
%			(MATLAB standard) to NCHW (ONNX standard) uses the vector
%			[4 3 1 2]. See the documentation for IMPORTONNXFUNCTION for
%			more information about automatic permutation.
%
%			'none' - Input(s) are passed in the ONNX model format. See 'Inputs'.
%
%			numeric vector - The permutation vector describing the
%			transformation between input data dimensions and the expected
%			ONNX input dimensions.%
%			cell array - If the network has multiple inputs, each cell
%			contains 'auto', 'none', or a numeric vector.
%
% 'OutputDataPermutation'
%			'auto' - Automatically attempt to determine the permutation
%			between the dimensions of the output and a conventional MATLAB
%			dimension ordering. For example, the permutation from NC (ONNX
%			standard) to CN (MATLAB standard) uses the vector [2 1]. See
%			the documentation for IMPORTONNXFUNCTION for more information
%			about automatic permutation.
%
%			'none' - Return output(s) as given by the ONNX model. See 'Outputs'.
%
%			numeric vector - The permutation vector describing the
%			transformation between the ONNX output dimensions and the
%			desired output dimensions.%
%			cell array - If the network has multiple outputs, each cell
%			contains 'auto', 'none' or a numeric vector.
%
% Inputs:
% -------
% X
%			- Input(s) to the ONNX network.
%			  The input size(s) expected by the ONNX file are:
%				  X:		[1, 6]				Type: FLOAT
%			  By default, the function will try to permute the input(s)
%			  into this dimension ordering. If the default is incorrect,
%			  use the 'InputDataPermutation' argument to control the
%			  permutation.
%
%
% PARAMS	- Network parameters returned by 'importONNXFunction'.
%
%
% Outputs:
% --------
% U
%			- Output(s) of the ONNX network.
%			  Without permutation, the size(s) of the outputs are:
%				  U:		[1, 3]				Type: FLOAT
%			  By default, the function will try to permute the output(s)
%			  from this dimension ordering into a conventional MATLAB
%			  ordering. If the default is incorrect, use the
%			  'OutputDataPermutation' argument to control the permutation.
%
% STATE		- (Optional) State variables. When TRAINING is true, these will
% 			  have been updated from the original values in PARAMS.State.
%
%
%  See also importONNXFunction

% Preprocess the input data and arguments:
[x, Training, outputDataPerms, anyDlarrayInputs] = preprocessInput(x, params, varargin{:});
% Put all variables into a single struct to implement dynamic scoping:
[Vars, NumDims] = packageVariables(params, {'x'}, {x}, [xNumDims]);
% Call the top-level graph function:
[u, uNumDims, state] = Gemm_To_GemmGraph1008(x, NumDims.x, Vars, NumDims, Training, params.State);
% Postprocess the output data
[u] = postprocessOutput(u, outputDataPerms, anyDlarrayInputs, Training, varargin{:});
end

function [u, uNumDims1018, state] = Gemm_To_GemmGraph1008(x, xNumDims1017, Vars, NumDims, Training, state)
% Function implementing the graph 'Gemm_To_GemmGraph1008'
% Update Vars and NumDims from the graph's formal input parameters. Note that state variables are already in Vars.
Vars.x = x;
NumDims.x = xNumDims1017;

% Execute the operators:
% Gemm:
[A, B, C, alpha, beta, NumDims.onnx__Sigmoid_9] = prepareGemmArgs(Vars.x, Vars.layers_lin1_weight, Vars.layers_lin1_bias, Vars.Gemmalpha1009, Vars.Gemmbeta1010, 0, 1, NumDims.layers_lin1_bias);
Vars.onnx__Sigmoid_9 = alpha*B*A + beta*C;

% Sigmoid:
Vars.onnx__Gemm_10 = sigmoid(Vars.onnx__Sigmoid_9);
NumDims.onnx__Gemm_10 = NumDims.onnx__Sigmoid_9;

% Gemm:
[A, B, C, alpha, beta, NumDims.onnx__Sigmoid_11] = prepareGemmArgs(Vars.onnx__Gemm_10, Vars.layers_lin2_weight, Vars.layers_lin2_bias, Vars.Gemmalpha1011, Vars.Gemmbeta1012, 0, 1, NumDims.layers_lin2_bias);
Vars.onnx__Sigmoid_11 = alpha*B*A + beta*C;

% Sigmoid:
Vars.onnx__Gemm_12 = sigmoid(Vars.onnx__Sigmoid_11);
NumDims.onnx__Gemm_12 = NumDims.onnx__Sigmoid_11;

% Gemm:
[A, B, C, alpha, beta, NumDims.onnx__Sigmoid_13] = prepareGemmArgs(Vars.onnx__Gemm_12, Vars.layers_lin3_weight, Vars.layers_lin3_bias, Vars.Gemmalpha1013, Vars.Gemmbeta1014, 0, 1, NumDims.layers_lin3_bias);
Vars.onnx__Sigmoid_13 = alpha*B*A + beta*C;

% Sigmoid:
Vars.onnx__Gemm_14 = sigmoid(Vars.onnx__Sigmoid_13);
NumDims.onnx__Gemm_14 = NumDims.onnx__Sigmoid_13;

% Gemm:
[A, B, C, alpha, beta, NumDims.u] = prepareGemmArgs(Vars.onnx__Gemm_14, Vars.layers_lin4_weight, Vars.layers_lin4_bias, Vars.Gemmalpha1015, Vars.Gemmbeta1016, 0, 1, NumDims.layers_lin4_bias);
Vars.u = alpha*B*A + beta*C;

% Set graph output arguments from Vars and NumDims:
u = Vars.u;
uNumDims1018 = NumDims.u;
% Set output state from Vars:
state = updateStruct(state, Vars);
end

function [inputDataPerms, outputDataPerms, Training] = parseInputs(x, numDataOutputs, params, varargin)
% Function to validate inputs to Gemm_To_GemmFcn:
p = inputParser;
isValidArrayInput = @(x)isnumeric(x) || isstring(x);
isValidONNXParameters = @(x)isa(x, 'ONNXParameters');
addRequired(p, 'x', isValidArrayInput);
addRequired(p, 'params', isValidONNXParameters);
addParameter(p, 'InputDataPermutation', 'auto');
addParameter(p, 'OutputDataPermutation', 'auto');
addParameter(p, 'Training', false);
parse(p, x, params, varargin{:});
inputDataPerms = p.Results.InputDataPermutation;
outputDataPerms = p.Results.OutputDataPermutation;
Training = p.Results.Training;
if isnumeric(inputDataPerms)
    inputDataPerms = {inputDataPerms};
end
if isstring(inputDataPerms) && isscalar(inputDataPerms) || ischar(inputDataPerms)
    inputDataPerms = repmat({inputDataPerms},1,1);
end
if isnumeric(outputDataPerms)
    outputDataPerms = {outputDataPerms};
end
if isstring(outputDataPerms) && isscalar(outputDataPerms) || ischar(outputDataPerms)
    outputDataPerms = repmat({outputDataPerms},1,numDataOutputs);
end
end

function [x, Training, outputDataPerms, anyDlarrayInputs] = preprocessInput(x, params, varargin)
% Parse input arguments
[inputDataPerms, outputDataPerms, Training] = parseInputs(x, 1, params, varargin{:});
anyDlarrayInputs = any(cellfun(@(x)isa(x, 'dlarray'), {x}));
% Make the input variables into unlabelled dlarrays:
x = makeUnlabeledDlarray(x);
% Permute inputs if requested:
x = permuteInputVar(x, inputDataPerms{1}, 2);
end

function [u] = postprocessOutput(u, outputDataPerms, anyDlarrayInputs, Training, varargin)
% Set output type:
if ~anyDlarrayInputs && ~Training
    if isdlarray(u)
        u = extractdata(u);
    end
end
% Permute outputs if requested:
u = permuteOutputVar(u, outputDataPerms{1}, 2);
end


%% dlarray functions implementing ONNX operators:

function [A, B, C, alpha, beta, numDimsY] = prepareGemmArgs(A, B, C, alpha, beta, transA, transB, numDimsC)
% Prepares arguments for implementing the ONNX Gemm operator
if transA
    A = A';
end
if transB
    B = B';
end
if numDimsC < 2
    C = C(:);   % C can be broadcast to [N M]. Make C a col vector ([N 1])
end
numDimsY = 2;
% Y=B*A because we want (AB)'=B'A', and B and A are already transposed.
end

%% Utility functions:

function s = appendStructs(varargin)
% s = appendStructs(s1, s2,...). Assign all fields in s1, s2,... into s.
if isempty(varargin)
    s = struct;
else
    s = varargin{1};
    for i = 2:numel(varargin)
        fromstr = varargin{i};
        fs = fieldnames(fromstr);
        for j = 1:numel(fs)
            s.(fs{j}) = fromstr.(fs{j});
        end
    end
end
end

function checkInputSize(inputShape, expectedShape, inputName)

if numel(expectedShape)==0
    % The input is a scalar
    if ~isequal(inputShape, [1 1])
        inputSizeStr = makeSizeString(inputShape);
        error(message('nnet_cnn_onnx:onnx:InputNeedsResize',inputName, "[1,1]", inputSizeStr));
    end
elseif numel(expectedShape)==1
    % The input is a vector
    if ~shapeIsColumnVector(inputShape) || ~iSizesMatch({inputShape(1)}, expectedShape)
        expectedShape{2} = 1;
        expectedSizeStr = makeSizeString(expectedShape);
        inputSizeStr = makeSizeString(inputShape);
        error(message('nnet_cnn_onnx:onnx:InputNeedsResize',inputName, expectedSizeStr, inputSizeStr));
    end
else
    % The input has 2 dimensions or more
    
    % The input dimensions have been reversed; flip them back to compare to the
    % expected ONNX shape.
    inputShape = fliplr(inputShape);
    
    % If the expected shape has fewer dims than the input shape, error.
    if numel(expectedShape) < numel(inputShape)
        expectedSizeStr = strjoin(["[", strjoin(string(expectedShape), ","), "]"], "");
        error(message('nnet_cnn_onnx:onnx:InputHasGreaterNDims', inputName, expectedSizeStr));
    end
    
    % Prepad the input shape with trailing ones up to the number of elements in
    % expectedShape
    inputShape = num2cell([ones(1, numel(expectedShape) - length(inputShape)) inputShape]);
    
    % Find the number of variable size dimensions in the expected shape
    numVariableInputs = sum(cellfun(@(x) isa(x, 'char') || isa(x, 'string'), expectedShape));
    
    % Find the number of input dimensions that are not in the expected shape
    % and cannot be represented by a variable dimension
    nonMatchingInputDims = setdiff(string(inputShape), string(expectedShape));
    numNonMatchingInputDims  = numel(nonMatchingInputDims) - numVariableInputs;
    
    expectedSizeStr = makeSizeString(expectedShape);
    inputSizeStr = makeSizeString(inputShape);
    if numNonMatchingInputDims == 0 && ~iSizesMatch(inputShape, expectedShape)
        % The actual and expected input dimensions match, but in
        % a different order. The input needs to be permuted.
        error(message('nnet_cnn_onnx:onnx:InputNeedsPermute',inputName, expectedSizeStr, inputSizeStr));
    elseif numNonMatchingInputDims > 0
        % The actual and expected input sizes do not match.
        error(message('nnet_cnn_onnx:onnx:InputNeedsResize',inputName, expectedSizeStr, inputSizeStr));
    end
end
end

function doesMatch = iSizesMatch(inputShape, expectedShape)
% Check whether the input and expected shapes match, in order.
% Size elements match if (1) the elements are equal, or (2) the expected
% size element is a variable (represented by a character vector or string)
doesMatch = true;
for i=1:numel(inputShape)
    if ~(isequal(inputShape{i},expectedShape{i}) || ischar(expectedShape{i}) || isstring(expectedShape{i}))
        doesMatch = false;
        return
    end
end
end

function sizeStr = makeSizeString(shape)
sizeStr = strjoin(["[", strjoin(string(shape), ","), "]"], "");
end

function isVec = shapeIsColumnVector(shape)
if numel(shape) == 2 && shape(2) == 1
    isVec = true;
else
    isVec = false;
end
end
function X = makeUnlabeledDlarray(X)
% Make numeric X into an unlabelled dlarray
if isa(X, 'dlarray')
    X = stripdims(X);
elseif isnumeric(X)
    if isinteger(X)
        % Make ints double so they can combine with anything without
        % reducing precision
        X = double(X);
    end
    X = dlarray(X);
end
end

function [Vars, NumDims] = packageVariables(params, inputNames, inputValues, inputNumDims)
% inputNames, inputValues are cell arrays. inputRanks is a numeric vector.
Vars = appendStructs(params.Learnables, params.Nonlearnables, params.State);
NumDims = params.NumDimensions;
% Add graph inputs
for i = 1:numel(inputNames)
    Vars.(inputNames{i}) = inputValues{i};
    NumDims.(inputNames{i}) = inputNumDims(i);
end
end

function X = permuteInputVar(X, userDataPerm, onnxNDims)
% Returns reverse-ONNX ordering
if onnxNDims == 0
    return;
elseif onnxNDims == 1 && isvector(X)
    X = X(:);
    return;
elseif isnumeric(userDataPerm)
    % Permute into reverse ONNX ordering
    if numel(userDataPerm) ~= onnxNDims
        error(message('nnet_cnn_onnx:onnx:InputPermutationSize', numel(userDataPerm), onnxNDims));
    end
    perm = fliplr(userDataPerm);
elseif isequal(userDataPerm, 'auto') && onnxNDims == 4
    % Permute MATLAB HWCN to reverse onnx (WHCN)
    perm = [2 1 3 4];
elseif isequal(userDataPerm, 'as-is')
    % Do not permute the input
    perm = 1:ndims(X);
else
    % userDataPerm is either 'none' or 'auto' with no default, which means
    % it's already in onnx ordering, so just make it reverse onnx
    perm = max(2,onnxNDims):-1:1;
end
X = permute(X, perm);
end

function Y = permuteOutputVar(Y, userDataPerm, onnxNDims)
switch onnxNDims
    case 0
        perm = [];
    case 1
        if isnumeric(userDataPerm)
            % Use the user's permutation because Y is a column vector which
            % already matches ONNX.
            perm = userDataPerm;
        elseif isequal(userDataPerm, 'auto')
            % Treat the 1D onnx vector as a 2D column and transpose it
            perm = [2 1];
        else
            % userDataPerm is 'none'. Leave Y alone because it already
            % matches onnx.
            perm = [];
        end
    otherwise
        % ndims >= 2
        if isnumeric(userDataPerm)
            % Use the inverse of the user's permutation. This is not just the
            % flip of the permutation vector.
            perm = onnxNDims + 1 - userDataPerm;
        elseif isequal(userDataPerm, 'auto')
            if onnxNDims == 2
                % Permute reverse ONNX CN to DLT CN (do nothing)
                perm = [];
            elseif onnxNDims == 4
                % Permute reverse onnx (WHCN) to MATLAB HWCN
                perm = [2 1 3 4];
            else
                % User wants the output in ONNX ordering, so just reverse it from
                % reverse onnx
                perm = onnxNDims:-1:1;
            end
        elseif isequal(userDataPerm, 'as-is')
            % Do not permute the input
            perm = 1:ndims(Y);
        else
            % userDataPerm is 'none', so just make it reverse onnx
            perm = onnxNDims:-1:1;
        end
end
if ~isempty(perm)
    Y = permute(Y, perm);
end
end

function s = updateStruct(s, t)
% Set all existing fields in s from fields in t, ignoring extra fields in t.
for name = transpose(fieldnames(s))
    s.(name{1}) = t.(name{1});
end
end