function  y=to_binary(str,varargin)

    if ~isempty(varargin)

        min_digits=varargin{1};

    else

        min_digits=1;

    end

    y=dec2bin(str2double(str),min_digits);

end