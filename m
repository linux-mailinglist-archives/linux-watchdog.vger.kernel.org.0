Return-Path: <linux-watchdog+bounces-316-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F19FC811BAF
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Dec 2023 18:58:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E6CBB20E58
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Dec 2023 17:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A7159157;
	Wed, 13 Dec 2023 17:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KfQFvesO"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C6D5109;
	Wed, 13 Dec 2023 09:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702490217; x=1734026217;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wWBjSDS0hOcAuYO+J8WAU83sxVHuAQkD3ZNK981aPV0=;
  b=KfQFvesOC6ci3RTN1OT/mjAzkaXqlNCkoTXVirl0Tztko9MfdLdKNVzZ
   l763Hew9KDplP0sbKPpUDjl3dM7m/+rkPIKdgDtBHvvUo5YFE3pORx3eK
   hTynVDUwsoja8YsggwsDM5C35nUNAP5WvuBkwN2/xodcEOvhjX/y+8RCi
   VNBXS+rlT91jcaxLSl+gFo7E9geBqoGTNNVkgAHwc8iX5UrzsgPU3P4YM
   WzGpIp0lgxOQBzl+CEjlVeKfjIClt7KBTwV5J3Z8JVIhlWmZHeEbMkqQC
   QofnvfTqVwF+ahYRDLDKwScKtbB/pubMiKMAn+POzXNfEP3IoQQprCDR9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="16552109"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="16552109"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 09:56:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="1105389671"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="1105389671"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 09:56:55 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1rDTTY-00000005bHs-2Pqn;
	Wed, 13 Dec 2023 19:56:52 +0200
Date: Wed, 13 Dec 2023 19:56:52 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v6 12/40] watchdog: ep93xx: add DT support for Cirrus
 EP93xx
Message-ID: <ZXnwZHSdxtIaGc3j@smile.fi.intel.com>
References: <20231212-ep93xx-v6-0-c307b8ac9aa8@maquefel.me>
 <20231212-ep93xx-v6-12-c307b8ac9aa8@maquefel.me>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212-ep93xx-v6-12-c307b8ac9aa8@maquefel.me>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Dec 12, 2023 at 11:20:29AM +0300, Nikita Shubin wrote:
> Add OF ID match table.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



