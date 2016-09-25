#include <iostream>
#include <stdio.h>
#include <cmath>
#include <forward_list>
#include <GL/glut.h>

using namespace std;
forward_list<int> lane;

void myInit()
{ 

	glClearColor(0.0, 0.0, 0.0, 0.0);
 
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	glOrtho(-10.0, 10.0, -15.0, 15.0, -10.0, 10.0);
	//gluOrtho2D(0.0, 300.0, 0.0, 450.0);
	glMatrixMode(GL_MODELVIEW);
}
void drawColoredCube()
{
	/*Draw a unit cube with specified colour of surfaces*/
	//glColor4f(1.0f, 0.0f, 1.0f, 1.0f);
	glBegin(GL_QUADS);
		// Top face
		glVertex3f(1.0 / 2, 1.0 / 2, -1.0 / 2);
		glVertex3f(-1.0 / 2, 1.0 / 2, -1.0 / 2);
		glVertex3f(-1.0 / 2, 1.0 / 2, 1.0 / 2);
		glVertex3f(1.0 / 2, 1.0 / 2, 1.0 / 2);
		// Bottom face
		glVertex3f(1.0 / 2, -1.0 / 2, 1.0 / 2);
		glVertex3f(-1.0 / 2, -1.0 / 2, 1.0 / 2);
		glVertex3f(-1.0 / 2, -1.0 / 2, -1.0 / 2);
		glVertex3f(1.0 / 2, -1.0 / 2, -1.0 / 2);
		// Front face
		glVertex3f(1.0 / 2, 1.0 / 2, 1.0 / 2);
		glVertex3f(-1.0 / 2, 1.0 / 2, 1.0 / 2);
		glVertex3f(-1.0 / 2, -1.0 / 2, 1.0 / 2);
		glVertex3f(1.0 / 2, -1.0 / 2, 1.0 / 2);
		// Back face
		glVertex3f(1.0 / 2, -1.0 / 2, -1.0 / 2);
		glVertex3f(-1.0 / 2, -1.0 / 2, -1.0 / 2);
		glVertex3f(-1.0 / 2, 1.0 / 2, -1.0 / 2);
		glVertex3f(1.0 / 2, 1.0 / 2, -1.0 / 2);
		// Left face
		glVertex3f(-1.0 / 2, 1.0 / 2, 1.0 / 2);
		glVertex3f(-1.0 / 2, 1.0 / 2, -1.0 / 2);
		glVertex3f(-1.0 / 2, -1.0 / 2, -1.0 / 2);
		glVertex3f(-1.0 / 2, -1.0 / 2, 1.0 / 2);
		// Right face
		glVertex3f(1.0 / 2, 1.0 / 2, -1.0 / 2);
		glVertex3f(1.0 / 2, 1.0 / 2, 1.0 / 2);
		glVertex3f(1.0 / 2, -1.0 / 2, 1.0 / 2);
		glVertex3f(1.0 / 2, -1.0 / 2, -1.0 / 2);
	glEnd(); // End of drawing color-cube
}
int listInit()
{
	int pos = 0;
}

void listUpdate( int value )
{
	glTranslatef(0.1f, -0.1f, 0.0f);
	glutSwapBuffers();
}

void drawCube()
{
	glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
	glColor4f(0.0, 0.0, 0.0, 0.0);
	drawColoredCube();
	glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
	glEnable(GL_POLYGON_OFFSET_FILL);
	glPolygonOffset(0.75, 1.0);
	glColor4f(1.0f, 1.0f, 0.0f, 1.0f);
	drawColoredCube();
	glDisable(GL_POLYGON_OFFSET_FILL);
}

void processNormalKeys(unsigned char key, int xx, int yy) 
{ 	
	switch( key )
	{
		case 27: exit(0);
	}
} 

void renderScene(void)
{

	// Clear Color and Depth Buffers
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

	
	// Reset transformations
	//glLoadIdentity();
	// Set the camera
	//gluLookAt(	5.0f, 5.0f, 5.0f,          0.0f, 0.0f,  0.0f,			0.0f, 1.0f,  0.0f);
	
	glPushMatrix();

		glRotatef(-45.0, 0.0, 1.0, 0.0);
		glRotatef(-45.0, -1.0, 0.0, 1.0);
		glScalef(2.0,4.0,2.0);

		drawCube();
		
	    glTranslatef(1.0, 0.0, 0.0);
		drawCube();
		
		glTranslatef(1.0, 0.0, 0.0);
		drawCube();
		
		glTranslatef(1.0, 0.0, 0.0);
		drawCube();

		glTranslatef(1.0, 0.0, 0.0);
		drawCube();

		glTranslatef(1.0, 0.0, 0.0);
		drawCube();

		glTranslatef(1.0, 0.0, 0.0);
		drawCube();

	glPopMatrix();	
	glutSwapBuffers();
}

int main( int argc, char* argv[])
{
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_DEPTH | GLUT_DOUBLE | GLUT_RGBA);
	glutInitWindowPosition(100, 100);
	glutInitWindowSize(200,300);
	glutCreateWindow("ZigZag");
	glEnable(GL_DEPTH_TEST);

	listInit();
	
	glutDisplayFunc(renderScene);
	glutKeyboardFunc(processNormalKeys);
	glutTimerFunc(500, listUpdate, 0);
	
    myInit();
	
	glutMainLoop();
	

	return 0;
}