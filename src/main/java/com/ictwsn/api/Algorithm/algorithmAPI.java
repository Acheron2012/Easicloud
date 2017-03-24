package com.ictwsn.api.Algorithm;

import org.apache.commons.math3.stat.descriptive.moment.Mean;
import org.apache.commons.math3.stat.descriptive.rank.Max;
import org.apache.commons.math3.stat.descriptive.rank.Min;
import com.mathworks.toolbox.javabuilder.MWNumericArray;

import GaussianProcessPrediction.GaussianProcessPrediction;
import MIMOGaussianProcess.MIMOGaussianProcess;

import org.apache.commons.math3.stat.correlation.PearsonsCorrelation;
import org.apache.commons.math3.stat.correlation.SpearmansCorrelation;

public class algorithmAPI {
	public static void main(String[] args) {
	}

	public static double getMean(double[] nums) {
		Mean mean = new Mean();
		return mean.evaluate(nums);

	}

	public static double getMax(double[] nums) {
		Max max = new Max();
		return max.evaluate(nums);

	}

	public static double getMin(double[] nums) {
		Min min = new Min();
		return min.evaluate(nums);

	}

	public static double getPearsonsCorrelation(double[] nums1, double[] nums2) {
		double res = new PearsonsCorrelation().correlation(nums1, nums2);
		return res;

	}

	public static double getSpearmansCorrelation(double[] nums1, double[] nums2) {
		double res = new SpearmansCorrelation().correlation(nums1, nums2);
		return res;

	}

	public static double[] getMimoGaussianProcess(double[] nums, int h, int step, int horizon) {
		MIMOGaussianProcess m = null;
		try {
			m = new MIMOGaussianProcess();
		} catch (Exception e) {
			// e.printStackTrace();
		}
		Object[] res = null;
		try {
			res = m.MIMOGaussian(1, nums,h,step,horizon);
		} catch (Exception e) {
			e.printStackTrace();
		}
		MWNumericArray temp = (MWNumericArray) res[0];
		double[] result = new double[horizon];
		for (int i = 0; i < horizon; i++)
			result[i] = temp.getDoubleData()[i];
		return result;

	}
	public static double[] getGaussianProcess(double[]nums ,int h,int horizon){
		GaussianProcessPrediction gp=null;
		try {
			gp = new GaussianProcessPrediction();
		} catch (Exception e) {
			// e.printStackTrace();
		}
		Object[] res = null;
		try {
			res = gp.GaussianProcess(1, nums,h,horizon);
		} catch (Exception e) {
			e.printStackTrace();
		}
		MWNumericArray temp = (MWNumericArray) res[0];
		double[] result = new double[horizon];
		for (int i = 0; i < horizon; i++)
			result[i] = temp.getDoubleData()[i];
		return result;
	}
}
