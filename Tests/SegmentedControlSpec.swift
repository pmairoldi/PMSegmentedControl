import Quick
import Nimble
import Nimble_Snapshots
@testable import PMSegmentedControl

class SegmentedControlSpec: QuickSpec {
    
    override func spec() {
        
        describe("segment control layout") {
        
            let window = UIWindow(frame: CGRect(x: 0, y: 0, width: 300, height: 50))

            var segmentControl: SegmentedControl!
            
            beforeEach {
                
                for subview in window.subviews {
                    subview.removeFromSuperview()
                }
                
                segmentControl = SegmentedControl(frame: window.bounds)
                
                window.addSubview(segmentControl)
            }
            
            it("will contain the right amount of segments") {
                
                segmentControl.insertSegment(UIView(), atIndex: 0, animated: false)
                segmentControl.insertSegment(UIView(), atIndex: 1, animated: false)
                segmentControl.insertSegment(UIView(), atIndex: 2, animated: false)

                expect(segmentControl.items.count) == 3
                
                segmentControl.removeSegment(atIndex: 0, animated: false)

                expect(segmentControl.items.count) == 2
                
                segmentControl.removeAllSegments()
                
                expect(segmentControl.items.count) == 0
            }
            
            it("will layout an item properly") {
                
                let view1 = UIView()
                view1.backgroundColor = UIColor.redColor()
                
                segmentControl.insertSegment(view1, atIndex: 0, animated: false)
                
                expect(segmentControl) == snapshot("segment_control__insert_one_item")
            }
            
            it("will layout multiple items properly") {
                
                let view1 = UIView()
                view1.backgroundColor = UIColor.redColor()
                
                let view2 = UIView()
                view2.backgroundColor = UIColor.greenColor()
                
                let view3 = UIView()
                view3.backgroundColor = UIColor.blueColor()
                
                segmentControl.insertSegment(view1, atIndex: 0, animated: false)
                segmentControl.insertSegment(view2, atIndex: 1, animated: false)
                segmentControl.insertSegment(view3, atIndex: 2, animated: false)
                
                expect(segmentControl) == snapshot("segment_control__insert_multiple_items")
            }
            
            it("will insert an item at index property") {
                
                let view1 = UIView()
                view1.backgroundColor = UIColor.redColor()
                
                let view2 = UIView()
                view2.backgroundColor = UIColor.greenColor()
                
                let view3 = UIView()
                view3.backgroundColor = UIColor.blueColor()
                
                segmentControl.insertSegment(view1, atIndex: 0, animated: false)
                segmentControl.insertSegment(view2, atIndex: 1, animated: false)

                expect(segmentControl) == snapshot("segment_control__insert_item_before")
                
                segmentControl.insertSegment(view3, atIndex: 2, animated: false)
                
                expect(segmentControl) == snapshot("segment_control__insert_item_after")
            }
            
            it("will insert an item at index property when no segment exists") {
                
                let view1 = UIView()
                view1.backgroundColor = UIColor.redColor()
                
                expect(segmentControl) == snapshot("segment_control__insert_single_item_before")

                segmentControl.insertSegment(view1, atIndex: 0, animated: false)
                
                expect(segmentControl) == snapshot("segment_control__insert_single_item_after")
            }
            
            it("will remove an item at index property") {
                
                let view1 = UIView()
                view1.backgroundColor = UIColor.redColor()
                
                let view2 = UIView()
                view2.backgroundColor = UIColor.greenColor()
                
                let view3 = UIView()
                view3.backgroundColor = UIColor.blueColor()
                
                segmentControl.insertSegment(view1, atIndex: 0, animated: false)
                segmentControl.insertSegment(view2, atIndex: 1, animated: false)
                segmentControl.insertSegment(view3, atIndex: 2, animated: false)

                expect(segmentControl) == snapshot("segment_control__remove_item_before")
                
                segmentControl.removeSegment(atIndex: 1, animated: false)
                
                expect(segmentControl) == snapshot("segment_control__remove_item_after")
            }
            
            it("will remove an item at index properly when only one exists") {
                
                let view1 = UIView()
                view1.backgroundColor = UIColor.redColor()
                
                segmentControl.insertSegment(view1, atIndex: 0, animated: false)
                
                expect(segmentControl) == snapshot("segment_control__remove_single_item_before")
                
                segmentControl.removeSegment(atIndex: 0, animated: false)
                
                expect(segmentControl) == snapshot("segment_control__remove_single_item_after")
            }
            
            it("will replace an item at index property") {
                
                let view1 = UIView()
                view1.backgroundColor = UIColor.redColor()
                
                let view2 = UIView()
                view2.backgroundColor = UIColor.greenColor()
                
                let view3 = UIView()
                view3.backgroundColor = UIColor.blueColor()
                
                let view4 = UIView()
                view4.backgroundColor = UIColor.orangeColor()
                
                segmentControl.insertSegment(view1, atIndex: 0, animated: false)
                segmentControl.insertSegment(view2, atIndex: 1, animated: false)
                segmentControl.insertSegment(view3, atIndex: 2, animated: false)
                
                expect(segmentControl) == snapshot("segment_control__replace_item_before")
                
                segmentControl.insertSegment(view4, atIndex: 1, animated: false)
                
                expect(segmentControl) == snapshot("segment_control__replace_item_after")
            }
            
            it("will replace an item at index properly when only one segment exists") {
                
                let view1 = UIView()
                view1.backgroundColor = UIColor.redColor()
                
                let view2 = UIView()
                view2.backgroundColor = UIColor.greenColor()
                
                segmentControl.insertSegment(view1, atIndex: 0, animated: false)
                
                expect(segmentControl) == snapshot("segment_control__replace_single_item_before")
                
                segmentControl.insertSegment(view2, atIndex: 0, animated: false)
                
                expect(segmentControl) == snapshot("segment_control__replace_single_item_after")
            }

            it("will remove an item and then insert an item") {
                
                let view1 = UIView()
                view1.backgroundColor = UIColor.redColor()
                
                let view2 = UIView()
                view2.backgroundColor = UIColor.greenColor()
                
                segmentControl.insertSegment(view1, atIndex: 0, animated: false)
                
                expect(segmentControl) == snapshot("segment_control__remove_insert_single_item_before")

                segmentControl.removeSegment(atIndex: 0, animated: false)
                segmentControl.insertSegment(view2, atIndex: 0, animated: false)
                
                expect(segmentControl) == snapshot("segment_control__remove_insert_single_item_after")
            }
            
            it("will push item if index is out of bounds") {
                
                let view1 = UIView()
                view1.backgroundColor = UIColor.redColor()
                
                expect(segmentControl) == snapshot("segment_control__push_item_before")
                
                segmentControl.insertSegment(view1, atIndex: 1, animated: false)
                
                expect(segmentControl) == snapshot("segment_control__push_item_after")
            }
            
            it("will animate layout") {
                
                let view1 = UIView()
                view1.backgroundColor = UIColor.redColor()
                
                segmentControl.insertSegment(view1, atIndex: 0, animated: true)
                
                expect(segmentControl) == snapshot()
            }
            
            it("will layout properly with an offset") {
                
                let view1 = UIView()
                view1.backgroundColor = UIColor.redColor()
                
                let view2 = UIView()
                view2.backgroundColor = UIColor.greenColor()

                let view3 = UIView()
                view3.backgroundColor = UIColor.blueColor()
                
                segmentControl.offset = 30

                segmentControl.insertSegment(view1, atIndex: 0, animated: false)
                segmentControl.insertSegment(view2, atIndex: 1, animated: false)
                segmentControl.insertSegment(view3, atIndex: 2, animated: false)

                expect(segmentControl) == snapshot()
            }
        }
        
        describe("segment control initializers") {
            
            let window = UIWindow(frame: CGRect(x: 0, y: 0, width: 300, height: 50))

            beforeEach {
                
                for subview in window.subviews {
                    subview.removeFromSuperview()
                }
            }
            
            it("will initialized with views properly") {
                
                let view1 = UIView()
                view1.backgroundColor = UIColor.redColor()
                
                let view2 = UIView()
                view2.backgroundColor = UIColor.greenColor()
                
                let view3 = UIView()
                view3.backgroundColor = UIColor.blueColor()
                
                let segmentControl = SegmentedControl(items: [view1, view2, view3])
                segmentControl.frame = window.bounds
                
                window.addSubview(segmentControl)
                
                expect(segmentControl) == snapshot()
            }
            
            it("will initialized with views properly") {
                
                let coder = MockCoder()
                let segmentControl = SegmentedControl(coder: coder)
                
                expect(segmentControl).toNot(beNil())
            }
        }
        
        describe("segment control selection") {
            
            let window = UIWindow(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
            
            var view: MockSegmentView!

            beforeEach {
                
                for subview in window.subviews {
                    subview.removeFromSuperview()
                }
                
                view = MockSegmentView()
                
                window.addSubview(view)
            }
            
            it("should select an segment") {
                
                let segment1 = view.segmentControl.segments[1]
                segment1.tap(segment1.tapGesture)
                
                let segment0 = view.segmentControl.segments[0]
                segment0.tap(segment0.tapGesture)
                
                expect(view.selections) == [1, 0]
            }
            
            it("should highlight the selected segment") {
                
                expect(view.segmentControl) == snapshot("segment_control__select_item_before")

                let segment1 = view.segmentControl.segments[1]
                segment1.tap(segment1.tapGesture)

                expect(view.segmentControl) == snapshot("segment_control__select_item_after_first")
                
                let segment2 = view.segmentControl.segments[2]
                segment2.tap(segment2.tapGesture)
                
                expect(view.segmentControl) == snapshot("segment_control__select_item_after_second")
            }
            
            it("should not select an element when it does not exist") {
             
                view.segmentControl.selectedSegmentIndex = 3
                
                expect(view.selections) == []
            }
        }
    }
}

public class MockSegmentView: UIView {
    
