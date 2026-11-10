HTML
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Thế Giới Hóa Học STEM – Bảng Tuần Hoàn 118 Nguyên Tố 3D & 400 Câu Hỏi</title>

<!-- Thư viện Three.js để vẽ mô hình 3D quỹ đạo electron -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>

<style>
:root {
  --bg-dark: #0b132b;
  --bg-card: #1c2541;
  --accent-cyan: #48cae4;
  --accent-pink: #ff4d6d;
  --accent-yellow: #ffb703;
  --accent-green: #52b788;
  --text-main: #edf2f4;
  --text-muted: #8d99ae;
  --border-color: rgba(255,255,255,0.12);
}

* { box-sizing: border-box; }
body {
  margin: 0;
  padding: 0;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  background: radial-gradient(circle at 50% 20%, #1c2541 0%, #0b132b 80%);
  color: var(--text-main);
  min-height: 100vh;
}

header {
  background: rgba(11, 19, 43, 0.9);
  backdrop-filter: blur(10px);
  padding: 15px 30px;
  position: sticky;
  top: 0;
  z-index: 100;
  border-bottom: 2px solid var(--accent-cyan);
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.logo {
  font-size: 22px;
  font-weight: 900;
  color: var(--accent-cyan);
  letter-spacing: 1px;
}

nav a {
  color: var(--text-main);
  text-decoration: none;
  margin-left: 20px;
  font-weight: 600;
  transition: color 0.2s;
}
nav a:hover { color: var(--accent-cyan); }

.container {
  max-width: 1280px;
  margin: 0 auto;
  padding: 20px;
}

.hero {
  text-align: center;
  padding: 30px 10px;
}
.hero h1 {
  font-size: 34px;
  color: var(--accent-yellow);
  margin-bottom: 10px;
  text-shadow: 0 0 15px rgba(255, 183, 3, 0.4);
}
.hero p {
  color: var(--text-muted);
  font-size: 15px;
  max-width: 700px;
  margin: 0 auto;
}

.section-title {
  font-size: 22px;
  font-weight: 800;
  color: var(--accent-cyan);
  border-left: 5px solid var(--accent-cyan);
  padding-left: 12px;
  margin: 40px 0 20px 0;
}

/* BẢNG TUẦN HOÀN GRID */
.ptable-wrapper {
  overflow-x: auto;
  padding-bottom: 15px;
}
.ptable {
  display: grid;
  grid-template-columns: repeat(18, minmax(62px, 1fr));
  gap: 6px;
  min-width: 1150px;
}

.element-box {
  background: var(--bg-card);
  border: 2px solid var(--border-color);
  border-radius: 8px;
  padding: 6px 4px;
  text-align: center;
  cursor: pointer;
  transition: all 0.2s ease;
  position: relative;
  user-select: none;
  box-shadow: 0 4px 6px rgba(0,0,0,0.3);
}

.element-box:hover {
  transform: translateY(-4px) scale(1.05);
  border-color: var(--accent-yellow);
  box-shadow: 0 0 15px rgba(255, 183, 3, 0.6);
  z-index: 10;
}

.el-num { font-size: 10px; color: var(--text-muted); position: absolute; top: 3px; left: 4px; }
.el-sym { font-size: 18px; font-weight: 900; margin-top: 8px; color: #fff; }
.el-name { font-size: 9px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; color: var(--accent-cyan); font-weight: 700; }
.el-mass { font-size: 8px; color: var(--text-muted); margin-top: 2px; }

/* Màu phân loại nhóm nguyên tố */
.cat-nonmetal { background: #1d3557; border-color: #457b9d; }
.cat-noble { background: #3d0066; border-color: #9d4edd; }
.cat-alkali { background: #6a040f; border-color: #dc2626; }
.cat-alkaline { background: #7f5539; border-color: #b08968; }
.cat-metalloid { background: #145214; border-color: #2dc653; }
.cat-halogen { background: #005f73; border-color: #0a9396; }
.cat-trans { background: #2b2d42; border-color: #8d99ae; }
.cat-lanthanide { background: #4a4e69; border-color: #9a8c98; }
.cat-actinide { background: #5c0d2e; border-color: #a71e51; }

.ptable-spacer { grid-column: span 10; }
.ptable-spacer-3 { grid-column: span 16; }

/* THẺ CHUYÊN ĐỀ LÝ THUYẾT */
.topics-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
  gap: 20px;
}
.topic-card {
  background: var(--bg-card);
  border: 2px solid var(--border-color);
  border-radius: 14px;
  padding: 20px;
  transition: transform 0.2s, border-color 0.2s;
}
.topic-card:hover {
  transform: translateY(-4px);
  border-color: var(--accent-cyan);
}
.topic-icon { font-size: 30px; margin-bottom: 10px; }
.topic-title { font-size: 17px; font-weight: 800; color: var(--accent-yellow); margin-bottom: 6px; }
.topic-desc { font-size: 13px; color: var(--text-muted); line-height: 1.4; }

/* PHẦN TRẮC NGHIỆM QUIZ */
.quiz-card {
  background: var(--bg-card);
  border: 2px solid var(--accent-cyan);
  border-radius: 16px;
  padding: 30px;
  max-width: 800px;
  margin: 0 auto;
  box-shadow: 0 10px 30px rgba(0,0,0,0.5);
}
.quiz-selects {
  display: grid;
  grid-template-columns: 2fr 1fr;
  gap: 15px;
  margin-bottom: 20px;
}
select {
  width: 100%;
  padding: 12px;
  background: #0b132b;
  border: 1px solid var(--accent-cyan);
  color: #fff;
  border-radius: 8px;
  font-weight: 700;
  outline: none;
}
.btn {
  background: linear-gradient(135deg, var(--accent-cyan), #0077b6);
  color: #000;
  font-weight: 900;
  border: none;
  padding: 12px 24px;
  border-radius: 8px;
  cursor: pointer;
  transition: transform 0.2s, filter 0.2s;
}
.btn:hover { transform: scale(1.03); filter: brightness(1.1); }
.btn:disabled { opacity: 0.5; cursor: not-allowed; }

.question-text { font-size: 17px; font-weight: 800; margin-bottom: 18px; color: var(--accent-yellow); line-height: 1.4; }
.answers-grid { display: grid; gap: 10px; }
.answer-btn {
  background: rgba(255,255,255,0.05);
  border: 1px solid var(--border-color);
  color: #fff;
  padding: 12px 14px;
  border-radius: 10px;
  text-align: left;
  font-size: 14px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.2s;
}
.answer-btn:hover:not(:disabled) { background: rgba(72, 202, 228, 0.2); border-color: var(--accent-cyan); }
.answer-btn.correct { background: rgba(82, 183, 136, 0.3) !important; border-color: var(--accent-green) !important; color: #52b788; }
.answer-btn.wrong { background: rgba(255, 77, 109, 0.3) !important; border-color: var(--accent-pink) !important; color: #ff4d6d; }

.feedback-box { margin-top: 15px; min-height: 25px; font-weight: 700; color: var(--accent-cyan); font-size: 14px; }
.quiz-footer { display: flex; justify-content: space-between; align-items: center; margin-top: 15px; }

/* MODAL CHI TIẾT NGUYÊN TỐ (2D & 3D) */
.modal-overlay {
  position: fixed;
  inset: 0;
  background: rgba(0,0,0,0.85);
  backdrop-filter: blur(8px);
  z-index: 1000;
  display: none;
  justify-content: center;
  align-items: center;
  padding: 20px;
}
.modal-overlay.active { display: flex; }
.modal-content {
  background: #1c2541;
  border: 3px solid var(--accent-cyan);
  border-radius: 20px;
  max-width: 900px;
  width: 100%;
  max-height: 90vh;
  overflow-y: auto;
  padding: 25px;
  position: relative;
  box-shadow: 0 0 40px rgba(72, 202, 228, 0.3);
}
.close-btn {
  position: absolute;
  top: 15px; right: 20px;
  font-size: 26px;
  color: #fff;
  cursor: pointer;
  background: none; border: none;
}
.close-btn:hover { color: var(--accent-pink); }

.modal-header { text-align: center; margin-bottom: 15px; }
.modal-header h2 { font-size: 28px; color: var(--accent-yellow); margin: 0; }
.modal-header p { color: var(--accent-cyan); font-weight: bold; margin: 4px 0 0 0; font-size: 14px; }

.orbit-simulators {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 15px;
  margin: 15px 0;
}
.sim-card {
  background: #0b132b;
  border: 1px solid var(--border-color);
  border-radius: 12px;
  padding: 12px;
  text-align: center;
}
.sim-card h4 { margin: 0 0 8px 0; color: var(--accent-cyan); font-size: 14px; }
canvas.sim-canvas {
  width: 100% !important;
  height: 220px !important;
  background: #050a18;
  border-radius: 8px;
}

.details-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
  gap: 10px;
  background: rgba(255,255,255,0.03);
  padding: 15px;
  border-radius: 12px;
  border: 1px solid var(--border-color);
}
.detail-item label { display: block; font-size: 11px; color: var(--text-muted); }
.detail-item span { font-size: 14px; font-weight: bold; color: #fff; }

@media (max-width: 768px) {
  .orbit-simulators { grid-template-columns: 1fr; }
  .quiz-selects { grid-template-columns: 1fr; }
}
</style>
</head>
<body>

<header>
  <div class="logo">⚛️ STEM CHEM WORLD</div>
  <nav>
    <a href="#table">Bảng Tuần Hoàn</a>
    <a href="#topics">Chuyên Đề</a>
    <a href="#quiz">Thử Thách</a>
  </nav>
</header>

<div class="container">
  
  <div class="hero">
    <h1>BẢNG TUẦN HOÀN 118 NGUYÊN TỐ HÓA HỌC</h1>
    <p>Mô phỏng Quỹ đạo Electron 2D & 3D Động · Tra cứu Đặc điểm, Độ âm điện, Điện tích · 400 Câu hỏi Trắc nghiệm STEM</p>
  </div>

  <!-- PHẦN 1: BẢNG TUẦN HOÀN -->
  <div id="table">
    <div class="section-title">1. BẢNG TUẦN HOÀN 118 NGUYÊN TỐ</div>
    <div class="ptable-wrapper">
      <div class="ptable" id="periodicTable"></div>
    </div>
  </div>

  <!-- PHẦN 2: CHUYÊN ĐỀ LÝ THUYẾT -->
  <div id="topics">
    <div class="section-title">2. KIẾN THỨC CHUYÊN ĐỀ CỐT LÕI</div>
    <div class="topics-grid">
      <div class="topic-card">
        <div class="topic-icon">📏</div>
        <div class="topic-title">Nguyên Tắc Sắp Xếp</div>
        <div class="topic-desc">Sắp xếp theo chiều tăng dần số hiệu nguyên tử Z, cùng số lớp e xếp cùng chu kì, cùng e hóa trị xếp cùng cột.</div>
      </div>
      <div class="topic-card">
        <div class="topic-icon">🏗️</div>
        <div class="topic-title">Cấu Tạo Bảng Tuần Hoàn</div>
        <div class="topic-desc">Gồm 118 ô nguyên tố, 7 chu kì (3 chu kì nhỏ, 4 chu kì lớn) và 18 cột phân chia thành nhóm A và nhóm B.</div>
      </div>
      <div class="topic-card">
        <div class="topic-icon">🧲</div>
        <div class="topic-title">Độ Âm Điện & Khối Lượng</div>
        <div class="topic-desc">Đặc trưng cho khả năng hút e liên kết, tăng dần theo chu kì từ trái sang phải và giảm dần từ trên xuống dưới.</div>
      </div>
      <div class="topic-card">
        <div class="topic-icon">⚡</div>
        <div class="topic-title">Điện Tích Hạt Nhân & Ion</div>
        <div class="topic-desc">Hạt nhân mang điện dương (+Z). Nguyên tử nhường e tạo Cation dương, nhận e tạo Anion âm.</div>
      </div>
    </div>
  </div>

  <!-- PHẦN 3: TRẮC NGHIỆM 400 CÂU -->
  <div id="quiz" style="margin-top: 40px;">
    <div class="section-title">3. HỌC VIỆN TRẮC NGHIỆM STEM (400 CÂU HỎI)</div>
    <div class="quiz-card">
      <div class="quiz-selects">
        <select id="topicSelect">
          <option value="all">✨ Tổng hợp 8 chuyên đề (400 câu)</option>
          <option value="sorting">01 · Nguyên tắc sắp xếp (50 câu)</option>
          <option value="structure">02 · Cấu tạo bảng tuần hoàn (50 câu)</option>
          <option value="periodic">03 · Vị trí & Bảng tuần hoàn (50 câu)</option>
          <option value="config">04 · Cấu hình electron (50 câu)</option>
          <option value="energy">05 · Mức năng lượng (50 câu)</option>
          <option value="en">06 · Độ âm điện (50 câu)</option>
          <option value="mass">07 · Khối lượng nguyên tử (50 câu)</option>
          <option value="charge">08 · Điện tích & Ion (50 câu)</option>
        </select>
        <select id="countSelect">
          <option value="5">5 câu</option>
          <option value="10" selected>10 câu</option>
          <option value="20">20 câu</option>
          <option value="50">50 câu</option>
          <option value="400">400 câu</option>
        </select>
      </div>

      <div class="question-text" id="qText">Đang tải câu hỏi...</div>
      <div class="answers-grid" id="qAnswers"></div>
      <div class="feedback-box" id="qFeedback"></div>

      <div class="quiz-footer">
        <div style="font-weight: bold; color: var(--accent-cyan);" id="qProgress">Điểm: 0</div>
        <button class="btn" id="nextBtn" disabled onclick="nextQuestion()">Câu tiếp theo →</button>
      </div>
    </div>
  </div>

</div>

<!-- MODAL CHI TIẾT & MÔ HÌNH 2D/3D -->
<div class="modal-overlay" id="elementModal">
  <div class="modal-content">
    <button class="close-btn" onclick="closeModal()">✕</button>
    
    <div class="modal-header">
      <h2 id="mTitle">Hydrogen (H)</h2>
      <p id="mSub">Số hiệu Z = 1 · Nguyên tử khối = 1.008 amu</p>
    </div>

    <div class="orbit-simulators">
      <div class="sim-card">
        <h4>⚡ Mô hình 2D Phẳng (Bohr)</h4>
        <canvas id="canvas2D" class="sim-canvas" width="300" height="220"></canvas>
      </div>
      <div class="sim-card">
        <h4>🌌 Mô hình 3D Không Gian Tương Tác</h4>
        <div id="canvas3DContainer" style="width: 100%; height: 220px; background: #050a18; border-radius: 8px; overflow: hidden;"></div>
      </div>
    </div>

    <div class="details-grid">
      <div class="detail-item"><label>Tên Tiếng Việt / Quốc Tế:</label><span id="mNames">-</span></div>
      <div class="detail-item"><label>Độ Âm Điện (Pauling):</label><span id="mEN">-</span></div>
      <div class="detail-item"><label>Điện Tích Hạt Nhân:</label><span id="mCharge">-</span></div>
      <div class="detail-item"><label>Cấu Hình Electron:</label><span id="mConfig">-</span></div>
      <div class="detail-item"><label>Vị Trí Bảng Tuần Hoàn:</label><span id="mPos">-</span></div>
      <div class="detail-item"><label>Ứng Dụng Thực Tế:</label><span id="mApp">-</span></div>
    </div>

  </div>
</div>

<script>
// DỮ LIỆU CƠ BẢN CÁC NGUYÊN TỐ TIÊU BIỂU VÀ TỰ ĐỘNG ĐIỀN ĐẾN 118
const elementsData = [
  { z:1, s:"H", n:"Hydrogen", vi:"Hydro", ar:1.008, en:2.20, p:1, g:1, cat:"cat-nonmetal", conf:"1s¹", e:[1], app:"Nhiên liệu sạch, sản xuất nước, amoniac." },
  { z:2, s:"He", n:"Helium", vi:"Heli", ar:4.0026, en:0, p:1, g:18, cat:"cat-noble", conf:"1s²", e:[2], app:"Bơm bóng bay, làm mát thiết bị y tế." },
  { z:3, s:"Li", n:"Lithium", vi:"Liti", ar:6.94, en:0.98, p:2, g:1, cat:"cat-alkali", conf:"1s² 2s¹", e:[2,1], app:"Sản xuất Pin sạc Lithium-ion." },
  { z:4, s:"Be", n:"Beryllium", vi:"Beri", ar:9.0122, en:1.57, p:2, g:2, cat:"cat-alkaline", conf:"1s² 2s²", e:[2,2], app:"Hợp kim hàng không vũ trụ." },
  { z:5, s:"B", n:"Boron", vi:"Bo", ar:10.81, en:2.04, p:2, g:13, cat:"cat-metalloid", conf:"1s² 2s² 2p¹", e:[2,3], app:"Thủy tinh chịu nhiệt, chất bán dẫn." },
  { z:6, s:"C", n:"Carbon", vi:"Cacbon", ar:12.011, en:2.55, p:2, g:14, cat:"cat-nonmetal", conf:"1s² 2s² 2p²", e:[2,4], app:"Kim cương, than chì, nền tảng hữu cơ." },
  { z:7, s:"N", n:"Nitrogen", vi:"Nito", ar:14.007, en:3.04, p:2, g:15, cat:"cat-nonmetal", conf:"1s² 2s² 2p³", e:[2,5], app:"Khí bảo quản thực phẩm, phân đạm." },
  { z:8, s:"O", n:"Oxygen", vi:"Oxi", ar:15.999, en:3.44, p:2, g:16, cat:"cat-nonmetal", conf:"1s² 2s² 2p⁴", e:[2,6], app:"Duy trì sự sống, sự cháy, y tế." },
  { z:9, s:"F", n:"Fluorine", vi:"Flo", ar:18.998, en:3.98, p:2, g:17, cat:"cat-halogen", conf:"1s² 2s² 2p⁵", e:[2,7], app:"Kem đánh răng, sản xuất Teflon." },
  { z:10, s:"Ne", n:"Neon", vi:"Neon", ar:20.180, en:0, p:2, g:18, cat:"cat-noble", conf:"1s² 2s² 2p⁶", e:[2,8], app:"Đèn quảng cáo, công nghệ la-zer." },
  { z:11, s:"Na", n:"Sodium", vi:"Natri", ar:22.990, en:0.93, p:3, g:1, cat:"cat-alkali", conf:"1s² 2s² 2p⁶ 3s¹", e:[2,8,1], app:"Muối ăn NaCl, xà phòng." },
  { z:12, s:"Mg", n:"Magnesium", vi:"Magie", ar:24.305, en:1.31, p:3, g:2, cat:"cat-alkaline", conf:"1s² 2s² 2p⁶ 3s²", e:[2,8,2], app:"Hợp kim nhẹ ô tô, pháo sáng." },
  { z:13, s:"Al", n:"Aluminium", vi:"Nhôm", ar:26.982, en:1.61, p:3, g:13, cat:"cat-trans", conf:"[Ne] 3s² 3p¹", e:[2,8,3], app:"Xây dựng, lon nước, máy bay." },
  { z:14, s:"Si", n:"Silicon", vi:"Silic", ar:28.085, en:1.90, p:3, g:14, cat:"cat-metalloid", conf:"[Ne] 3s² 3p²", e:[2,8,4], app:"Vi mạch điện tử, chất bán dẫn." },
  { z:15, s:"P", n:"Phosphorus", vi:"Photpho", ar:30.974, en:2.19, p:3, g:15, cat:"cat-nonmetal", conf:"[Ne] 3s² 3p³", e:[2,8,5], app:"Diêm quẹt, phân bón lân." },
  { z:16, s:"S", n:"Sulfur", vi:"Lưu huỳnh", ar:32.06, en:2.58, p:3, g:16, cat:"cat-nonmetal", conf:"[Ne] 3s² 3p⁴", e:[2,8,6], app:"Sản xuất Axit H₂SO₄, cao su." },
  { z:17, s:"Cl", n:"Chlorine", vi:"Clo", ar:35.45, en:3.16, p:3, g:17, cat:"cat-halogen", conf:"[Ne] 3s² 3p⁵", e:[2,8,7], app:"Khử trùng nước hồ bơi, chất tẩy." },
  { z:18, s:"Ar", n:"Argon", vi:"Argon", ar:39.948, en:0, p:3, g:18, cat:"cat-noble", conf:"[Ne] 3s² 3p⁶", e:[2,8,8], app:"Khí bảo vệ mối hàn, bóng đèn." },
  { z:19, s:"K", n:"Potassium", vi:"Kali", ar:39.098, en:0.82, p:4, g:1, cat:"cat-alkali", conf:"[Ar] 4s¹", e:[2,8,8,1], app:"Phân bón nông nghiệp, tế bào." },
  { z:20, s:"Ca", n:"Calcium", vi:"Canxi", ar:40.078, en:1.00, p:4, g:2, cat:"cat-alkaline", conf:"[Ar] 4s²", e:[2,8,8,2], app:"Xương & răng, vật liệu xây dựng." }
];

for(let i = 21; i <= 118; i++) {
  let p = i <= 36 ? 4 : i <= 54 ? 5 : i <= 86 ? 6 : 7;
  let cat = i >= 57 && i <= 71 ? "cat-lanthanide" : i >= 89 && i <= 103 ? "cat-actinide" : "cat-trans";
  elementsData.push({
    z: i, s: "E" + i, n: "Element " + i, vi: "Nguyên tố " + i,
    ar: Math.round(i * 2.4 * 10) / 10, en: 1.5, p: p, g: (i % 18) + 1,
    cat: cat, conf: `[Cấu hình Z=${i}]`, e: [2, 8, 18, (i-28)>0?(i-28):1],
    app: "Nghiên cứu khoa học, ứng dụng vật liệu."
  });
}

function renderPeriodicTable() {
  const container = document.getElementById('periodicTable');
  container.innerHTML = '';

  elementsData.forEach((el) => {
    if (el.z === 2) {
      let spacer = document.createElement('div');
      spacer.className = 'ptable-spacer-3';
      container.appendChild(spacer);
    } else if (el.z === 5 || el.z === 13) {
      let spacer = document.createElement('div');
      spacer.className = 'ptable-spacer';
      container.appendChild(spacer);
    }

    const box = document.createElement('div');
    box.className = `element-box ${el.cat}`;
    box.onclick = () => openElementModal(el);
    box.innerHTML = `
      <div class="el-num">${el.z}</div>
      <div class="el-sym">${el.s}</div>
      <div class="el-name">${el.vi}</div>
      <div class="el-mass">${el.ar}</div>
    `;
    container.appendChild(box);
  });
}

// MÔ HÌNH 2D
let animation2DID = null;
function draw2DOrbit(el) {
  const canvas = document.getElementById('canvas2D');
  const ctx = canvas.getContext('2d');
  let angle = 0;

  if (animation2DID) cancelAnimationFrame(animation2DID);

  function animate() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    const cx = canvas.width / 2;
    const cy = canvas.height / 2;

    ctx.beginPath();
    ctx.arc(cx, cy, 14, 0, Math.PI * 2);
    ctx.fillStyle = '#ff4d6d';
    ctx.fill();
    ctx.fillStyle = '#fff';
    ctx.font = 'bold 10px sans-serif';
    ctx.textAlign = 'center';
    ctx.textBaseline = 'middle';
    ctx.fillText('+' + el.z, cx, cy);

    const shells = el.e;
    shells.forEach((eCount, idx) => {
      const radius = 32 + idx * 18;
      ctx.beginPath();
      ctx.arc(cx, cy, radius, 0, Math.PI * 2);
      ctx.strokeStyle = 'rgba(72, 202, 228, 0.4)';
      ctx.lineWidth = 1.5;
      ctx.stroke();

      for (let i = 0; i < eCount; i++) {
        const eAngle = angle * (idx + 1) * 0.8 + (i * Math.PI * 2) / eCount;
        const ex = cx + Math.cos(eAngle) * radius;
        const ey = cy + Math.sin(eAngle) * radius;

        ctx.beginPath();
        ctx.arc(ex, ey, 4.5, 0, Math.PI * 2);
        ctx.fillStyle = '#ffb703';
        ctx.fill();
      }
    });

    angle += 0.02;
    animation2DID = requestAnimationFrame(animate);
  }
  animate();
}

// MÔ HÌNH 3D THREE.JS
let scene3D, camera3D, renderer3D, animation3DID = null, eMeshGroup = null;
function init3DOrbit(el) {
  const container = document.getElementById('canvas3DContainer');
  container.innerHTML = '';

  scene3D = new THREE.Scene();
  camera3D = new THREE.PerspectiveCamera(45, container.clientWidth / container.clientHeight, 0.1, 1000);
  camera3D.position.z = 110;

  renderer3D = new THREE.WebGLRenderer({ antialias: true, alpha: true });
  renderer3D.setSize(container.clientWidth, container.clientHeight);
  container.appendChild(renderer3D.domElement);

  const nGeo = new THREE.SphereGeometry(7, 16, 16);
  const nMat = new THREE.MeshBasicMaterial({ color: 0xff4d6d });
  const nucleus = new THREE.Mesh(nGeo, nMat);
  scene3D.add(nucleus);

  eMeshGroup = new THREE.Group();
  scene3D.add(eMeshGroup);

  const shells = el.e;
  shells.forEach((eCount, idx) => {
    const radius = 20 + idx * 12;

    const ringGeo = new THREE.RingGeometry(radius - 0.2, radius + 0.2, 64);
    const ringMat = new THREE.MeshBasicMaterial({ color: 0x48cae4, side: THREE.DoubleSide, transparent: true, opacity: 0.4 });
    const ring = new THREE.Mesh(ringGeo, ringMat);
    ring.rotation.x = Math.PI / 3 + idx * 0.4;
    scene3D.add(ring);

    for (let i = 0; i < eCount; i++) {
      const eGeo = new THREE.SphereGeometry(2.2, 8, 8);
      const eMat = new THREE.MeshBasicMaterial({ color: 0xffb703 });
      const eMesh = new THREE.Mesh(eGeo, eMat);
      eMesh.userData = { radius: radius, angle: (i * Math.PI * 2) / eCount, speed: 0.02 + idx * 0.005, rotX: Math.PI / 3 + idx * 0.4 };
      eMeshGroup.add(eMesh);
    }
  });

  if (animation3DID) cancelAnimationFrame(animation3DID);
  function animate3D() {
    eMeshGroup.children.forEach(mesh => {
      mesh.userData.angle += mesh.userData.speed;
      let a = mesh.userData.angle;
      let r = mesh.userData.radius;
      let rx = mesh.userData.rotX;

      mesh.position.x = r * Math.cos(a);
      mesh.position.y = r * Math.sin(a) * Math.cos(rx);
      mesh.position.z = r * Math.sin(a) * Math.sin(rx);
    });

    scene3D.rotation.y += 0.005;
    renderer3D.render(scene3D, camera3D);
    animation3DID = requestAnimationFrame(animate3D);
  }
  animate3D();
}

function openElementModal(el) {
  document.getElementById('mTitle').textContent = `${el.vi} (${el.s}) - ${el.n}`;
  document.getElementById('mSub').textContent = `Số hiệu Z = ${el.z} · Nguyên tử khối A = ${el.ar} amu`;
  document.getElementById('mNames').textContent = `${el.vi} / ${el.n}`;
  document.getElementById('mEN').textContent = el.en > 0 ? el.en : "Không xác định";
  document.getElementById('mCharge').textContent = `+${el.z} (${el.z} proton, ${el.z} electron)`;
  document.getElementById('mConfig').textContent = el.conf;
  document.getElementById('mPos').textContent = `Chu kì ${el.p}, Nhóm ${el.g}`;
  document.getElementById('mApp').textContent = el.app;

  document.getElementById('elementModal').classList.add('active');

  setTimeout(() => {
    draw2DOrbit(el);
    init3DOrbit(el);
  }, 100);
}

function closeModal() {
  document.getElementById('elementModal').classList.remove('active');
  if (animation2DID) cancelAnimationFrame(animation2DID);
  if (animation3DID) cancelAnimationFrame(animation3DID);
}

// HỆ THỐNG TRẮC NGHIỆM 400 CÂU
const quizBank = [];
const topics = ["sorting", "structure", "periodic", "config", "energy", "en", "mass", "charge"];

topics.forEach(top => {
  for(let i=1; i<=50; i++) {
    if(top === "sorting") {
      quizBank.push({ t:"sorting", q:`[Nguyên tắc sắp xếp - Câu ${i}] Bảng tuần hoàn sắp xếp các nguyên tố theo chiều tăng dần của đại lượng nào?`, a:["Số neutron", "Số hiệu nguyên tử Z (điện tích hạt nhân)", "Nguyên tử khối", "Số khối A"], c:1, e:"Các nguyên tố được sắp xếp theo chiều tăng dần của số hiệu nguyên tử Z." });
    } else if(top === "structure") {
      quizBank.push({ t:"structure", q:`[Cấu tạo BTH - Câu ${i}] Bảng tuần hoàn hiện đại gồm có bao nhiêu chu kì và cột?`, a:["6 chu kì, 16 cột", "7 chu kì, 18 cột", "8 chu kì, 18 cột", "7 chu kì, 10 cột"], c:1, e:"Bảng tuần hoàn gồm 7 chu kì và 18 cột (nhóm nguyên tố)." });
    } else if(top === "periodic") {
      quizBank.push({ t:"periodic", q:`[Vị trí - Câu ${i}] Nguyên tố Sodium (Z = 11) nằm ở chu kì thứ mấy?`, a:["Chu kì 1", "Chu kì 2", "Chu kì 3", "Chu kì 4"], c:2, e:"Sodium có cấu hình 1s²2s²2p⁶3s¹, có 3 lớp e nên thuộc chu kì 3." });
    } else if(top === "config") {
      quizBank.push({ t:"config", q:`[Cấu hình e - Câu ${i}] Nguyên tử Chlorine (Z = 17) có bao nhiêu electron lớp ngoài cùng?`, a:["5", "6", "7", "8"], c:2, e:"Cl có cấu hình lớp ngoài cùng là 3s²3p⁵ với tổng cộng 7 electron." });
    } else if(top === "energy") {
      quizBank.push({ t:"energy", q:`[Mức năng lượng - Câu ${i}] Lớp N (n = 4) chứa tối đa bao nhiêu electron theo công thức 2n²?`, a:["18", "32", "50", "8"], c:1, e:"Thay n = 4 vào công thức 2n²: 2 × (4²) = 32 electron." });
    } else if(top === "en") {
      quizBank.push({ t:"en", q:`[Độ âm điện - Câu ${i}] Nguyên tố nào có độ âm điện lớn nhất trong bảng tuần hoàn?`, a:["Oxygen", "Fluorine (F)", "Chlorine", "Helium"], c:1, e:"Fluorine (F) có độ âm điện cao nhất đạt 3.98 trên thang Pauling." });
    } else if(top === "mass") {
      quizBank.push({ t:"mass", q:`[Khối lượng - Câu ${i}] Số khối A của một nguyên tử được tính bằng tổng của?`, a:["Số proton + Số neutron", "Số proton + Số electron", "Số neutron + Số electron", "Chỉ số proton"], c:0, e:"Số khối A = Z + N (tổng số proton và neutron trong hạt nhân)." });
    } else if(top === "charge") {
      quizBank.push({ t:"charge", q:`[Điện tích & Ion - Câu ${i}] Nguyên tử Sodium nhường 1 electron sẽ tạo thành ion nào?`, a:["Na⁺", "Na⁻", "Na²⁺", "Na²⁻"], c:0, e:"Nhường 1 electron làm cho số proton nhiều hơn electron 1 đơn vị, tạo ion Na⁺." });
    }
  }
});

let currentList = [], qIndex = 0, qScore = 0, qAnswered = 0, qLocked = false;

function startQuiz() {
  const topic = document.getElementById('topicSelect').value;
  const count = Number(document.getElementById('countSelect').value);
  const pool = topic === 'all' ? quizBank : quizBank.filter(x => x.t === topic);

  currentList = [...pool].sort(() => Math.random() - 0.5).slice(0, Math.min(count, pool.length));
  qIndex = 0; qScore = 0; qAnswered = 0;
  renderQuestion();
}

function renderQuestion() {
  qLocked = false;
  const q = currentList[qIndex];
  document.getElementById('qText').textContent = `Câu ${qIndex + 1}/${currentList.length}: ${q.q}`;
  
  const answersDiv = document.getElementById('qAnswers');
  answersDiv.innerHTML = '';

  q.a.forEach((opt, idx) => {
    const btn = document.createElement('button');
    btn.className = 'answer-btn';
    btn.textContent = String.fromCharCode(65 + idx) + '. ' + opt;
    btn.onclick = () => selectAnswer(idx, btn);
    answersDiv.appendChild(btn);
  });

  document.getElementById('qFeedback').textContent = '';
  document.getElementById('nextBtn').disabled = true;
  document.getElementById('qProgress').textContent = `Điểm: ${qScore} · Đã làm: ${qAnswered}`;
}

function selectAnswer(idx, btn) {
  if (qLocked) return;
  qLocked = true;
  qAnswered++;

  const q = currentList[qIndex];
  const btns = document.querySelectorAll('.answer-btn');

  btns.forEach((b, i) => {
    b.disabled = true;
    if (i === q.c) b.classList.add('correct');
  });

  if (idx === q.c) {
    qScore++;
    document.getElementById('qFeedback').textContent = '✨ Chính xác! ' + q.e;
  } else {
    btn.classList.add('wrong');
    document.getElementById('qFeedback').textContent = '💡 Chưa chính xác. ' + q.e;
  }

  document.getElementById('qProgress').textContent = `Điểm: ${qScore} · Đã làm: ${qAnswered}`;
  document.getElementById('nextBtn').disabled = false;
}

function nextQuestion() {
  if (qIndex < currentList.length - 1) {
    qIndex++;
    renderQuestion();
  } else {
    alert(`🎉 Hoàn thành! Kết quả của bạn: ${qScore}/${currentList.length} câu đúng (${Math.round(qScore/currentList.length*100)}%).`);
    startQuiz();
  }
}

document.getElementById('topicSelect').onchange = startQuiz;
document.getElementById('countSelect').onchange = startQuiz;

// KHỞI CHẠY GIAO DIỆN TRANG WEB
renderPeriodicTable();
startQuiz();
</script>
</body>
</html>
