#ifndef TGUI_H
#define TGUI_H

#include <vector>

#include <allegro.h>

const int TGUI_KEYFLAG_LSHIFT = 1;
const int TGUI_KEYFLAG_RSHIFT = 2;
const int TGUI_KEYFLAG_SHIFT = 4; // left or right
const int TGUI_KEYFLAG_LCONTROL = 8;
const int TGUI_KEYFLAG_RCONTROL = 16;
const int TGUI_KEYFLAG_CONTROL = 32; // left or right
const int TGUI_KEYFLAG_LALT = 64;
const int TGUI_KEYFLAG_RALT = 128;
const int TGUI_KEYFLAG_ALT = 256; // left or right

const int TGUI_MOUSE_LEFT = 1;
const int TGUI_MOUSE_RIGHT = 2;
const int TGUI_MOUSE_MIDDLE = 4;

const int TGUI_CONTINUE = 0;
const int TGUI_RETURN = 1;

const int TGUI_BORDER = 25; // widgets must be at least this much on screen

struct TGUIPoint {
	int x;
	int y;
};

struct TGUIRect {
	int x1;
	int y1;
	int x2;
	int y2;
};

class TGUIWidget {
public:
	int getX() { return x; }
	int getY() { return y; }
	int getRelativeX() { return relativeX; }
	int getRelativeY() { return relativeY; }
	int getWidth() { return width; }
	int getHeight() { return height; }
	TGUIWidget* getParent() { return parent; }
	std::vector<int>* getHotkeys() { return hotkeys; }
	bool getFocus() { return focus; }
	void setX(int newX) { x = newX; }
	void setY(int newY) { y = newY; }
	void setRelativeX(int rx) { relativeX = rx; }
	void setRelativeY(int ry) { relativeY = ry; }
	void setWidth(int w) { width = w; }
	void setHeight(int h) { height = h; }
	void setParent(TGUIWidget* p) { parent = p; }
	void setFocus(bool fcs) { focus = fcs; }
	/*
	 * The widget generally draws itself unless
	 * tguiDraw or tguiDrawRect is called.
	 */
	virtual void draw() {}
	/*
	 * Return false to close the current GUI.
	 */
	virtual int update(int millis) { return TGUI_CONTINUE; }
	/*
	 * The mouse was clicked on the widget.
	 * tguiActiveWidgetClickedPoint holds the position of the
	 * click relative to the widget. tguiMouseButton is the
	 * mouse button that was pressed.
	 */
	virtual void mouseDown() {}
	/*
	 * Called when the mouse is released after being pressed
	 * on the widget. x and y are relative to the widget or
	 * < 0 if the mouse was released outside the widget.
	 * In any case, the position of the mouse release in
	 * screen coordinates is stored in tguiMouseReleasePoint.
	 */
	virtual void mouseUp(int x, int y) {}
	/*
	 * Gets passed the result of readkey(), return false
	 * to push the key back into the key buffer
	 */
	virtual bool handleKey(int key) { return false; }
	virtual void handleHotkey(int hotkey) {}
	virtual bool acceptsFocus() { return false; }
	virtual bool acceptsHover() { return false; }
	TGUIWidget() { focus = false; }
	virtual ~TGUIWidget() {}
protected:
	int x;
	int y;
	int relativeX; // relative to parent (set automatically)
	int relativeY;
	int width;
	int height;
	TGUIWidget* parent;
	std::vector<int>* hotkeys;
	bool focus;
};

extern TGUIWidget* tguiActiveWidget;
extern TGUIPoint tguiActiveWidgetClickedPoint; // relative to widget
extern TGUIRect tguiDirtyRectangle;
extern BITMAP* tguiBitmap;

extern bool tguiPointOnWidget(TGUIWidget* widget, int x, int y);
extern long tguiCurrentTimeMillis();
extern void tguiInit(BITMAP* dest);
extern void tguiShutdown();
extern void tguiSetFocus(int widget);
extern void tguiSetFocus(TGUIWidget* widget);
extern TGUIWidget* tguiGetFocus();
extern void tguiFocusPrevious();
extern void tguiFocusNext();
extern void tguiDeleteActive();
extern void tguiTranslateAll(int x, int y);
extern void tguiTranslateWidget(TGUIWidget* parent, int x, int y);
extern void tguiAddWidget(TGUIWidget* widget);
extern TGUIWidget* tguiUpdate();
extern void tguiHandleKeys();
extern void tguiWakeUp();
extern void tguiDraw();
extern void tguiDrawRect(int x1, int y1, int x2, int y2);
extern void tguiPush();
extern bool tguiPop();
extern int tguiCreateHotkey(int flags, int key);
extern void tguiLowerChildren(TGUIWidget* parent);
extern void tguiRaiseChildren(TGUIWidget* parent);
extern void tguiRaiseSingleWidget(TGUIWidget* widget);
extern void tguiLowerSingleWidget(TGUIWidget* widget);
extern void tguiRaiseWidget(TGUIWidget* widget);
extern void tguiLowerWidget(TGUIWidget* widget);
extern bool tguiScreenIsDirty();
extern void tguiClearDirtyRectangle();
extern void tguiUpdateDirtyRectangle(int x1, int y1, int x2, int y2);
extern void tguiMakeDirty(TGUIWidget* widget);
extern void tguiDeleteWidget(TGUIWidget* widget);
extern void tguiSetParent(TGUIWidget* parent);
extern bool tguiWidgetIsActive(TGUIWidget* widget);
extern void tguiCenterWidget(TGUIWidget* widget, int x, int y);
extern TGUIWidget* tguiGetActiveWidget();
extern void tguiMakeFresh();
extern bool tguiWidgetIsChildOf(TGUIWidget* widget, TGUIWidget* parent);

#endif
