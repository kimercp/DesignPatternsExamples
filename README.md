# Salesforce Apex Design Pattern Examples

A collection of practical **design pattern examples implemented in Salesforce Apex**.

The goal of this project is to provide simple, practical examples of commonly used design patterns and demonstrate how they can be applied to Salesforce development.

The examples focus on writing Apex that is:

- **Maintainable**
- **Testable**
- **Loosely coupled**
- **Reusable**
- **Easy to extend**

> These examples are intended as learning and reference material. A design pattern should be introduced when it solves a real design problem, not simply because a pattern exists.

---

## Design Patterns

| Pattern | Description | Typical Salesforce Use Case |
|---|---|---|
| **Decorator** | Adds behavior to an object without modifying its original implementation. | Adding optional functionality around a service. |
| **Factory** | Encapsulates object creation and hides implementation details. | Selecting a service implementation based on configuration or runtime conditions. |
| **Singleton** | Ensures that only one instance of a class exists within an Apex transaction. | Managing shared transaction-scoped state or configuration. |
| **Strategy** | Encapsulates interchangeable algorithms or business rules. | Supporting different pricing, validation, or processing rules. |
| **Unit of Work** | Collects and coordinates database operations within a transaction. | Managing related Salesforce DML operations and reducing scattered database calls. |

---

## Project Structure

Each design pattern has its own folder containing the relevant Apex classes and tests.

```text
force-app/
└── main/
    └── default/
        └── classes/
            ├── DecoratorPattern/
            ├── FactoryPattern/
            └── SingletonPattern/
                ├── Example1/
                └── Example2/
            └── StrategyPattern/
                ├── Example1/
                └── Example2/
            └── UnitOfWorkPattern/
