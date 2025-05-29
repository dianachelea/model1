from ultralytics import YOLO

model = YOLO("yolov8x.pt")

model.train(
    data="dataset/data.yaml", 
    epochs=200,
    imgsz=640,
    batch=32,
    device='cuda'  
)
