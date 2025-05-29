from ultralytics import YOLO

model = YOLO("yolov8n.pt")

model.train(
    data="dataset/data.yaml", 
    epochs=150,
    imgsz=640,
    batch=32,
    device='cuda'  
)
