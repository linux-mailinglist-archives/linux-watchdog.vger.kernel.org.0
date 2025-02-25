Return-Path: <linux-watchdog+bounces-3001-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 959CCA43D0B
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Feb 2025 12:13:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6CCD179384
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Feb 2025 11:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74C3A267F48;
	Tue, 25 Feb 2025 11:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k5FEkeRd"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD70267B71;
	Tue, 25 Feb 2025 11:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740481225; cv=none; b=YDERoDEHqVT/kNNSZnAiDZ1Py+PxBQHo2JqVAGl9MHXX/X8cXl515H415ju0E1cP3zXzBp0d8jvzxQmgfALp29e109/V511EmE7RWOiMDwuuBZ+SClm8dy736biG2Rd5XNXdipIXhtfcwVs8sRR7Dpw4AskKgTQMUv3dcgsJrak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740481225; c=relaxed/simple;
	bh=J1HWkZJkiWOegQfp5vHIqN+whL/4IGe+JzHch6uSDhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fxvbRZK2Bu0Ikh3Gm41lo7BGWqHPtT+7FKoswqPfmKhqO37kHS09z9vu3owic/2XaovovyX8jqQcmfGoTk+Nqh3xHmTRIoNoIvaixfiEt8aCpiS9/Pd7o4QZBOH3TrZkfjrq7pP2XVktgE0LoJA4PCcYnRE0YYZVIC+yzI049no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k5FEkeRd; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740481224; x=1772017224;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J1HWkZJkiWOegQfp5vHIqN+whL/4IGe+JzHch6uSDhM=;
  b=k5FEkeRd3zMogToEymcl2ViDiFGVnWactS7FbzVePQIPGxbnfbJ557mL
   fIeLCEVynlOgMzjXjQZ/0kNCZTtMGxX5VU5zoqBPWeh6GFrX1/p6LVb7L
   d8J6JrjAycXpGH8qBPZJ/SnEbVUt4GbNbBDiWYee2yOVN7z17HdkTpjx1
   2a9w09ncP5+H5PglEf8lbMlNmHgS0duNYG4sGj/NxQEsem8gFvYIBibOM
   Y/NCuuR/0WnIWVrINZvnsimXRSNt7HgCLlMtVXpqLqez96kXHY3Uec+MB
   9Q9PFY2H4W+EITbDqyrb10sJEYhQ1gZlA6T1Gze2cG/hIvBfx2F9CT780
   g==;
X-CSE-ConnectionGUID: i2Fb9CGFSGOOcAvkb1zP/g==
X-CSE-MsgGUID: V5BhLf/yTdSh80tmxi0HHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="58821997"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="58821997"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 03:00:23 -0800
X-CSE-ConnectionGUID: VKcO8oSbTdGI6udia3EFxg==
X-CSE-MsgGUID: jyifJL4kRbGD9sqL2GIF/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="153538303"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 03:00:22 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tmsfi-0000000Ext0-47Ej;
	Tue, 25 Feb 2025 13:00:18 +0200
Date: Tue, 25 Feb 2025 13:00:18 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH v1 1/1] watchdog: nic7018_wdt: tidy up ACPI ID table
Message-ID: <Z72iwgbvlYFCz5q0@smile.fi.intel.com>
References: <20250225095804.360899-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225095804.360899-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Feb 25, 2025 at 11:58:04AM +0200, Andy Shevchenko wrote:
> Tidy up ACPI ID table:
> - drop ACPI_PTR() and hence replace acpi.h with mod_devicetable.h
> - remove explicit driver_data initializer
> - drop comma in the terminator entry
> 
> With that done, extend compile test coverage.

...

>  config NIC7018_WDT
>  	tristate "NIC7018 Watchdog"
> -	depends on X86 && ACPI
> +	depends on HAS_IOMEM

Oh, this should be HAS_IOPORT, compiling on X86 won't help to find this issue
:-)

> +	depends on ACPI || COMPILE_TEST
>  	select WATCHDOG_CORE

-- 
With Best Regards,
Andy Shevchenko



