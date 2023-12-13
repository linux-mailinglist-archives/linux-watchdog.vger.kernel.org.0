Return-Path: <linux-watchdog+bounces-318-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5D4811BFE
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Dec 2023 19:10:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29B102828C4
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Dec 2023 18:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2CB459548;
	Wed, 13 Dec 2023 18:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dHdCrEBv"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9DFEAF;
	Wed, 13 Dec 2023 10:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702491014; x=1734027014;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jlsFvOzyqT4lCeHgccX9klrASV6AvbefBdhu1S+ikBs=;
  b=dHdCrEBvzgC3EGwbHds0nRpwvBL4ruXJn8y8W1zShvz4XUWGkuhxzSja
   /2whvIGM3d1wlIOKAU29Q3tk4cFM0vr+m5Ldg9EjX95JjjxL4oj6gvDsp
   T3+3fDcJIhoH+5ZEu6U/wK2c97WAPJO4NHJRGfekQBVr6b04wyHhWq5yv
   if4mjlpIBbv6Q92QN4OMBiisGNlG7moIs/D+l4mn3pNR1PJ9fvtR+u4Vy
   4u6Vxsjo8KYWZZOa3f3LWYYOpOOArmjTx3FgNtDZnVMQ68fXGV7fLTXnf
   HaCo2+gWR+KsfkFFyQSbznVYVtrocYlWV9ynIFVToK+kVe0YsjY/ALP8M
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="385421502"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="385421502"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 10:10:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="864710906"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="864710906"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 10:10:13 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rDTgQ-00000005bZA-2AaS;
	Wed, 13 Dec 2023 20:10:10 +0200
Date: Wed, 13 Dec 2023 20:10:10 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v6 26/40] wdt: ts72xx: add DT support for ts72xx
Message-ID: <ZXnzgo5Bv3Wgfmpp@smile.fi.intel.com>
References: <20231212-ep93xx-v6-0-c307b8ac9aa8@maquefel.me>
 <20231212-ep93xx-v6-26-c307b8ac9aa8@maquefel.me>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212-ep93xx-v6-26-c307b8ac9aa8@maquefel.me>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Dec 12, 2023 at 11:20:43AM +0300, Nikita Shubin wrote:
> Add OF ID match table.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



