package pdf;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.BarRenderer;
import org.jfree.data.category.DefaultCategoryDataset;
import java.awt.*;
import java.util.List;

// For Nilo ------------------------------------------------------------------------------------------------------


public class Graph {


    /**
     * A method to generate a graph from a List of Manual Update Objects
     *
     * @param graphData
     * @return
     */
    public static JFreeChart generateGraph(List<ManualUpdate> graphData) {

        DefaultCategoryDataset dataSet = new DefaultCategoryDataset();

        //Iterates through user data and sets the values into dataset for graph
        for (ManualUpdate element : graphData) {
            dataSet.setValue(element.balance_cal, "Balance Calorie", element.getTod());
        }

        JFreeChart chart = ChartFactory.createBarChart(
                "Calories Left to Burn", "Day of the Week", "Calories",
                dataSet, PlotOrientation.VERTICAL, false, true, false);


        //Setting Background and Title of Graph
        chart.setTitle("A chart to show user progress");
        chart.setBackgroundPaint(Color.white);

        CategoryPlot plot = chart.getCategoryPlot();

        //Setting gridlines to black
        plot.setRangeGridlinePaint(Color.BLACK);

        BarRenderer renderer = (BarRenderer) plot.getRenderer();
        //Setting Bar colour
        renderer.setSeriesPaint(0, Color.black);

        return chart;
    }

}
