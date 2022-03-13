//
//  LazyManagerUITests.swift
//  LazyManagerUITests
//
//  Created by Takashi MAEDA on 2022/03/13.
//

import XCTest

class when_user_types_task_name_and_press_add_button: XCTestCase {

    private var app: XCUIApplication!
    
    override func setUp() {
        self.app = XCUIApplication()
        self.app.launch()
    }
    
    private func taskNameTextField() -> XCUIElement{
        self.app.textFields["taskNameTextField"]
    }
    
    private func typeTextToTaskNameTextField(_ text: String) {
        let taskNameField = taskNameTextField()
        taskNameField.tap()
        taskNameField.typeText(text)
    }
    
    private func tapAddTaskButton() {
        let addTaskButton = self.app.buttons["addTaskButton"]
        addTaskButton.tap()
    }
    
    func test_should_add_task_to_the_list() {
        typeTextToTaskNameTextField("Wash the car \n")
        tapAddTaskButton()
        let taskCount = self.app.tables.children(matching: .cell).count
        XCTAssertEqual(1, taskCount)
    }
    
    func test_should_clear_task_name_field() {
        typeTextToTaskNameTextField("Wash the car \n")
        tapAddTaskButton()
        XCTAssertEqual("Enter new task", taskNameTextField().value as! String)
    }
    
    func test_should_not_add_task_when_task_name_is_blank() {
        tapAddTaskButton()
        let taskCount = self.app.tables.children(matching: .cell).count
        XCTAssertEqual(0, taskCount)
    }
    
}
