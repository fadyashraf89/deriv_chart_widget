import "package:flutter/material.dart";

class GranularityButton extends StatefulWidget {
  final Function(int) onGranularityChanged;
  final List<int> granularities;
  final ButtonStyle? buttonStyle;

  const GranularityButton({
    super.key,
    required this.onGranularityChanged,
    required this.granularities,
    this.buttonStyle,
  });

  @override
  State<GranularityButton> createState() => _GranularityButtonState();
}

class _GranularityButtonState extends State<GranularityButton> {
  late int _selectedGranularity;


  @override
  void initState() {
    super.initState();
    _selectedGranularity = widget.granularities.first;
  }

  String getGranularityLabel(int granularity) {
    switch (granularity) {
      case 0:
        return '1 Tick';
      case 5:
        return '5 Seconds';
      case 10:
        return '10 Seconds';
      case 15:
        return '15 Seconds';
      case 30:
        return '30 Seconds';
      case 60:
        return '1 Minute';
      case 120:
        return '2 Minutes';
      case 180:
        return '3 Minutes';
      case 300:
        return '5 Minutes';
      case 900:
        return '15 Minutes';
      case 1800:
        return '30 Minutes';
      case 3600:
        return '1 Hour';
      case 7200:
        return '2 Hours';
      case 14400:
        return '4 Hours';
      case 21600:
        return '6 Hours';
      case 43200:
        return '12 Hours';
      case 86400:
        return '1 Day';
      case 604800:
        return '1 Week';
      case 2592000:
        return '1 Month';
      case 31536000:
        return '1 Year';
      case 63072000:
        return '2 Years';
      case 94608000:
        return '3 Years';
      case 157680000:
        return '5 Years';
      case 315360000:
        return '10 Years';
      case 630720000:
        return '20 Years';
      case 1576800000:
        return '50 Years';
      case 3153600000:
        return '100 Years';
      default:
        return 'Unknown Granularity';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5.0,
      children: widget.granularities.map((int granularity) {
        return ElevatedButton(
          style: widget.buttonStyle ??
              ElevatedButton.styleFrom(
                backgroundColor:
                _selectedGranularity == granularity ? Colors.blue : Colors.grey[300],
                foregroundColor: _selectedGranularity == granularity ? Colors.white : Colors.black,
              ),
          onPressed: () {
            setState(() {
              _selectedGranularity = granularity;
            });
            widget.onGranularityChanged(granularity);
          },
          child: Text(getGranularityLabel(granularity)),
        );
      }).toList(),
    );
  }
}
