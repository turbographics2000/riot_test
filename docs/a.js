window['setPos'] = function(elm, pos) {
    var fn, found, offset, sel;
    if (sel = window.getSelection()) {
        offset = 0;
        found = false;
        (fn = function (pos, parent) {
            var node, range, _i, _len, _ref, _results;
            _ref = parent.childNodes;
            _results = [];
            for (_i = 0, _len = _ref.length; _i < _len; _i++) {
                node = _ref[_i];
                if (found) {
                    break;
                }
                if (node.nodeType === 3) {
                    if (offset + node.length >= pos) {
                        found = true;
                        range = document.createRange();
                        range.setStart(node, pos - offset);
                        sel.removeAllRanges();
                        sel.addRange(range);
                        break;
                    } else {
                        _results.push(offset += node.length);
                    }
                } else {
                    _results.push(fn(pos, node));
                }
            }
            return _results;
        })(pos, elm);
    }
};

window['getPos'] = function(elm) {
    var clonedRange, pos, range;
    if (range = getRange()) {
        clonedRange = range.cloneRange();
        clonedRange.selectNodeContents(elm);
        clonedRange.setEnd(range.endContainer, range.endOffset);
        pos = clonedRange.toString().length;
        clonedRange.detach();
        return pos;
    }
};

window['getRange'] = function() {
    var sel;
    if (!window.getSelection) {
        return;
    }
    sel = window.getSelection();
    if (sel.rangeCount > 0) {
        return sel.getRangeAt(0);
    } else {
        return null;
    }
}
