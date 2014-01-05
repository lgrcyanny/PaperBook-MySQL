$(function () {
  'use strict';
  var refGraph = {
    literatureId: $('input#literature-id').val(),
    literatureTitle: $('h3#literature-title').text(),
    references: JSON.parse(unescape($('input#ref-graph-references').val())),
    cited: JSON.parse(unescape($('input#ref-graph-cited').val())),

    init: function () {
      var graphData = this.formatData();
      this.drawGraph(graphData);
    },

    drawGraph: function (graph) {
      var width = 850,
          height = 350
      var color = d3.scale.category10();

      var svg = d3.select("div#ref-graph").append("svg")
          .attr("width", width)
          .attr("height", height);

      var force = d3.layout.force()
          .gravity(0.05)
          .distance(100)
          .charge(-100)
          .size([width, height]);

      force.linkDistance(function (link) {
        if (link.value === 10) {
          return 50;
        } else {
          return 100;
        }
      });

      force.nodes(graph.nodes)
            .links(graph.links)
            .start();

      var link = svg.selectAll(".link")
          .data(graph.links)
        .enter().append("line")
          .attr("class", "link");

      var node = svg.selectAll(".node")
          .data(graph.nodes)
        .enter().append("g")
          .attr("class", "node")
          .call(force.drag);

      node.append("circle")
      .attr("class", "node")
      .attr("x", -8)
      .attr("y", -8)
      .attr("r", 20)
      .attr("literature-id", function (d) {
        return d.id
      })
      .style("fill", function(d) { return color(d.group); });

      /**
       * Add double click listener
       */
      svg.selectAll('circle.node').on('dblclick', function () {
        var literatureId = d3.select(this).attr('literature-id');
        if (literatureId) {
          window.location.href = "/literatures/detail/" + literatureId;
        }
      });

      node.append("text")
          .attr("dx", -100)
          .attr("dy", "2.25em")
          .text(function(d) { return d.title })
          .attr("fill", function (d) {
            return color(d.group)
          });

      /**
       * Transform the graph each time open the graph
       * @return {[type]} [description]
       */
      force.on("tick", function() {
        link.attr("x1", function(d) { return d.source.x; })
            .attr("y1", function(d) { return d.source.y; })
            .attr("x2", function(d) { return d.target.x; })
            .attr("y2", function(d) { return d.target.y; });

        node.attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; });
      });
    },

    formatData: function () {
      var self = this;
      var graphData = {
        nodes: [],
        links: []
      }
      graphData.nodes.push({
        title: self.literatureTitle,
        group: 1
      });

      graphData.nodes.push({
        title: self.literatureTitle,
        group: 1
      });

      graphData.links.push({
        source: 0,
        target: 1,
        value: 10
      })

      graphData.links.push({
        source: 1,
        target: 0,
        value: 10
      })

      for (var i = 0; i < this.references.length; i++) {
        var refItem = this.references[i];
        refItem.group = 2;
        graphData.links.push({
          source: 0,
          target: graphData.nodes.length,
          value: 5
        });
        graphData.nodes.push(refItem);
      }

      for (var i = 0; i < this.cited.length; i++) {
        var citedItem = this.cited[i];
        citedItem.title = '[' + citedItem.id + ']-' + citedItem.title
        citedItem.group = 3;
        graphData.links.push({
          source: graphData.nodes.length,
          target: 1,
          value: 5
        });
        graphData.nodes.push(citedItem);
      }
      console.log(graphData);
      return graphData;
    }
  }
  refGraph.init();
})