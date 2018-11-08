#include <iostream>

class Wallet
{
public:

    int money = 10;

    Wallet&& operator+(Wallet &&other)
    {
        this->money += other.money;
        return std::move(*this);
    }

    Wallet(int n) : money(n) {};

    Wallet(Wallet &w) = delete;

    Wallet(Wallet &&w)
    {
        money = w.money;
        w.money = 0;
    }
};

int main()
{
    Wallet w(2);

    Wallet sum = Wallet(1) + Wallet(3);

    std::cout << sum.money << std::endl;

    return 0;
}