    public var segmentControl: SegmentedControl!
    public var selections = [Int]()
    
    public init() {
        super.init(frame: CGRectMake(0, 0, 300, 50))
        
        let view1 = UIView()
        view1.backgroundColor = UIColor.blueColor()
        
        let view2 = UIView()
        view2.backgroundColor = UIColor.blueColor()
        
        let view3 = UIView()
        view3.backgroundColor = UIColor.blueColor()
        
        segmentControl = SegmentedControl(frame: bounds)
        addSubview(segmentControl)
        
        segmentControl.insertSegment(view1, atIndex: 0, animated: false)
        segmentControl.insertSegment(view2, atIndex: 1, animated: false)
        segmentControl.insertSegment(view3, atIndex: 2, animated: false)
        
        segmentControl.didSelectItem = { [weak self] item in
            item.backgroundColor = UIColor.redColor()
            
            guard let strongSelf = self else {
                return
            }
            
            strongSelf.didSelect(strongSelf.segmentControl)
        }
        
        segmentControl.didDeselectItem = { item in
            item.backgroundColor = UIColor.blueColor()
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit {
        segmentControl.removeTarget(nil, action: nil, forControlEvents: .AllEvents)
    }
    
    public func didSelect(sender: SegmentedControl) {
        selections.append(sender.selectedSegmentIndex)
    }
}

public class MockCoder: NSCoder {
 
    public override init() {
        super.init()
    }
    
    public override var allowsKeyedCoding: Bool {
        return true
    }
    
    public override func containsValueForKey(key: String) -> Bool {
        return true
    }
    
    public override func decodeObjectForKey(key: String) -> AnyObject? {
        return nil
    }
    
    public override func decodeBoolForKey(key: String) -> Bool {
        return false
    }
    
    public override func decodeIntForKey(key: String) -> Int32 {
        return 0
    }
    
    public override func decodeInt32ForKey(key: String) -> Int32 {
        return 0
    }
    
    public override func decodeInt64ForKey(key: String) -> Int64 {
        return 0
    }
    
    public override func decodeFloatForKey(key: String) -> Float {
        return 0.0
    }
    
    public override func decodeDoubleForKey(key: String) -> Double {
        return 0.0
    }
}
