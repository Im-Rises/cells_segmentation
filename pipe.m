function output = pipe(variable,functionsCellArray)
    for i = 1:length(functionsCellArray)
        variable = functionsCellArray{i}(variable);
    end
    output = variable;
end

