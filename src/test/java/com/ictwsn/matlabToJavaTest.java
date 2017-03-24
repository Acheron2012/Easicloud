package com.ictwsn;

import com.mathworks.toolbox.javabuilder.MWException;
import com.mathworks.toolbox.javabuilder.MWNumericArray;
import MIMOGaussianProcess.*;

public class matlabToJavaTest {
	public static void main(String[] args) {
		double[] array = { 74.5, 75.5, 83.3, 93.4, 93.9, 90.1, 86.1, 86.5, 89.6, 96.3, 87.6 };
		MIMOGaussianProcess m = null;
		try {
			m = new MIMOGaussianProcess();
		} catch (MWException e) {
			e.printStackTrace();
		}
		Object[] res=null;
		try {
			res = m.MIMOGaussian(1, array, 3, 3, 3);
		} catch (MWException e) {
			e.printStackTrace();
		}
		MWNumericArray temp = (MWNumericArray)res[0];
		float[]result=temp.getFloatData();
		System.out.println(result[0]);
	}
}
