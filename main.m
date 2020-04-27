function main ()
    bound = [-100 100; -100 100];
    [P,F,I] = GSA(500, 20, 100, @test, bound);
    disp("Position of best value:");
    disp(P);
    disp("Best fitness value:");
    disp(F);
    disp("Iteration:");
    disp(I);
end