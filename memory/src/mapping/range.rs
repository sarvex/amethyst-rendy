use std::{
    ops::Range,
    ptr::NonNull,
    slice::{from_raw_parts, from_raw_parts_mut},
};

/// Get sub-range of memory mapping.
/// `range` and `fitting` are in memory object space.
/// `ptr` points to the `range.start` offset from memory origin.
/// returns pointer to `fitting.start` offset from memory origin
/// if `fitting` is contained in `range`.
pub(crate) fn mapped_sub_range(
    ptr: NonNull<u8>,
    range: Range<u64>,
    fitting: Range<u64>,
) -> Option<NonNull<u8>> {
    if fitting.start < range.start || fitting.end > range.end {
        None
    } else {
        Some(unsafe {
            // for x > 0 and y >= 0: x + y > 0. No overflow due to checks above.
            NonNull::new_unchecked(
                (ptr.as_ptr() as usize + (fitting.start - range.start) as usize) as *mut u8,
            )
        })
    }
}

/// # Safety
///
/// User must ensure that:
/// * this function won't create aliasing slices.
/// * returned slice doesn't outlive mapping.
/// * `T` Must be plain-old-data type compatible with data in mapped region.
pub(crate) unsafe fn mapped_slice_mut<'a, T>(ptr: NonNull<u8>, size: usize) -> &'a mut [T] {
    from_raw_parts_mut(ptr.as_ptr() as *mut T, size)
}

/// # Safety
///
/// User must ensure that:
/// * returned slice doesn't outlive mapping.
/// * `T` Must be plain-old-data type compatible with data in mapped region.
pub(crate) unsafe fn mapped_slice<'a, T>(ptr: NonNull<u8>, size: usize) -> &'a [T] {
    from_raw_parts(ptr.as_ptr() as *const T, size)
}
