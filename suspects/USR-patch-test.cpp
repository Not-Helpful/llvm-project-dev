#include <iostream>

template<auto Operation>
struct Algorithm
{
    static int run(int x)
    {
        return Operation(x);
    }
};

constexpr auto square = [](int x) {
    return x * x;
};

int main()
{
    std::cout << Algorithm<square>::run(7) << "\n";
}

