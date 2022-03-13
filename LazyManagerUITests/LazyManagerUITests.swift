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
    
    func test_should_add_task_to_the_list() {
        let taskNameField = self.app.textFields["taskNameTextField"]
        taskNameField.tap()
        taskNameField.typeText("Wash the car \n")
        let addTaskButton = self.app.buttons["addTaskButton"]
        addTaskButton.tap()
        let taskCount = self.app.tables.children(matching: .cell).count
        XCTAssertEqual(1, taskCount)
    }
    
    func test_should_clear_task_name_field() {
        let taskNameField = self.app.textFields["taskNameTextField"]
        taskNameField.tap()
        taskNameField.typeText("Wash the car \n")
        let addTaskButton = self.app.buttons["addTaskButton"]
        addTaskButton.tap()
        XCTAssertEqual("Enter new task", taskNameField.value as! String)
    }
    // test_should_not_add_task_when_task_name_is_blank
    
    
}
